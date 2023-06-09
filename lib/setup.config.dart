// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app.dart' as _i32;
import 'base/screen_layout_base/screen_layout_base_vm.dart' as _i22;
import 'helpers/helpers.dart' as _i5;
import 'helpers/workspace_helper.dart' as _i28;
import 'models/preference.dart' as _i9;
import 'models/wow_factor/wow_factor_response.dart' as _i8;
import 'screens/account_settings/account_settings_screen_vm.dart' as _i31;
import 'screens/booking/component/order_screen_vm.dart' as _i18;
import 'screens/change_password/change_password_screen_vm.dart' as _i33;
import 'screens/experience/component/create_experience_screen_vm.dart' as _i4;
import 'screens/experience/component/menu_experience_screen_vm.dart' as _i17;
import 'screens/experience/schedule/create_schedule_viewmodel.dart' as _i21;
import 'screens/experience/widget/experience_manager.dart' as _i7;
import 'screens/foodie_profile/component/foodie_profile_decision_screen_vm.dart'
    as _i12;
import 'screens/forgot_password/forgot_password_screen_vm.dart' as _i34;
import 'screens/home/experience_menu_details/experience_menu_details_screen_vm.dart'
    as _i10;
import 'screens/home/experiences_details/experience_details_screen_vm.dart'
    as _i6;
import 'screens/home/home_page/home_screen_vm.dart' as _i35;
import 'screens/qr_scanner/qr_scanner_screen_vm.dart' as _i20;
import 'screens/sign_in/sign_in_screen_vm.dart' as _i23;
import 'screens/sign_up/get_started_screen_vm.dart' as _i25;
import 'screens/sign_up/questionire/component/sign_up_questionire_screen_vm.dart'
    as _i24;
