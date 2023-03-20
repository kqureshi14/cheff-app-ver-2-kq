import 'package:chef/helpers/helpers.dart';
import 'package:chef/screens/experience/schedule_screen_v.dart';

import '../../../../helpers/color_helper.dart';
import '../../../helpers/menu_helper.dart';
import '../../../setup.dart';

import '../../../models/dish/dish_response.dart' as dish;
import '../../../models/meal/meal_response.dart' as meal;

import 'dart:developer' as developer;

import '../component/menu_experience_screen_vm.dart';

class MenuManager extends StatefulWidget {
  const MenuManager({
    required meal.MealResponse mealResponse,
    required dish.DishList dishResponse,
    required MenuExperienceScreenViewModel viewModel,
    Key? key,
  })  : _mealResponse = mealResponse,
        _dishResponse = dishResponse,
        _viewModel = viewModel,
        super(key: key);

  final meal.MealResponse _mealResponse;
  final dish.DishList _dishResponse;
  final MenuExperienceScreenViewModel _viewModel;

  @override
  _MenuManagerState createState() => _MenuManagerState();
}

class _MenuManagerState extends State<MenuManager> {
  final TextController _descriptionController = TextController();
  final TextController _dishController = TextController();
  final TextController _priceController = TextController();
  final TextController _servingController = TextController();

  final _appService = locateService<ApplicationService>();

  MenuHelper menuHelper = MenuHelper();
  //late MenuExperienceScreenViewModel viewModel;
  // final mealItems = <String>[
  //   'main course',
  //   'BBQ',
  //   'Salad',
  // ];
  // final foodItems = <String>[
  //   'Kabab',
  //   'Platter',
  //   'Salad',
  // ];

  final mealItems = <String>[];
  final foodItems = <String>[];

  final mealMap = {};
  final dishMap = {};

  @override
  void initState() {
    loadItems();
    _appService.updateMenuHelper(menuHelper);
    super.initState();
  }

