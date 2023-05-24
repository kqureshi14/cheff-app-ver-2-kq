// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app.dart' as _i5;
import 'base/screen_layout_base/screen_layout_base_vm.dart' as _i27;
import 'helpers/helpers.dart' as _i10;
import 'helpers/workspace_helper.dart' as _i33;
import 'models/preference.dart' as _i14;
import 'models/wow_factor/wow_factor_response.dart' as _i13;
import 'screens/account_settings/account_settings_screen_vm.dart' as _i3;
import 'screens/booking/component/order_screen_vm.dart' as _i23;
import 'screens/change_password/change_password_screen_vm.dart' as _i8;
import 'screens/experience/component/create_experience_screen_vm.dart' as _i9;
import 'screens/experience/component/menu_experience_screen_vm.dart' as _i22;
import 'screens/experience/schedule/create_schedule_viewmodel.dart' as _i26;
import 'screens/experience/widget/experience_manager.dart' as _i12;
import 'screens/foodie_profile/component/foodie_profile_decision_screen_vm.dart'
    as _i17;
import 'screens/forgot_password/forgot_password_screen_vm.dart' as _i20;
import 'screens/home/experience_menu_details/experience_menu_details_screen_vm.dart'
    as _i15;
import 'screens/home/experiences_details/experience_details_screen_vm.dart'
    as _i11;
import 'screens/home/home_page/home_screen_vm.dart' as _i21;
import 'screens/qr_scanner/qr_scanner_screen_vm.dart' as _i25;
import 'screens/sign_in/sign_in_screen_vm.dart' as _i28;
import 'screens/sign_up/get_started_screen_vm.dart' as _i30;
import 'screens/sign_up/questionire/component/sign_up_questionire_screen_vm.dart'
    as _i29;
