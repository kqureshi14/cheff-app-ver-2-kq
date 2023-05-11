// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../helpers/helpers.dart' as _i10;
import '../../screens/booking/component/order_screen_v.dart' as _i5;
import '../../screens/foodie_profile/component/foodie_profile_decision_screen_v.dart'
    as _i6;
import '../../screens/home/home_page/home_screen_v.dart' as _i4;
import '../../screens/qr_scanner/qr_scanner_screen_v.dart' as _i7;
import '../../screens/screen.dart' as _i1;
import '../../screens/sign_up/get_started_screen_v.dart' as _i2;
import '../../screens/sign_up/sign_up_screen_v.dart' as _i3;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SplashScreen(key: args.key),
      );
    },
    GetStartedRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.GetStartedScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.SignUpScreen(key: args.key),
      );
    },
    HomeRouteView.name: (routeData) {
      final args = routeData.argsAs<HomeRouteViewArgs>(
          orElse: () => const HomeRouteViewArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.HomeScreenView(key: args.key),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.ForgotPasswordScreen(
          baseUrl: args.baseUrl,
          key: args.key,
        ),
      );
    },
    OrderRouteView.name: (routeData) {
      final args = routeData.argsAs<OrderRouteViewArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.OrderScreenView(
          type: args.type,
          key: args.key,
        ),
      );
    },
    FoodieProfileDecisionRouteView.name: (routeData) {
      final args = routeData.argsAs<FoodieProfileDecisionRouteViewArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.FoodieProfileDecisionScreenView(
          bookingId: args.bookingId,
          key: args.key,
        ),
      );
    },
    QrScannerRoute.name: (routeData) {
      final args = routeData.argsAs<QrScannerRouteArgs>(
          orElse: () => const QrScannerRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.QrScannerScreen(key: args.key),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          GetStartedRoute.name,
          path: '/get_started_screen',
        ),
        _i8.RouteConfig(
          SignUpRoute.name,
          path: '/signUp',
        ),
        _i8.RouteConfig(
          HomeRouteView.name,
          path: '/home',
        ),
        _i8.RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgotPassword',
        ),
        _i8.RouteConfig(
          OrderRouteView.name,
          path: '/order_screen/:type',
        ),
        _i8.RouteConfig(
          FoodieProfileDecisionRouteView.name,
          path: '/foodie_decision_pending/:bookingId',
        ),
        _i8.RouteConfig(
          QrScannerRoute.name,
          path: '/qr_scanner',
        ),
        _i8.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({_i10.Key? key})
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(key: key),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.GetStartedScreen]
class GetStartedRoute extends _i8.PageRouteInfo<void> {
  const GetStartedRoute()
      : super(
          GetStartedRoute.name,
          path: '/get_started_screen',
        );

  static const String name = 'GetStartedRoute';
}

/// generated route for
/// [_i3.SignUpScreen]
class SignUpRoute extends _i8.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({_i10.Key? key})
      : super(
          SignUpRoute.name,
          path: '/signUp',
          args: SignUpRouteArgs(key: key),
        );

  static const String name = 'SignUpRoute';
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomeScreenView]
class HomeRouteView extends _i8.PageRouteInfo<HomeRouteViewArgs> {
  HomeRouteView({_i10.Key? key})
      : super(
          HomeRouteView.name,
          path: '/home',
          args: HomeRouteViewArgs(key: key),
        );

  static const String name = 'HomeRouteView';
}

class HomeRouteViewArgs {
  const HomeRouteViewArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'HomeRouteViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i8.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    required String baseUrl,
    _i10.Key? key,
  }) : super(
          ForgotPasswordRoute.name,
          path: '/forgotPassword',
          args: ForgotPasswordRouteArgs(
            baseUrl: baseUrl,
            key: key,
          ),
        );

  static const String name = 'ForgotPasswordRoute';
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({
    required this.baseUrl,
    this.key,
  });

  final String baseUrl;

  final _i10.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{baseUrl: $baseUrl, key: $key}';
  }
}

/// generated route for
/// [_i5.OrderScreenView]
class OrderRouteView extends _i8.PageRouteInfo<OrderRouteViewArgs> {
  OrderRouteView({
    required String type,
    _i10.Key? key,
  }) : super(
          OrderRouteView.name,
          path: '/order_screen/:type',
          args: OrderRouteViewArgs(
            type: type,
            key: key,
          ),
        );

  static const String name = 'OrderRouteView';
}

class OrderRouteViewArgs {
  const OrderRouteViewArgs({
    required this.type,
    this.key,
  });

  final String type;

  final _i10.Key? key;

  @override
  String toString() {
    return 'OrderRouteViewArgs{type: $type, key: $key}';
  }
}

/// generated route for
/// [_i6.FoodieProfileDecisionScreenView]
class FoodieProfileDecisionRouteView
    extends _i8.PageRouteInfo<FoodieProfileDecisionRouteViewArgs> {
  FoodieProfileDecisionRouteView({
    required String bookingId,
    _i10.Key? key,
  }) : super(
          FoodieProfileDecisionRouteView.name,
          path: '/foodie_decision_pending/:bookingId',
          args: FoodieProfileDecisionRouteViewArgs(
            bookingId: bookingId,
            key: key,
          ),
        );

  static const String name = 'FoodieProfileDecisionRouteView';
}

class FoodieProfileDecisionRouteViewArgs {
  const FoodieProfileDecisionRouteViewArgs({
    required this.bookingId,
    this.key,
  });

  final String bookingId;

  final _i10.Key? key;

  @override
  String toString() {
    return 'FoodieProfileDecisionRouteViewArgs{bookingId: $bookingId, key: $key}';
  }
}

/// generated route for
/// [_i7.QrScannerScreen]
class QrScannerRoute extends _i8.PageRouteInfo<QrScannerRouteArgs> {
  QrScannerRoute({_i10.Key? key})
      : super(
          QrScannerRoute.name,
          path: '/qr_scanner',
          args: QrScannerRouteArgs(key: key),
        );

  static const String name = 'QrScannerRoute';
}

class QrScannerRouteArgs {
  const QrScannerRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'QrScannerRouteArgs{key: $key}';
  }
}
