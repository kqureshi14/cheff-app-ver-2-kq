// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app.dart' as _i27;
import 'base/screen_layout_base/screen_layout_base_vm.dart' as _i17;
import 'helpers/helpers.dart' as _i5;
import 'helpers/workspace_helper.dart' as _i23;
import 'models/preference.dart' as _i9;
import 'models/wow_factor/wow_factor_response.dart' as _i8;
import 'screens/account_settings/account_settings_screen_vm.dart' as _i26;
import 'screens/change_password/change_password_screen_vm.dart' as _i28;
import 'screens/experience/component/create_experience_screen_vm.dart' as _i4;
import 'screens/experience/component/menu_experience_screen_vm.dart' as _i13;
import 'screens/experience/schedule/create_schedule_viewmodel.dart' as _i15;
import 'screens/experience/widget/experience_manager.dart' as _i7;
import 'screens/forgot_password/forgot_password_screen_vm.dart' as _i29;
import 'screens/home/experiences_details/experience_details_screen_vm.dart'
    as _i6;
import 'screens/home/home_screen_vm.dart' as _i30;
import 'screens/sign_in/sign_in_screen_vm.dart' as _i18;
import 'screens/sign_up/get_started_screen_vm.dart' as _i20;
import 'screens/sign_up/questionire/component/sign_up_questionire_screen_vm.dart'
    as _i19;
import 'screens/sign_up/sign_up_screen_vm.dart' as _i21;
import 'screens/splash/splash_screen_vm.dart' as _i22;
import 'screens/username_profile/profile_information_screen_vm.dart' as _i14;
import 'services/application_state.dart' as _i25;
import 'services/network/network_service.dart' as _i16;
import 'services/renderer/field_renderer.dart' as _i10;
import 'services/services.dart' as _i3;
import 'services/storage/storage_service.dart' as _i24;
import 'setup.dart' as _i31;
import 'theme/theme.dart' as _i11; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i10.FieldRenderer>(
      () => _i10.FieldRenderer(fieldInputData: get<Map<String, dynamic>>()));
  gh.singleton<_i11.IAppThemeData>(registerModule.theme);
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
  gh.factory<_i12.Key>(() => registerModule.key);
  gh.factory<_i13.MenuExperienceScreenViewModel>(
      () => _i13.MenuExperienceScreenViewModel(
            navigation: get<_i5.INavigationService<dynamic>>(),
            network: get<_i5.INetworkService<dynamic>>(),
          ));
  gh.factory<_i14.ProfileInformationScreenViewModel>(
      () => _i14.ProfileInformationScreenViewModel(
            navigation: get<_i3.INavigationService<dynamic>>(),
            appService: get<_i3.ApplicationService>(),
          ));
  gh.factory<_i15.ScheduleScreenViewModel>(() => _i15.ScheduleScreenViewModel(
      network: get<_i16.INetworkService<dynamic>>()));
  gh.factory<_i17.ScreenLayoutBaseViewModel>(
      () => _i17.ScreenLayoutBaseViewModel(
            appService: get<_i5.ApplicationService>(),
            storage: get<_i5.IStorageService>(),
            workspaceHelper: get<_i5.WorkspaceHelper>(),
          ));
  gh.factory<_i18.SignInScreenViewModel>(() => _i18.SignInScreenViewModel(
        navigation: get<_i5.INavigationService<dynamic>>(),
        network: get<_i5.INetworkService<dynamic>>(),
        storage: get<_i5.IStorageService>(),
        appService: get<_i5.ApplicationService>(),
      ));
  gh.factory<_i19.SignUpQuestionireScreenViewModel>(
      () => _i19.SignUpQuestionireScreenViewModel(
            navigation: get<_i5.INavigationService<dynamic>>(),
            network: get<_i5.INetworkService<dynamic>>(),
            storage: get<_i5.IStorageService>(),
            appService: get<_i5.ApplicationService>(),
          ));
  gh.factory<_i20.SignUpScreenViewModel>(() => _i20.SignUpScreenViewModel());
  gh.factory<_i21.SignUpScreenViewModel>(() => _i21.SignUpScreenViewModel(
        navigation: get<_i5.INavigationService<dynamic>>(),
        network: get<_i5.INetworkService<dynamic>>(),
        storage: get<_i5.IStorageService>(),
        appService: get<_i5.ApplicationService>(),
      ));
  gh.factory<_i22.SplashScreenViewModel>(() => _i22.SplashScreenViewModel(
        navigationService: get<_i3.INavigationService<dynamic>>(),
        storage: get<_i3.IStorageService>(),
        appService: get<_i3.ApplicationService>(),
      ));
  gh.factory<_i23.WorkspaceHelper>(() => _i23.WorkspaceHelper(
        storage: get<_i24.IStorageService>(),
        appService: get<_i25.ApplicationService>(),
      ));
  gh.factory<_i26.AccountSettingsScreenViewModel>(
      () => _i26.AccountSettingsScreenViewModel(
            storage: get<_i3.IStorageService>(),
            navigation: get<_i3.INavigationService<dynamic>>(),
          ));
  gh.singleton<_i27.App>(_i27.App(
    appThemeData: get<_i11.IAppThemeData>(),
    appRouter: get<_i3.AppRouter>(),
    key: get<_i12.Key>(),
  ));
  gh.factory<_i28.ChangePasswordScreenViewModel>(() =>
      _i28.ChangePasswordScreenViewModel(
          navigation: get<_i3.INavigationService<dynamic>>()));
  gh.factory<_i29.ForgotPasswordScreenViewModel>(() =>
      _i29.ForgotPasswordScreenViewModel(
          navigation: get<_i3.INavigationService<dynamic>>()));
  gh.factory<_i30.HomeScreenViewModel>(() => _i30.HomeScreenViewModel(
        navigation: get<_i3.INavigationService<dynamic>>(),
        storage: get<_i3.IStorageService>(),
        appService: get<_i3.ApplicationService>(),
      ));
  return get;
}

class _$RegisterModule extends _i31.RegisterModule {
  @override
  _i12.UniqueKey get key => _i12.UniqueKey();
}
