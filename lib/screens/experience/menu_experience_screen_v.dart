import 'package:chef/helpers/helpers.dart';
import 'package:chef/screens/experience/schedule_screen_v.dart';

import '../../../helpers/color_helper.dart';

class MenuExperienceScreen extends StatefulWidget {
  const MenuExperienceScreen({Key? key}) : super(key: key);

  @override
  _MenuExperienceScreenState createState() => _MenuExperienceScreenState();
}

class _MenuExperienceScreenState extends State<MenuExperienceScreen> {
  final TextController _descriptionController = TextController();
  final TextController _dishController = TextController();
  final TextController _priceController = TextController();
  final TextController _servingController = TextController();
  final mealItems = <String>[
    'main course',
    'BBQ',
    'Salad',
  ];
  final foodItems = <String>[
    'Kabab',
    'Platter',
    'Salad',
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Scaffold(
      backgroundColor: appTheme.colors.primaryBackground,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          margin: EdgeInsets.only(left: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                 Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  Resources.getSignInLeftArrow,
                  color: Color(0xfff1c452),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SetupScheduleScreen()),
                  );
                },
                child: SvgPicture.asset(
                  Resources.getSignInRightArrow,
                  color: Color(0xfff1c452),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
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
              //   alignment: Alignment.center,
              //  padding: const EdgeInsets.only(left: 29),
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
                              }) {},
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
                              }) {},
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
                      onChanged: (newValue) {}),
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
                      onChanged: (newValue) {}),
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
                                inputType: InputType.text,
                                backgroundColor:
                                    appTheme.colors.textFieldFilledColor,
                                inputBorder: appTheme.focusedBorder,
                                valueStyle:
                                    const TextStyle(color: Colors.white),
                                hint: 'Enter price',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                    fontSize: 14),
                                // valueStyle: valueStyle,
                                onChanged: (newValue) {}),
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
                                inputType: InputType.text,
                                backgroundColor:
                                    appTheme.colors.textFieldFilledColor,
                                inputBorder: appTheme.focusedBorder,
                                valueStyle:
                                    const TextStyle(color: Colors.white),
                                hint: '2',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                    fontSize: 14),
                                // valueStyle: valueStyle,
                                onChanged: (newValue) {}),
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
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GeneralText(
                    Strings.menuExperienceAddMoreTitle.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: appTheme.typographies.interFontFamily.headline4
                        .copyWith(
                            color: const Color(0xffbb3127),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    Resources.expPlusPNG,
                    height: 74,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
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
