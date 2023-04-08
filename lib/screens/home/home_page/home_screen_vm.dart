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
        InfininURLHelpers.getRestApiURL(Api.baseURL + Api.bookingsByChefId);
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

  Future<bool> logoutPopUp(BuildContext context) async =>
      _appService.logoutPopUp(context);
}
