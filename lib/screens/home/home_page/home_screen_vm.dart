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

    Map<String, dynamic> map = jsonDecode(url);
    int bookingId = map['bookingId'];
    int chefId = map['chefId'];

    developer.log(' bookingId parsed is is ' + '${bookingId}');
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

  void processOrder() {
    String data =
        '{"bookingId": 1, "chefId": 1, "foodieId": 45, "experienceId": 8, "verificationCode": 3921 }';

    List dataSplit = data.split(':');
    String rawJson = '{"name":"Mary","age":30}';

    Map<String, dynamic> map = jsonDecode(data);
    int bookingId = map['bookingId'];
    int chefId = map['chefId'];

    developer.log(' bookingId is ' + '${bookingId}');
    // for (var i = 0; i < dataSplit.length; i++) {
    //   developer.log(' Data split ' + '${dataSplit[i]}');
    //   List _split = [];
    //   _split = dataSplit[i].toString().split(',');
    //
    //   for(var j=0;j<)
    //   developer.log(' _Split here is '+ '${_split[]}');
    // }

    Map receiedData = {};
    //receiedData['bookingId'] =
    //
    // var encodedString = jsonEncode(data);
    //
    //
    // dynamic valueMap = json.decode(encodedString);
    //
    //
    // QR qrData = QR.fromJson(valueMap);
    // developer.log(' Qr Data is ' + '${qrData.verificationCode}');

    // String data2 = '{\'id\':1, name: lorem ipsum, address: dolor set amet}';
    //
    // var tagsJson = jsonDecode(data2)['id'];
    //
    // developer.log('Tags JSON is ' + '${tagsJson}');

    // var encodedString2 = jsonEncode(data2);
    //
    // Map<String, dynamic> valueMap2 = json.decode(encodedString2);
    //
    // User user = User.fromJson(valueMap2);
    // Map data =
    //     '{bookingId: 1, chefId: 1, foodieId: 45, experienceId: 8, verificationCode: 3921}'
    //         as Map;

    // final body = json.decode(data);

    // if (data != null) {
    //   developer.log(' Verification code is ' + '${data['verificationCode']}');
    // }
  }

  Future<bool> logoutPopUp(BuildContext context) async =>
      _appService.logoutPopUp(context);
}