import 'screens/sign_up/sign_up_screen_vm.dart' as _i26;
import 'screens/splash/splash_screen_vm.dart' as _i27;
import 'screens/username_profile/profile_information_screen_vm.dart' as _i19;
import 'services/application_state.dart' as _i30;
import 'services/navigation/navigation_service.dart' as _i14;
import 'services/network/network_service.dart' as _i13;
import 'services/renderer/field_renderer.dart' as _i11;
import 'services/services.dart' as _i3;
import 'services/storage/storage_service.dart' as _i29;
import 'setup.dart' as _i36;
import 'screens/profile/component/chef_profile_screen_vm.dart' as _i37;
import 'theme/theme.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppRouter>(registerModule.appRouter);
  await gh.factoryAsync<_i3.ApplicationService>(
    () => registerModule.appService,
    preResolve: true,
  );
  gh.factory<_i4.CreateExperienceScreenViewModel>(
      () => _i4.CreateExperienceScreenViewModel(
            navigation: get<_i5.INavigationService<dynamic>>(),
            network: get<_i5.INetworkService<dynamic>>(),
            storage: get<_i5.IStorageService>(),
            appService: get<_i5.ApplicationService>(),
          ));
  gh.factory<_i6.ExperienceDetailsScreenViewModel>(
      () => _i6.ExperienceDetailsScreenViewModel(
            navigation: get<_i5.INavigationService<dynamic>>(),
            network: get<_i5.INetworkService<dynamic>>(),
            storage: get<_i5.IStorageService>(),
            appService: get<_i5.ApplicationService>(),
          ));
  gh.factory<_i7.ExperienceManager>(() => _i7.ExperienceManager(
        wowFactor: get<_i8.WowFactorResponse>(),
        preferences: get<_i9.PreferenceResponse>(),
        key: get<_i5.Key>(),
      ));
  gh.factory<_i10.ExperienceMenuDetailsScreenViewModel>(
      () => _i10.ExperienceMenuDetailsScreenViewModel(
            navigation: get<_i5.INavigationService<dynamic>>(),
            network: get<_i5.INetworkService<dynamic>>(),
            storage: get<_i5.IStorageService>(),
            appService: get<_i5.ApplicationService>(),
          ));
  gh.lazySingleton<_i11.FieldRenderer>(
      () => _i11.FieldRenderer(fieldInputData: get<Map<String, dynamic>>()));
  gh.factory<_i12.FoodieProfileDecisionScreenViewModel>(
      () => _i12.FoodieProfileDecisionScreenViewModel(
            network: get<_i13.INetworkService<dynamic>>(),
            navigation: get<_i14.INavigationService<dynamic>>(),
          ));
  gh.singleton<_i15.IAppThemeData>(registerModule.theme);
  gh.singleton<_i3.IDeviceService>(registerModule.deviceService);
  gh.singleton<_i3.INavigationService<dynamic>>(
      registerModule.navigationService);
  await gh.factoryAsync<_i3.INetworkService<dynamic>>(
    () => registerModule.network,
    preResolve: true,
  );
  gh.singleton<_i3.IRendererService<dynamic, dynamic>>(
      registerModule.fieldRendererService);
  await gh.factoryAsync<_i3.IStorageService>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i16.Key>(() => registerModule.key);
  gh.factory<_i17.MenuExperienceScreenViewModel>(
      () => _i17.MenuExperienceScreenViewModel(
            navigation: get<_i5.INavigationService<dynamic>>(),
            network: get<_i5.INetworkService<dynamic>>(),
          ));
  gh.factory<_i18.OrderScreenViewModel>(() =>
      _i18.OrderScreenViewModel(network: get<_i13.INetworkService<dynamic>>()));
  gh.factory<_i19.ProfileInformationScreenViewModel>(
      () => _i19.ProfileInformationScreenViewModel(
            navigation: get<_i3.INavigationService<dynamic>>(),
            appService: get<_i3.ApplicationService>(),
          ));
  gh.factory<_i20.QrScannerScreenViewModel>(
      () => _i20.QrScannerScreenViewModel());
  gh.factory<_i37.ChefProfileDetailsScreenViewModel>(
      () => _i37.ChefProfileDetailsScreenViewModel(
        network: get<_i5.INetworkService<dynamic>>(),
        navigation: get<_i5.INavigationService<dynamic>>(),
      ));
  gh.factory<_i21.ScheduleScreenViewModel>(() => _i21.ScheduleScreenViewModel(
      network: get<_i13.INetworkService<dynamic>>()));
  gh.factory<_i22.ScreenLayoutBaseViewModel>(
      () => _i22.ScreenLayoutBaseViewModel(
            appService: get<_i5.ApplicationService>(),
            storage: get<_i5.IStorageService>(),
            workspaceHelper: get<_i5.WorkspaceHelper>(),
            navigationService: get<_i5.INavigationService<dynamic>>(),
          ));
  gh.factory<_i23.SignInScreenViewModel>(() => _i23.SignInScreenViewModel(
        navigation: get<_i5.INavigationService<dynamic>>(),
        network: get<_i5.INetworkService<dynamic>>(),
        storage: get<_i5.IStorageService>(),
        appService: get<_i5.ApplicationService>(),
      ));
  gh.factory<_i24.SignUpQuestionireScreenViewModel>(
      () => _i24.SignUpQuestionireScreenViewModel(
            navigation: get<_i5.INavigationService<dynamic>>(),
            network: get<_i5.INetworkService<dynamic>>(),
            storage: get<_i5.IStorageService>(),
            appService: get<_i5.ApplicationService>(),
          ));
  gh.factory<_i25.SignUpScreenViewModel>(() => _i25.SignUpScreenViewModel());
  gh.factory<_i26.SignUpScreenViewModel>(() => _i26.SignUpScreenViewModel(
        navigation: get<_i5.INavigationService<dynamic>>(),
        network: get<_i5.INetworkService<dynamic>>(),
        storage: get<_i5.IStorageService>(),
        appService: get<_i5.ApplicationService>(),
      ));
  gh.factory<_i27.SplashScreenViewModel>(() => _i27.SplashScreenViewModel(
        navigationService: get<_i3.INavigationService<dynamic>>(),
        storage: get<_i3.IStorageService>(),
        appService: get<_i3.ApplicationService>(),
      ));
  gh.factory<_i28.WorkspaceHelper>(() => _i28.WorkspaceHelper(
        storage: get<_i29.IStorageService>(),
        appService: get<_i30.ApplicationService>(),
      ));
  gh.factory<_i31.AccountSettingsScreenViewModel>(
      () => _i31.AccountSettingsScreenViewModel(
            storage: get<_i3.IStorageService>(),
            navigation: get<_i3.INavigationService<dynamic>>(),
          ));
  gh.singleton<_i32.App>(_i32.App(
    appThemeData: get<_i15.IAppThemeData>(),
    appRouter: get<_i3.AppRouter>(),
    key: get<_i16.Key>(),
  ));
  gh.factory<_i33.ChangePasswordScreenViewModel>(() =>
      _i33.ChangePasswordScreenViewModel(
          navigation: get<_i3.INavigationService<dynamic>>()));
  gh.factory<_i34.ForgotPasswordScreenViewModel>(() =>
      _i34.ForgotPasswordScreenViewModel(
          navigation: get<_i3.INavigationService<dynamic>>()));
  gh.factory<_i35.HomeScreenViewModel>(() => _i35.HomeScreenViewModel(
        navigation: get<_i3.INavigationService<dynamic>>(),
        storage: get<_i3.IStorageService>(),
        appService: get<_i3.ApplicationService>(),
        network: get<_i3.INetworkService<dynamic>>(),
      ));
  return get;
}

class _$RegisterModule extends _i36.RegisterModule {
  @override
  _i16.UniqueKey get key => _i16.UniqueKey();
}
