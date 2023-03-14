import '../../../helpers/helpers.dart';
import '../../../models/preference.dart' as preference;
import '../../../models/wow_factor/wow_factor_response.dart' as wowfactor;
// import '../../../models/wow_factor/wow_factor_response.dart';
import '../../../setup.dart';
import '../menu_experience_screen_v.dart';
import 'create_experience_screen_m.dart' as create_experience;

import 'dart:developer' as developer;

@injectable
class CreateExperienceScreenViewModel
    extends BaseViewModel<create_experience.CreateExperienceScreenState> {
  CreateExperienceScreenViewModel({
    required INavigationService navigation,
    required INetworkService network,
    required IStorageService storage,
    required ApplicationService appService,
  })  : _navigation = navigation,
        _network = network,
        _storage = storage,
        _appService = appService,
        super(const create_experience.Loading());
  final INavigationService _navigation;
  final INetworkService _network;
  final IStorageService _storage;
  final ApplicationService _appService;

  late final wowfactor.WowFactorResponse _wowFactorResponse;
  late final preference.PreferenceResponse _preferenceResponse;

  initialize() {
    emit(const create_experience.Loading());
    loadWowFactors();
  }

  void saveExperience(BuildContext context) {
    final _appService = locateService<ApplicationService>();
    developer.log(' Ready to save');

    developer.log(
        ' Title ' + '${_appService.state.experienceHelper!.titleExperience}');

    developer.log(' Experience Details ' +
        '${_appService.state.experienceHelper!.experienceDetails}');

    developer.log(' priceExperience Details ' +
        '${_appService.state.experienceHelper!.priceExperience}');

    developer.log(' numberOfPerson Details ' +
        '${_appService.state.experienceHelper!.numberOfPerson}');

    developer.log(' subHostName Details ' +
        '${_appService.state.experienceHelper!.subHostName}');

    developer.log(' SubHost Mobile Number  Details ' +
        '${_appService.state.experienceHelper!.subHostMobileNumber}');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => const MenuExperienceScreen()),
    // );
  }

  void loadWowFactors() async {
    //http://18.202.117.137:8080/feyst-service/wow-factor/list

    final url = InfininURLHelpers.getRestApiURL(Api.baseURL + Api.wowFactorAPI);

    // T t = loginrequest.T(
    //   mobileNo: mobileNumber,
    // );

    final requestWowFactor = LoginRequest(
      t: T(),
    ).toJson();

    final _header = <String, String>{
      Api.headerAcceptKey: Api.headerAcceptTypeValue
    };

    // final questionsDataRequest = questionirerequest.QuestionireRequest(
    //   t: questionirerequest.T(category: "CHEF_PROFILE"),
    // ).toJson();
    final response = await _network.post(
      path: url,
      data: requestWowFactor,
    );

    _wowFactorResponse = wowfactor.wowFactorResponseFromJson(response.body);
    loadPerferences();
    //  emit(create_experience.Loaded(_wowFactorResponse));
    //List<QuestionsList> data = currentQuestionirData.t;
    //emit(signupquestion.Loaded(currentQuestionirData.t));
  }

  void loadPerferences() async {
    //http://18.202.117.137:8080/feyst-service/wow-factor/list

    final url =
        InfininURLHelpers.getRestApiURL(Api.baseURL + Api.preferenceAPI);

    // T t = loginrequest.T(
    //   mobileNo: mobileNumber,
    // );

    final requestWowFactor = LoginRequest(
      t: T(),
    ).toJson();

    final _header = <String, String>{
      Api.headerAcceptKey: Api.headerAcceptTypeValue
    };

    // final questionsDataRequest = questionirerequest.QuestionireRequest(
    //   t: questionirerequest.T(category: "CHEF_PROFILE"),
    // ).toJson();
    final response = await _network.post(
      path: url,
      data: requestWowFactor,
    );

    // final preferenceResponse =
    _preferenceResponse = preference.preferenceResponseFromJson(response.body);
    emit(create_experience.Loaded(_wowFactorResponse, _preferenceResponse));
    //List<QuestionsList> data = currentQuestionirData.t;
    //emit(signupquestion.Loaded(currentQuestionirData.t));
  }
}
