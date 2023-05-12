import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:chef/base/base.dart';
import 'package:chef/constants/constants.dart';
import 'package:chef/helpers/enum_helper.dart';
import 'package:chef/models/home_screen_model.dart';
import 'package:chef/services/services.dart';
import 'package:chef/screens/home/home_page/home_screen_m.dart' as home_model;

import '../../../helpers/url_helper.dart';

import 'package:chef/models/experience/experience_request.dart' as expreq;

import '../../../../helpers/experience_helper.dart';
import '../../../../helpers/helpers.dart';

import '../../../../models/experience/experience_request.dart'
    as experience_request;

import '../../../../models/home/food_menu_request.dart';
import '../../../../setup.dart';
import 'dart:developer' as developer;

import '../../../models/booking/booking_overview.dart';
import '../../../models/booking/process_booking_request.dart' as bookingRequest;
import '../../../models/qr_response.dart';

@injectable
class HomeScreenViewModel extends BaseViewModel<home_model.HomeScreenState> {
  HomeScreenViewModel({
    required INavigationService navigation,
    required IStorageService storage,
    required ApplicationService appService,
    required INetworkService network,
  })  : _navigation = navigation,
        _network = network,
        _storage = storage,
        _appService = appService,
        super(const home_model.Loading()
            //  const Initialized(),
            );

  final INavigationService _navigation;
  final INetworkService _network;
  final IStorageService _storage;
  final ApplicationService _appService;

  HomeScreenModel getUserInfo() {
    final projectName = _storage.readString(key: PreferencesKeys.projectName);
    final customerName = _storage.readString(key: PreferencesKeys.customerName);
    final customerLogo = _storage.readString(key: PreferencesKeys.customerLogo);
    final _bytesImage = const Base64Decoder().convert(
      _storage.readString(
        key: PreferencesKeys.customerLogo,
      ),
    );
    return HomeScreenModel(
      customerImage: _bytesImage,
      customerLogo: customerLogo,
      customerName: customerName,
      projectName: projectName,
    );
  }

  void logout() async {
    _appService.logout();
  }

  Future<void> loadBookingOverview() async {
    final url =
        InfininHelpers.getRestApiURL(Api.baseURL + Api.bookingsByChefId);
    // emit(const Loading());

    final _appService = locateService<ApplicationService>();

    emit(const home_model.Loading());

    final foodMenuRequest = FoodMenuRequest(
      t: int.parse(_appService.state.userInfo!.t.id.toString()),
    ).toJson();

    final response = await _network.post(
      path: url,
      data: foodMenuRequest,
    );

    if (response != null) {
      BookingOverview bookingOverview = bookingOverviewFromJson(response.body);
      emit(home_model.Loaded(bookingOverview));
    }
  }

  void navigateToProjectScreen() async {
    //_navigation.replace(route: ProjectsRoute());
  }

  void navigateToCustomerScreen() async {
    //_navigation.replace(route: CustomerRoute());
  }

  void navigateToDashboardScreen() async {
    // _navigation.replace(route: DashboardRoute());
  }

  void navigateToModulesScreen() async {
    _appService.updateSearchDisplay();
    _appService.updateSelectedNavId(id: NavDrawerItem.module);
    //  _navigation.replace(route: ModulesRoute());
  }

  bool isValidUrl(String url) => Uri.tryParse(url)?.hasAbsolutePath ?? false;

  void scanQr(BuildContext context) async {
    var url = await _navigation.navigateTo(route: QrScannerRoute());
    developer.log('  Data Received is ' + '${url}');

    // Map<String, dynamic> map = jsonDecode(url);
    // int bookingId = map['bookingId'];
    // int chefId = map['chefId'];

    // developer.log(' bookingId parsed is is ' + '${bookingId}');
    processOrder(url);
    if (url != null) {
      url = updateUrl(url);
      if (isValidUrl(url)) {
        // emit(
        //   state.copyWith(
        //     baseURL: url,
        //   ),
        // );
        Toaster.successToast(
          context: context,
          message: '$url',
        );
      } else {
        Toaster.errorToast(
          context: context,
          message: Strings.invalidUrl,
        );
      }
    } else {
      Toaster.errorToast(
        context: context,
        message: Strings.qrNotScanned,
      );
    }
  }

  String updateUrl(String url) {
    if (!url.endsWith('/')) {
      url += '/';
    }
    if (!url.endsWith(Api.client)) {
      url += Api.client;
    }
    return url;
  }

  void processOrder(String jsonString) {
    String jsonWithoutBraces = jsonString.substring(1, jsonString.length - 1);
    List<String> keyValuePairs = jsonWithoutBraces.split(',');

    Map<String, dynamic> jsonMap = {};

    for (String keyValuePair in keyValuePairs) {
      List<String> keyValue = keyValuePair.split(':');
      String key = keyValue[0].trim();
      String value = keyValue[1].trim();

      dynamic parsedValue = int.tryParse(value) ?? value.replaceAll('"', '');
      jsonMap[key] = parsedValue;
    }

    String json = jsonEncode(jsonMap);
    developer.log(' JSOn is ' + '${json}');
    developer.log('Data converted verification code is ' +
        '${jsonMap['verificationCode']}');
    processBooking(jsonMap);
  }

  Future<bool> logoutPopUp(BuildContext context) async =>
      _appService.logoutPopUp(context);

  Future<void> processBooking(
      Map<String, dynamic> processBookingDetails) async {
    final url = InfininHelpers.getRestApiURL(Api.baseURL + Api.processBooking);
    // emit(const Loading());

    final _appService = locateService<ApplicationService>();

    emit(const home_model.Loading());

    final bookingData = bookingRequest.ProcessBookingRequest(
        t: bookingRequest.T(
      bookingId: processBookingDetails['bookingId'],
      experienceId: processBookingDetails['experienceId'],
      chefId: processBookingDetails['chefId'],
      foodieId: processBookingDetails['foodieId'],
      verificationCode: processBookingDetails['verificationCode'],
    )).toJson();

    final response = await _network.post(
      path: url,
      data: bookingData,
    );

    if (response != null) {
      // BookingOverview bookingOverview = bookingOverviewFromJson(response.body);
      // emit(home_model.Loaded(bookingOverview));
    }
  }
}
