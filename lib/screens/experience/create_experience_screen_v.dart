import 'package:chef/helpers/helpers.dart';

import '../../../helpers/color_helper.dart';
import 'menu_experience_screen_v.dart';

class CreateExperienceScreen extends StatefulWidget {
  const CreateExperienceScreen({Key? key}) : super(key: key);

  @override
  _CreateExperienceScreenState createState() => _CreateExperienceScreenState();
}

class _CreateExperienceScreenState extends State<CreateExperienceScreen> {
  final TextController _experienceController = TextController();
  final TextController _titleController = TextController();
  final TextController _priceController = TextController();
  final TextController _personController = TextController();
  final TextController _locationController = TextController();
  final TextController _nameController = TextController();
  final TextController _mobileController = TextController();

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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SignUpLetsStartScreen()),
                  // );
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
                        builder: (context) => const MenuExperienceScreen()),
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

      // InkWell(
      //   onTap: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) =>
      //           const SignUpLetsStartScreen()),
      //     );
      //   },
      //   child: Padding(
      //     padding: EdgeInsets.only(right: 32),
      //     child: Align(
      //       alignment: Alignment.bottomRight,
      //       child: SvgPicture.asset(
      //         Resources.getSignInRightArrow,
      //       ),
      //     ),
      //   ),
      // ),
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
              //   alignment: Alignment.center,
              //  padding: const EdgeInsets.only(left: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralText(
                    Strings.createExperienceTitle,
                    textAlign: TextAlign.start,
                    style: appTheme.typographies.interFontFamily.headline4
                        .copyWith(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralText(
                          Strings.createExperienceTitleField,
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
                            height: 80,
                            controller: _titleController,
                            inputType: InputType.text,
                            backgroundColor:
                                appTheme.colors.textFieldFilledColor,
                            inputBorder: appTheme.focusedBorder,
                            valueStyle: const TextStyle(color: Colors.white),
                            hint: 'Enter title',
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 14),
                            // valueStyle: valueStyle,
                            onChanged: (newValue) {}),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralText(
                          Strings.createExperienceSubTitleField,
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
                            controller: _experienceController,
                            inputType: InputType.text,
                            isMultiline: true,
                            backgroundColor:
                                appTheme.colors.textFieldFilledColor,
                            inputBorder: appTheme.focusedBorder,
                            valueStyle: const TextStyle(color: Colors.white),
                            hint:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 14),
                            // valueStyle: valueStyle,
                            onChanged: (newValue) {}),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GeneralText(
                        Strings.createExperienceWowFactorsTitle,
                        textAlign: TextAlign.center,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                                color: const Color(0xfffbeccb),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 12,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Hill View',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Rooftop',
                            selected: true,
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Terrace',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Garden',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'CHistorical Monument',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Pet friendly',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Parking',
                            selected: true,
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Wifi',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Movies',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Air Conditioning',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Candles',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Fireworks',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Kids Activities',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GeneralText(
                        Strings.createExperiencePreferenceTitle,
                        textAlign: TextAlign.center,
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                                color: const Color(0xfffbeccb),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 12,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Males',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Females',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Couple',
                            selected: true,
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Family',
                          ),
                          ChipsWidget(
                            appTheme: appTheme,
                            title: 'Friends & Family',
                            selected: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          GeneralText(
                            Strings.createExperiencePriceTitle,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: const Color(0xfffbeccb),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          Image.asset(
                            Resources.transparentRingPNG,
                            height: 22,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GeneralText(
                            Strings.createExperiencePerItemTitle,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: const Color(0xff909094),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          Image.asset(
                            Resources.checkPNG,
                            height: 22,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GeneralText(
                            Strings.createExperienceLabelTitle,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 29),
                        child: Row(
                          children: [
                            Expanded(
                              child: GeneralTextInput(
                                  height: 51,
                                  controller: _priceController,
                                  inputType: InputType.text,
                                  isMultiline: true,
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
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: GeneralTextInput(
                                  height: 51,
                                  controller: _personController,
                                  inputType: InputType.text,
                                  isMultiline: true,
                                  backgroundColor:
                                      appTheme.colors.textFieldFilledColor,
                                  inputBorder: appTheme.focusedBorder,
                                  valueStyle:
                                      const TextStyle(color: Colors.white),
                                  hint: '02',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 14),
                                  // valueStyle: valueStyle,
                                  onChanged: (newValue) {}),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 54,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          GeneralText(
                            Strings.createExperienceLocationTitle,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: const Color(0xfffbeccb),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          Image.asset(
                            Resources.transparentRingPNG,
                            height: 22,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GeneralText(
                            Strings.createExperienceHomeTitle,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: const Color(0xff909094),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          Image.asset(
                            Resources.checkPNG,
                            height: 22,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GeneralText(
                            Strings.createExperienceOtherTitle,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 29),
                        child: Row(
                          children: [
                            Expanded(
                              child: GeneralTextInput(
                                  height: 51,
                                  controller: _locationController,
                                  inputType: InputType.text,
                                  isMultiline: true,
                                  backgroundColor:
                                      appTheme.colors.textFieldFilledColor,
                                  inputBorder: appTheme.focusedBorder,
                                  valueStyle:
                                      const TextStyle(color: Colors.white),
                                  hint: 'Enter Location',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 14),
                                  // valueStyle: valueStyle,
                                  onChanged: (newValue) {}),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 52,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          GeneralText(
                            Strings.createExperienceSubHostTitle,
                            textAlign: TextAlign.center,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    color: const Color(0xfffbeccb),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          Image.asset(
                            Resources.transparentRingPNG,
                            height: 22,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 29),
                        child: Row(
                          children: [
                            Expanded(
                              child: GeneralTextInput(
                                  height: 51,
                                  controller: _nameController,
                                  inputType: InputType.text,
                                  isMultiline: true,
                                  backgroundColor:
                                      appTheme.colors.textFieldFilledColor,
                                  inputBorder: appTheme.focusedBorder,
                                  valueStyle:
                                      const TextStyle(color: Colors.white),
                                  hint: 'Name',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 14),
                                  // valueStyle: valueStyle,
                                  onChanged: (newValue) {}),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: GeneralTextInput(
                                  height: 51,
                                  controller: _mobileController,
                                  inputType: InputType.text,
                                  isMultiline: true,
                                  backgroundColor:
                                      appTheme.colors.textFieldFilledColor,
                                  inputBorder: appTheme.focusedBorder,
                                  valueStyle:
                                      const TextStyle(color: Colors.white),
                                  hint: 'Mobile',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 14),
                                  // valueStyle: valueStyle,
                                  onChanged: (newValue) {}),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                ],
              ),
            )
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