import 'screens/sign_up/sign_up_screen_vm.dart' as _i31;
import 'screens/splash/splash_screen_vm.dart' as _i32;
import 'screens/username_profile/profile_information_screen_vm.dart' as _i24;
import 'services/application_state.dart' as _i35;
import 'services/navigation/navigation_service.dart' as _i19;
import 'services/network/network_service.dart' as _i18;
import 'services/renderer/field_renderer.dart' as _i16;
import 'services/services.dart' as _i4;
import 'services/storage/storage_service.dart' as _i34;
import 'theme/theme.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AccountSettingsScreenViewModel>(
      () => _i3.AccountSettingsScreenViewModel(
            storage: get<_i4.IStorageService>(),
            navigation: get<_i4.INavigationService<dynamic>>(),
          ));
  gh.singleton<_i5.App>(_i5.App(
    appThemeData: get<_i6.IAppThemeData>(),
    appRouter: get<dynamic>(),
    key: get<_i7.Key>(),
  ));
  gh.factory<_i8.ChangePasswordScreenViewModel>(() =>
      _i8.ChangePasswordScreenViewModel(
          navigation: get<_i4.INavigationService<dynamic>>()));
  gh.factory<_i9.CreateExperienceScreenViewModel>(
      () => _i9.CreateExperienceScreenViewModel(
            navigation: get<_i10.INavigationService<dynamic>>(),
            network: get<_i10.INetworkService<dynamic>>(),
            storage: get<_i10.IStorageService>(),
            appService: get<_i10.ApplicationService>(),
          ));
  gh.factory<_i11.ExperienceDetailsScreenViewModel>(
      () => _i11.ExperienceDetailsScreenViewModel(
            navigation: get<_i10.INavigationService<dynamic>>(),
            network: get<_i10.INetworkService<dynamic>>(),
            storage: get<_i10.IStorageService>(),
            appService: get<_i10.ApplicationService>(),
          ));
  gh.factory<_i12.ExperienceManager>(() => _i12.ExperienceManager(
        wowFactor: get<_i13.WowFactorResponse>(),
        preferences: get<_i14.PreferenceResponse>(),
        key: get<_i10.Key>(),
      ));
  gh.factory<_i15.ExperienceMenuDetailsScreenViewModel>(
      () => _i15.ExperienceMenuDetailsScreenViewModel(
            navigation: get<_i10.INavigationService<dynamic>>(),
            network: get<_i10.INetworkService<dynamic>>(),
            storage: get<_i10.IStorageService>(),
            appService: get<_i10.ApplicationService>(),
          ));
  gh.lazySingleton<_i16.FieldRenderer>(
      () => _i16.FieldRenderer(fieldInputData: get<Map<String, dynamic>>()));
  gh.factory<_i17.FoodieProfileDecisionScreenViewModel>(
      () => _i17.FoodieProfileDecisionScreenViewModel(
            network: get<_i18.INetworkService<dynamic>>(),
            navigation: get<_i19.INavigationService<dynamic>>(),
          ));
  gh.factory<_i20.ForgotPasswordScreenViewModel>(() =>
      _i20.ForgotPasswordScreenViewModel(
          navigation: get<_i4.INavigationService<dynamic>>()));
  gh.factory<_i21.HomeScreenViewModel>(() => _i21.HomeScreenViewModel(
        navigation: get<_i4.INavigationService<dynamic>>(),
        storage: get<_i4.IStorageService>(),
        appService: get<_i4.ApplicationService>(),
        network: get<_i4.INetworkService<dynamic>>(),
      ));
  gh.factory<_i22.MenuExperienceScreenViewModel>(
      () => _i22.MenuExperienceScreenViewModel(
            navigation: get<_i10.INavigationService<dynamic>>(),
            network: get<_i10.INetworkService<dynamic>>(),
          ));
  gh.factory<_i23.OrderScreenViewModel>(() =>
      _i23.OrderScreenViewModel(network: get<_i18.INetworkService<dynamic>>()));
  gh.factory<_i24.ProfileInformationScreenViewModel>(
      () => _i24.ProfileInformationScreenViewModel(
            navigation: get<_i4.INavigationService<dynamic>>(),
            appService: get<_i4.ApplicationService>(),
          ));
  gh.factory<_i25.QrScannerScreenViewModel>(
      () => _i25.QrScannerScreenViewModel());
  gh.factory<_i26.ScheduleScreenViewModel>(() => _i26.ScheduleScreenViewModel(
      network: get<_i18.INetworkService<dynamic>>()));
  gh.factory<_i27.ScreenLayoutBaseViewModel>(
      () => _i27.ScreenLayoutBaseViewModel(
            appService: get<_i10.ApplicationService>(),
            storage: get<_i10.IStorageService>(),
            workspaceHelper: get<_i10.WorkspaceHelper>(),
            navigationService: get<_i10.INavigationService<dynamic>>(),
          ));
  gh.factory<_i28.SignInScreenViewModel>(() => _i28.SignInScreenViewModel(
        navigation: get<_i10.INavigationService<dynamic>>(),
        network: get<_i10.INetworkService<dynamic>>(),
        storage: get<_i10.IStorageService>(),
        appService: get<_i10.ApplicationService>(),
      ));
  gh.factory<_i29.SignUpQuestionireScreenViewModel>(
      () => _i29.SignUpQuestionireScreenViewModel(
            navigation: get<_i10.INavigationService<dynamic>>(),
            network: get<_i10.INetworkService<dynamic>>(),
            storage: get<_i10.IStorageService>(),
            appService: get<_i10.ApplicationService>(),
          ));
  gh.factory<_i30.SignUpScreenViewModel>(() => _i30.SignUpScreenViewModel());
  gh.factory<_i31.SignUpScreenViewModel>(() => _i31.SignUpScreenViewModel(
        navigation: get<_i10.INavigationService<dynamic>>(),
        network: get<_i10.INetworkService<dynamic>>(),
        storage: get<_i10.IStorageService>(),
        appService: get<_i10.ApplicationService>(),
      ));
  gh.factory<_i32.SplashScreenViewModel>(() => _i32.SplashScreenViewModel(
        navigationService: get<_i4.INavigationService<dynamic>>(),
        storage: get<_i4.IStorageService>(),
        appService: get<_i4.ApplicationService>(),
      ));
  gh.factory<_i33.WorkspaceHelper>(() => _i33.WorkspaceHelper(
        storage: get<_i34.IStorageService>(),
        appService: get<_i35.ApplicationService>(),
      ));
  return get;
}
