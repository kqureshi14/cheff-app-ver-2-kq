import 'package:chef/helpers/helpers.dart';
import 'package:chef/models/signup/questionire_request.dart'
    as questionirerequest;
import 'package:chef/models/signup/questionire_response.dart';

import 'package:chef/screens/sign_up/questionire/component/sign_up_questionire_screen_m.dart'
    as signupquestion;

import 'dart:developer' as developer;

@injectable
class SignUpQuestionireScreenViewModel
    extends BaseViewModel<signupquestion.SignUpQuestionireScreenState> {
  SignUpQuestionireScreenViewModel({
    required INavigationService navigation,
    required INetworkService network,
    required IStorageService storage,
    required ApplicationService appService,
  })  : _navigation = navigation,
        _network = network,
        _storage = storage,
        _appService = appService,
        super(const signupquestion.Loading());

  final INavigationService _navigation;
  final INetworkService _network;
  final IStorageService _storage;
  final ApplicationService _appService;

  Future<void> loadQuestion({
    required String baseUrl,
    required BuildContext context,
  }) async {
    final url = InfininURLHelpers.getRestApiURL(baseUrl + Api.questionListAPI);
    final questionsDataRequest = questionirerequest.QuestionireRequest(
      t: questionirerequest.T(category: "CHEF_PROFILE"),
    ).toJson();
    final response = await _network.post(
      path: url,
      data: questionsDataRequest,
    );

    final currentQuestionirData = questionireResponseFromJson(response.body);
    List<QuestionsList> data = currentQuestionirData.t;
    emit(signupquestion.Loaded(currentQuestionirData.t));

    // emit(Loaded(currentQuestionirData.t));
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

  void loading() => emit(const signupquestion.Loading());
}
