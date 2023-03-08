import 'package:chef/helpers/helpers.dart';

import '../../models/signup/signup_request.dart' as signuprequest;
import 'package:chef/models/signup/signup_response.dart';

import 'dart:developer' as developer;

@injectable
class SignUpScreenViewModel extends BaseViewModel<SignUpScreenState> {
  SignUpScreenViewModel({
    required INavigationService navigation,
    required INetworkService network,
    required IStorageService storage,
    required ApplicationService appService,
  })  : _navigation = navigation,
        _network = network,
        _storage = storage,
        _appService = appService,
        super(
          const Initialized(fullName: '',
              brandName: '',
              mobileNumber: '',
              address: '',
              // town: '',
              // city: '',
          ),
        );

  final INavigationService _navigation;
  final INetworkService _network;
  final IStorageService _storage;
  final ApplicationService _appService;

  // Future<void> loadAppVersion() async {
  //   final packageInfo = await PackageInfo.fromPlatform();
  //   emit(state.copyWith(appVersion: packageInfo.version));
  // }

  // void updateBaseUrl({
  //   required int selectedUrlIndex,
  //   required String baseURL,
  // }) =>
  //     emit(
  //       state.copyWith(
  //         baseUrlIndex: selectedUrlIndex,
  //         baseURL: baseURL,
  //       ),
  //     );

  void initialize() {
    emit(const Loaded());
  }
  bool isValidUrl(String url) => Uri.tryParse(url)?.hasAbsolutePath ?? false;

  String updateUrl(String url) {
    if (!url.endsWith('/')) {
      url += '/';
    }
    if (!url.endsWith(Api.client)) {
      url += Api.client;
    }
    return url;
  }

  void onFormValuesChange({
    String? fullName,
    String? mobileNumber,
    String? address,
    String? brandName,
  }) =>
      emit(Initialized(
          fullName: fullName ?? '',
          mobileNumber: mobileNumber ?? '',
          brandName: brandName ?? '',
          address: address ?? '')
          .copyWith());

  bool _validateInput({
    required String name,
    required String brandName,
    required String mobileNumber,
    required String address,
    // required String town,
    // required String city,
  }) =>
      name.trim().isNotEmpty &&
          brandName.trim().isNotEmpty &&
          mobileNumber.trim().isNotEmpty &&
          address.trim().isNotEmpty ;
          // town.trim().isNotEmpty &&
          // city.trim().isNotEmpty ;

  Future<void> _cacheData({
    required BuildContext context,
    required loginData,
    required String baseUrl,
  }) async {
    // await _storage.writeBool(
    //   key: PreferencesKeys.sRememberUser,
    //   data:  state.rememberMe,
    //   // data: state.when(initialized: , loaded: loaded),
    // );
    await _storage.writeString(
      key: PreferencesKeys.sLoginData,
      data: loginData.toString(),
    );
    final loginDecodedData = jsonDecode(loginData.toString());
    //final currentUser = LoginResponse.fromJson(loginDecodedData);
    final currentUser = SignupResponse.fromJson(loginDecodedData);
    // await _storage.writeString(
    //   key: PreferencesKeys.sTenantId,
    //   data: currentUser.user.tenantId,
    // );
    await _storage.writeString(
      key: PreferencesKeys.sBaseUrl,
      data: baseUrl,
    );
    await _appService.loadPrefData();
  }

  void saveChef({
    required String name,
    required String brandName,
    required String mobileNumber,
    required String address,
    // required String town,
    // required String city,
    required BuildContext context,
    required String baseUrl,
  }) async {
    final isInputValid = _validateInput(
      name: name,
      brandName: brandName,
      mobileNumber: mobileNumber,
      address: address,
      // town: town,
      // city: city,
    );
    if (isInputValid) {
      emit(const Loading());
      try {
        final url =
        ExtoURLHelpers.getRestApiURL(Api.baseURL + Api.chefSignUp);
        signuprequest.T t = signuprequest.T(
          name: name,
          brandName: brandName,
          mobileNo: mobileNumber,
          address: address,
        );

        final signUpCredentials = signuprequest.SignupRequest(
          t: t,
        ).toJson();
        final response = await _network
            .post(
          path: url,
          data: signUpCredentials,
          //   accessToken: false,
        ).whenComplete(() {});

        // final response = await _network.get(
        //   //below one is working
        //   path: 'https://run.mocky.io/v3/80289cbe-aa47-491e-9eb2-56126289c8a4',
        // );
        if (response != null) {
          developer.log(' Response of Signup body is ' + '${response.body}');

          SignupResponse signupResponse = signupResponseFromJson(response.body);

          Toaster.infoToast(context: context, message: signupResponse.message);

          await _cacheData(
            context: context,
            loginData: response.body,
            baseUrl: baseUrl,
          );
          emit(const Loaded());

          developer.log(' Sign up Response is ' + signupResponse.message);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpQuestionireScreen()),
          );
        } else {
          Toaster.infoToast(
              context: context,
              message: 'Something is wrong please content vendor');
          developer.log(' Response of Signup is null ' + '$response');
        }

        //  loading(isBusy: false);
        //   _navigation.replace(route: CustomerRoute());
      } catch (error) {
        // emit(
        //   // state.copyWith(
        //   //   isBusy: false,
        //   //   errorMessage: error.toString().contains(Api.unauthorizedRequest)
        //   //       ? Strings.invalidUsernamePassword
        //   //       : error.toString(),
        //   // ),
        // );
      }
    } else {
      Toaster.errorToast(
        context: context,
        message: Strings.requiredFields,
      );
    }
  }

  void loading({required bool isBusy}) => emit(const Loading());
}