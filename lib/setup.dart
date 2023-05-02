import 'dart:io';
import 'package:chef/services/renderer/field_renderer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

import 'package:chef/services/services.dart';
import 'package:chef/theme/theme.dart';
import 'package:chef/setup.config.dart';

final getIt = GetIt.instance;

Future<dynamic> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = DevHttpOverrides(); // to ignore ssl certification
  pushNotificationInitialization();
  return $initGetIt(getIt);
}

T locateService<T extends Object>() => getIt.get<T>();

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
FirebaseMessaging messaging = FirebaseMessaging.instance;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message: ${message.messageId}");
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<dynamic> pushNotificationInitialization()async{
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint('Message also contained a notification: ${message.notification}');
    }
  });
  FirebaseMessaging.instance.getToken().then((token) {
    debugPrint("FCM token is $token");
  });

  FirebaseMessaging.instance.onTokenRefresh.listen((token) {
    debugPrint("FCM token refreshed: $token");
    // Update your app's server with the new token here
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      // Display the notification
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
      var androidDetails = const AndroidNotificationDetails(
          'channelId',
          'Local Notification',
          'This is the description of the notification',
          importance: Importance.high);
      var platformDetails = new NotificationDetails(android: androidDetails);
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        platformDetails,
        payload: message.data.toString(),
      );
    }
  });
  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ),
  );
}

@module
abstract class RegisterModule {
  static final _appRouter = AppRouter();

  final _navigationService = NavigationService(_appRouter.navigatorKey);

  final _deviceService = DeviceServiceImpl();

  @singleton
  IDeviceService get deviceService => _deviceService;

  @Injectable(as: Key)
  UniqueKey get key;

  @singleton
  IAppThemeData get theme => DefaultTheme();

  @preResolve
  Future<IStorageService> get sharedPreferences async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return SharedPrefs(sharedPreferences: sharedPreferences);
  }

  @singleton
  INavigationService get navigationService => _navigationService;

  @preResolve
  Future<INetworkService> get network async => NetworkCall(
        client: Client(),
        storage: await sharedPreferences,
        appService: await appService,
      );

  @singleton
  AppRouter get appRouter => _appRouter;

  @singleton
  IRendererService get fieldRendererService => FieldRenderer();

  @preResolve
  Future<ApplicationService> get appService async => ApplicationService(
        navigation: navigationService,
        storage: await sharedPreferences,
      );
}
