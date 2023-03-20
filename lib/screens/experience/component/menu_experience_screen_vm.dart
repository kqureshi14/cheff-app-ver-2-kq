import 'package:chef/models/experience/experience_response.dart' as exp_resp;

import '../../../helpers/experience_helper.dart';
import '../../../helpers/helpers.dart';

import '../../../helpers/menu_helper.dart' as menu_help;
import '../../../models/dish/dish_response.dart' as dish;
import '../../../models/meal/meal_response.dart' as meal;

import '../../../models/meal/menu_response.dart' as menu_resp;
import '../../../setup.dart';
import '../../../models/meal/menu_request.dart' as menu_req;
import '../schedule_screen_v.dart';
import 'menu_experience_screen_m.dart' as menu_exp;

import 'dart:developer' as developer;

@injectable
class MenuExperienceScreenViewModel
    extends BaseViewModel<menu_exp.MenuExperienceScreenState> {
  // MenuExperienceScreenViewModel(MenuExperienceScreenState state) : super(state);

  MenuExperienceScreenViewModel({
    required INavigationService navigation,
    required INetworkService network,
  })  : _navigation = navigation,
        _network = network,
        super(const menu_exp.Loading());
  final INavigationService _navigation;
  final INetworkService _network;

  //MenuExperienceScreenViewModel(MenuExperienceScreenViewModel state) : super(state);
  late final meal.MealResponse _mealResponse;
  late final dish.DishList _dishResponse;
  initialize() {
    emit(const menu_exp.Loading());
    loadMealList();
    // loadWowFactors();
  }

  void loadMealList() async {
    //http://18.202.117.137:8080/feyst-service/wow-factor/list

    final url = InfininURLHelpers.getRestApiURL(Api.baseURL + Api.mealAPI);

    // T t = loginrequest.T(
    //   mobileNo: mobileNumber,
    // );

    final requestMealList = LoginRequest(
      t: T(),
    ).toJson();

    final _header = <String, String>{
      Api.headerAcceptKey: Api.headerAcceptTypeValue
    };
    final response = await _network.post(
      path: url,
      data: requestMealList,
    );

    _mealResponse = meal.mealResponseFromJson(response.body);
    loadDishList();
  }

  void loadDishList() async {
    //http://18.202.117.137:8080/feyst-service/wow-factor/list

    final url = InfininURLHelpers.getRestApiURL(Api.baseURL + Api.dishAPI);

    // T t = loginrequest.T(
    //   mobileNo: mobileNumber,
    // );

    final requestMealList = LoginRequest(
      t: T(),
    ).toJson();

    final _header = <String, String>{
      Api.headerAcceptKey: Api.headerAcceptTypeValue
    };
    final response = await _network.post(
      path: url,
      data: requestMealList,
    );

    _dishResponse = dish.dishListFromJson(response.body);
    emit(menu_exp.Loaded(_mealResponse, _dishResponse));
  }

  void saveMenu(BuildContext context) async {
    final _appService = locateService<ApplicationService>();
    developer.log(' Ready to save Menu');

    menu_help.MenuHelper menuHelper = (_appService.state.menuHelper)!;

    if (menuHelper != null &&
        menuHelper.selectedMealId != null &&
        menuHelper.selectedMealId != 0) {
      exp_resp.ExperienceResponse experienceResponse =
          (_appService.state.experienceResponse)!;

      developer.log(' Meal Id  ' + '${menuHelper.selectedMealId}');

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const MenuExperienceScreen()),
      // );

      final url = InfininURLHelpers.getRestApiURL(Api.baseURL + Api.menuSave);

      //getList(experienceHelper.selectedWowFactors,'wow');
      menu_req.T t = menu_req.T(
        dish: menuHelper.selectedDishName,
        dishId: menuHelper.selectedDishId,
        mealId: menuHelper.selectedMealId,
        experienceId: (experienceResponse.t!.id)!,
        description: menuHelper.givenDescription,
        price: menuHelper.dishServingNoOfPerson,
        pictureUrl: '',
      );

      final menuData = menu_req.MenuRequest(
        t: t,
      ).toJson();

      // final signUpCredentials = SignupRequest(
      //   t: t,
      // ).toJson();
      final response = await _network
          .post(
            path: url,
            data: menuData,
            //   accessToken: false,
          )
          .whenComplete(() {});

      if (response != null) {
        developer
            .log(' Response of Menu Submited data is  ' + '${response.body}');

        menu_resp.MenuResponse menuResponse =
            menu_resp.menuResponseFromJson(response.body);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SetupScheduleScreen()),
        );
      } else {
        Toaster.infoToast(
            context: context,
            message: 'Something is wrong please content vendor');
        developer.log(' Response of Menu is ' + '$response');
      }
    } else {
      Toaster.infoToast(
          context: context,
          message: 'Something is wrong please content vendor');
      developer.log(' Response of Menu is ');
    }
  }
}