  void loadItems() {
    for (int i = 0; i < widget._mealResponse.t.length; i++) {
      mealItems.add(widget._mealResponse.t[i].name);
      mealMap[widget._mealResponse.t[i].name] = widget._mealResponse.t[i].id;
    }

    for (int i = 0; i < widget._dishResponse.t.length; i++) {
      foodItems.add(widget._dishResponse.t[i].name);

      dishMap[widget._dishResponse.t[i].name] = widget._dishResponse.t[i].id;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 218,
            width: double.infinity,
            child: Image.asset(Resources.expHeaderBGPNG),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 29),
            child: GeneralText(
              Strings.menuExperienceTitle,
              textAlign: TextAlign.start,
              style: appTheme.typographies.interFontFamily.headline4.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 29),
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 19),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: Color(0xff34343B),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GeneralText(
                            Strings.menuExperienceMealTitle,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: const Color(0xfffbeccb),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GeneralDropdown(
                            name: 'Select',
                            items: mealItems,
                            borderColor: appTheme.colors.textFieldBorderColor,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                            onChange: ({
                              required String key,
                              required dynamic value,
                            }) {
                              menuHelper.selectedMealId = mealMap[value];
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GeneralText(
                            Strings.menuExperienceFoodTitle,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: const Color(0xfffbeccb),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GeneralDropdown(
                            name: 'Select',
                            items: foodItems,
                            borderColor: appTheme.colors.textFieldBorderColor,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                            onChange: ({
                              required String key,
                              required dynamic value,
                            }) {
                              menuHelper.selectedDishId = dishMap[value];
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 26,
                ),
                GeneralText(
                  Strings.menuExperienceDishTitle,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: appTheme.typographies.interFontFamily.headline4
                      .copyWith(
                          color: const Color(0xfffbeccb),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 7,
                ),
                GeneralTextInput(
                    height: 51,
                    controller: _dishController,
                    inputType: InputType.text,
                    backgroundColor: appTheme.colors.textFieldFilledColor,
                    inputBorder: appTheme.focusedBorder,
                    valueStyle: const TextStyle(color: Colors.white),
                    hint: 'EBeef Kebab',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4), fontSize: 14),
                    // valueStyle: valueStyle,
                    onChanged: (newValue) {
                      // _appService.state.experienceHelper!.dishName = newValue;

                      menuHelper.selectedDishName = newValue;
                    }),
                const SizedBox(
                  height: 26,
                ),
                GeneralText(
                  Strings.menuExperienceDescriptionTitle,
                  textAlign: TextAlign.center,
                  style: appTheme.typographies.interFontFamily.headline6
                      .copyWith(
                          color: const Color(0xfffbeccb),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                GeneralTextInput(
                    height: 80,
                    controller: _descriptionController,
                    inputType: InputType.text,
                    isMultiline: true,
                    backgroundColor: appTheme.colors.textFieldFilledColor,
                    inputBorder: appTheme.focusedBorder,
                    valueStyle: const TextStyle(color: Colors.white),
                    hint:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4), fontSize: 14),
                    // valueStyle: valueStyle,
                    onChanged: (newValue) {
                      // _appService.state.experienceHelper!.dishDescription =
                      //     newValue;

                      menuHelper.givenDescription = newValue.trim();
                    }),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GeneralText(
                            Strings.menuExperiencePriceTitle,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: const Color(0xfffbeccb),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GeneralTextInput(
                              height: 51,
                              controller: _priceController,
                              inputType: InputType.digit,
                              backgroundColor:
                                  appTheme.colors.textFieldFilledColor,
                              inputBorder: appTheme.focusedBorder,
                              valueStyle: const TextStyle(color: Colors.white),
                              hint: 'Enter price',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.4),
                                  fontSize: 14),
                              // valueStyle: valueStyle,
                              onChanged: (newValue) {
                                // _appService.state.experienceHelper!
                                //     .dishPrice = double.parse(newValue);

                                menuHelper.givenPrice = double.parse(newValue);
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GeneralText(
                            Strings.menuExperienceServingTitle,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: const Color(0xfffbeccb),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GeneralTextInput(
                              height: 51,
                              controller: _servingController,
                              inputType: InputType.digit,
                              backgroundColor:
                                  appTheme.colors.textFieldFilledColor,
                              inputBorder: appTheme.focusedBorder,
                              valueStyle: const TextStyle(color: Colors.white),
                              hint: '2',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.4),
                                  fontSize: 14),
                              // valueStyle: valueStyle,
                              onChanged: (newValue) {
                                // _appService.state.experienceHelper!
                                //         .dishServingNoOfPerson =
                                //     int.parse(newValue);

                                menuHelper.dishServingNoOfPerson =
                                    int.parse(newValue);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 26,
                ),
                GeneralText(
                  Strings.menuExperiencePictureTitle,
                  textAlign: TextAlign.center,
                  style: appTheme.typographies.interFontFamily.headline6
                      .copyWith(
                          color: const Color(0xfffbeccb),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 51,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xfff1c452),
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GeneralText(
                        Strings.menuExperienceUploadPictureTitle,
                        textAlign: TextAlign.center,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                      ),
                      Image.asset(
                        Resources.expUploadImagePNG,
                        height: 23,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    widget._viewModel.saveMenu(context);
                  },
                  child: GeneralText(
                    Strings.menuSave.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: appTheme.typographies.interFontFamily.headline4
                        .copyWith(
                            color: const Color(0xffbb3127),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                GeneralText(
                  Strings.menuExperienceAddMoreTitle.toUpperCase(),
                  textAlign: TextAlign.start,
                  style: appTheme.typographies.interFontFamily.headline4
                      .copyWith(
                          color: const Color(0xffbb3127),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    clearEntries();
                  },
                  child: Image.asset(
                    Resources.expPlusPNG,
                    height: 74,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }

  void clearEntries() {
    _descriptionController.clear();
    _dishController.clear();
    _priceController.clear();
    _servingController.clear();
  }
}

class ChipsWidget extends StatelessWidget {
  const ChipsWidget({
    Key? key,
    required this.appTheme,
    required this.title,
    this.selected = false,
    this.widthContainer = 130,
  }) : super(key: key);

  final IAppThemeData appTheme;
  final String title;
  final bool selected;
  final double widthContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        // width: widthContainer,
        child: GeneralText(
          title.capitalize(),
          textAlign: TextAlign.center,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              color: selected ? Colors.black : Colors.white,
              fontSize: 15,
              fontWeight: selected ? FontWeight.bold : FontWeight.w500),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: appTheme.colors.textFieldBorderColor,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(
            30,
          ),
          color: selected
              ? appTheme.colors.textFieldBorderColor
              : Colors.transparent,
        ));
  }
}

class SocialMediaHandles {
  String? socialMediaName;
  String? socialMediaIcon;

  SocialMediaHandles({this.socialMediaIcon, this.socialMediaName});
}