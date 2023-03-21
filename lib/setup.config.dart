// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app.dart' as _i24;
import 'base/screen_layout_base/screen_layout_base_vm.dart' as _i14;
import 'helpers/helpers.dart' as _i5;
import 'helpers/workspace_helper.dart' as _i20;
import 'models/preference.dart' as _i8;
import 'models/wow_factor/wow_factor_response.dart' as _i7;
import 'screens/account_settings/account_settings_screen_vm.dart' as _i23;
import 'screens/change_password/change_password_screen_vm.dart' as _i25;
import 'screens/experience/component/create_experience_screen_vm.dart' as _i4;
import 'screens/experience/component/menu_experience_screen_vm.dart' as _i12;
import 'screens/experience/widget/experience_manager.dart' as _i6;
import 'screens/forgot_password/forgot_password_screen_vm.dart' as _i26;
import 'screens/home/home_screen_vm.dart' as _i27;
import 'screens/sign_in/sign_in_screen_vm.dart' as _i15;
import 'screens/sign_up/get_started_screen_vm.dart' as _i17;
import 'screens/experience/schedule/create_schedule_viewmodel.dart';
import 'screens/sign_up/questionire/component/sign_up_questionire_screen_vm.dart'
    as _i16;
import 'screens/sign_up/sign_up_screen_vm.dart' as _i18;
import 'screens/splash/splash_screen_vm.dart' as _i19;
import 'screens/username_profile/profile_information_screen_vm.dart' as _i13;
import 'services/application_state.dart' as _i22;
import 'services/renderer/field_renderer.dart' as _i9;
import 'services/services.dart' as _i3;
import 'services/storage/storage_service.dart' as _i21;
import 'setup.dart' as _i28;
import 'theme/theme.dart' as _i10; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i6.ExperienceManager>(() => _i6.ExperienceManager(
        wowFactor: get<_i7.WowFactorResponse>(),
        preferences: get<_i8.PreferenceResponse>(),
        key: get<_i5.Key>(),
      ));
  gh.lazySingleton<_i9.FieldRenderer>(
      () => _i9.FieldRenderer(fieldInputData: get<Map<String, dynamic>>()));
  gh.singleton<_i10.IAppThemeData>(registerModule.theme);
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
  gh.factory<_i11.Key>(() => registerModule.key);
  gh.factory<_i12.MenuExperienceScreenViewModel>(
      () => _i12.MenuExperienceScreenViewModel(
            navigation: get<_i5.INavigationService<dynamic>>(),
            network: get<_i5.INetworkService<dynamic>>(),
          ));
  gh.factory<_i13.ProfileInformationScreenViewModel>(
      () => _i13.ProfileInformationScreenViewModel(
            navigation: get<_i3.INavigationService<dynamic>>(),
            appService: get<_i3.ApplicationService>(),
          ));
  gh.factory<_i14.ScreenLayoutBaseViewModel>(
      () => _i14.ScreenLayoutBaseViewModel(
            appService: get<_i5.ApplicationService>(),
            storage: get<_i5.IStorageService>(),
            workspaceHelper: get<_i5.WorkspaceHelper>(),
          ));
  gh.factory<_i15.SignInScreenViewModel>(() => _i15.SignInScreenViewModel(
        navigation: get<_i5.INavigationService<dynamic>>(),
        network: get<_i5.INetworkService<dynamic>>(),
        storage: get<_i5.IStorageService>(),
        appService: get<_i5.ApplicationService>(),
      ));
  gh.factory<_i16.SignUpQuestionireScreenViewModel>(
      () => _i16.SignUpQuestionireScreenViewModel(
            navigation: get<_i5.INavigationService<dynamic>>(),
            network: get<_i5.INetworkService<dynamic>>(),
            storage: get<_i5.IStorageService>(),
            appService: get<_i5.ApplicationService>(),
          ));
  gh.factory<_i17.SignUpScreenViewModel>(() => _i17.SignUpScreenViewModel());
  gh.factory<ScheduleScreenViewModel>(() =>
      ScheduleScreenViewModel(
          network: get<_i5.INetworkService<dynamic>>()));
  gh.factory<_i18.SignUpScreenViewModel>(() => _i18.SignUpScreenViewModel(
        navigation: get<_i5.INavigationService<dynamic>>(),
        network: get<_i5.INetworkService<dynamic>>(),
        storage: get<_i5.IStorageService>(),
        appService: get<_i5.ApplicationService>(),
      ));
  gh.factory<_i19.SplashScreenViewModel>(() => _i19.SplashScreenViewModel(
        navigationService: get<_i3.INavigationService<dynamic>>(),
        storage: get<_i3.IStorageService>(),
        appService: get<_i3.ApplicationService>(),
      ));
  gh.factory<_i20.WorkspaceHelper>(() => _i20.WorkspaceHelper(
        storage: get<_i21.IStorageService>(),
        appService: get<_i22.ApplicationService>(),
      ));
  gh.factory<_i23.AccountSettingsScreenViewModel>(
      () => _i23.AccountSettingsScreenViewModel(
            storage: get<_i3.IStorageService>(),
            navigation: get<_i3.INavigationService<dynamic>>(),
          ));
  gh.singleton<_i24.App>(_i24.App(
    appThemeData: get<_i10.IAppThemeData>(),
    appRouter: get<_i3.AppRouter>(),
    key: get<_i11.Key>(),
  ));
  gh.factory<_i25.ChangePasswordScreenViewModel>(() =>
      _i25.ChangePasswordScreenViewModel(
          navigation: get<_i3.INavigationService<dynamic>>()));
  gh.factory<_i26.ForgotPasswordScreenViewModel>(() =>
      _i26.ForgotPasswordScreenViewModel(
          navigation: get<_i3.INavigationService<dynamic>>()));
  gh.factory<_i27.HomeScreenViewModel>(() => _i27.HomeScreenViewModel(
        navigation: get<_i3.INavigationService<dynamic>>(),
        storage: get<_i3.IStorageService>(),
        appService: get<_i3.ApplicationService>(),
      ));
  return get;
}

class _$RegisterModule extends _i28.RegisterModule {
  @override
  _i11.UniqueKey get key => _i11.UniqueKey();
}
