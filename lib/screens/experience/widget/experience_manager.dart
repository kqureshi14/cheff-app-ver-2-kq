import '../../../helpers/experience_helper.dart';
import '../../../helpers/helpers.dart';
import '../../../models/preference.dart' as preference;
import '../../../models/wow_factor/wow_factor_response.dart' as wow;
import '../../../setup.dart';

import 'dart:developer' as developer;

@injectable
class ExperienceManager extends StatefulWidget {
  const ExperienceManager({
    required wow.WowFactorResponse wowFactor,
    required preference.PreferenceResponse preferences,
    Key? key,
  })  : _wowFactor = wowFactor,
        _preferences = preferences,
        super(key: key);

  final _wowFactor;
  final _preferences;


  @override
  State<ExperienceManager> createState() => ExperienceManagerState();
}

class ExperienceManagerState extends State<ExperienceManager> {
  final TextController _experienceController = TextController();
  final TextController _titleController = TextController();
  final TextController _priceController = TextController();
  final TextController _personController = TextController();
  final TextController _locationController = TextController();
  final TextController _nameController = TextController();
  final TextController _mobileController = TextController();

  var price ='';
  var location ='';
  var subhost ='';

  final experienceHelper = ExperienceHelper();
  final _appService = locateService<ApplicationService>();

  @override
  void initState() {
    _appService.updateExperienceHelper(experienceHelper);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Scaffold(
      backgroundColor: appTheme.colors.primaryBackground,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 12),
      //   child: Container(
      //     margin: const EdgeInsets.only(left: 32),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         InkWell(
      //           onTap: () {
      //             // Navigator.push(
      //             //   context,
      //             //   MaterialPageRoute(
      //             //       builder: (context) => const SignUpLetsStartScreen()),
      //             // );
      //           },
      //           child: SvgPicture.asset(
      //             Resources.getSignInLeftArrow,
      //             color: Color(0xfff1c452),
      //           ),
      //         ),
      //         InkWell(
      //           onTap: () {
      //             // _appService.state?.experienceHelper   =_experienceHelper;
      //             _appService.updateExperienceHelper(_experienceHelper);
      //          //   saveExperience(context);
      //           },
      //           child: SvgPicture.asset(
      //             Resources.getSignInRightArrow,
      //             color: Color(0xfff1c452),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

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
              height: 228,
              width: double.infinity,
              child: Image.asset(
                Resources.expHeaderBGPNG,
                fit: BoxFit.fill,
              ),
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
                            fontSize: 24.0,
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
                                  fontSize: 18.0,
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
                                fontSize: 14.0),
                            // valueStyle: valueStyle,
                            onChanged: (newValue) {
                              _titleController.text = newValue;
                              developer.log(' Title Controller is ' +
                                  _titleController.text);
                              experienceHelper.titleExperience = newValue;
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralText(
                          Strings.createExperienceSubTitleField,
                          textAlign: TextAlign.center,
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                                  color: const Color(0xfffbeccb),
                                  fontSize: 18.0,
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
                                'Enter your experience description',
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 14.0),
                            // valueStyle: valueStyle,
                            onChanged: (newValue) {
                              experienceHelper.experienceDetails = newValue;
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),

                  displayWowFactor(appTheme, widget._wowFactor),
                  const SizedBox(
                    height: 10,
                  ),
                  displayPreferences(appTheme, widget._preferences),
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
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          InkWell(
                            onTap: () {
                              var currentSelectedOption = price;
                              if (!(currentSelectedOption ==
                                  Strings.createExperiencePerItemTitle)) {
                                changePriceOption(
                                    Strings.createExperiencePerItemTitle);
                              }
                            },
                            child: Container(
                              child: price ==
                                  Strings.createExperiencePerItemTitle
                                  ? Image.asset(
                                Resources.checkPNG,
                                height: 22,
                              )
                                  : Image.asset(
                                Resources. transparentRingPNG,
                                height: 22,
                              ),
                            ),),
                          SizedBox(
                            width: 11,
                          ),
                          GeneralText(
                            Strings.createExperiencePerItemTitle,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: price ==
                                Strings.createExperiencePerItemTitle?
                                const TextStyle(color: Colors.white): appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                color: const Color(0xff909094),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          InkWell(
                            onTap: () {
                              var currentSelectedOption = price;
                              if (!(currentSelectedOption ==
                                  Strings.createExperienceLabelTitle)) {
                                changePriceOption(
                                    Strings.createExperienceLabelTitle);
                              }
                            },
                            child: Container(
                              child: price ==
                                  Strings.createExperienceLabelTitle
                                  ? Image.asset(
                                Resources.checkPNG,
                                height: 22,
                              )
                                  : Image.asset(
                                Resources.transparentRingPNG,
                                height: 22,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GeneralText(
                            Strings.createExperienceLabelTitle,
                            textAlign: TextAlign.center,
                            style:price ==
                                Strings.createExperienceLabelTitle ?
                              const TextStyle(color: Colors.white): appTheme
                .typographies.interFontFamily.headline6
                .copyWith(
                color: const Color(0xff909094),
          fontSize: 15.0,
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
                                  inputType: InputType.digit,
                                  isMultiline: true,
                                  backgroundColor:
                                      appTheme.colors.textFieldFilledColor,
                                  inputBorder: appTheme.focusedBorder,
                                  valueStyle:
                                      const TextStyle(color: Colors.white),
                                  hint: 'Enter price',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 14.0),
                                  // valueStyle: valueStyle,
                                  onChanged: (newValue) {
                                    experienceHelper.priceExperience =
                                        double.parse(
                                            newValue); // priceExperience
                                  }),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: GeneralTextInput(
                                  height: 51,
                                  controller: _personController,
                                  inputType: InputType.digit,
                                  isMultiline: true,
                                  backgroundColor:
                                      appTheme.colors.textFieldFilledColor,
                                  inputBorder: appTheme.focusedBorder,
                                  valueStyle:
                                      const TextStyle(color: Colors.white),
                                  hint: '02',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 14.0),
                                  // valueStyle: valueStyle,
                                  onChanged: (newValue) {
                                    experienceHelper.personExperience =
                                        int.parse(newValue);
                                  }),
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
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          InkWell(
                            onTap: () {
                              var currentSelectedOption = location;
                              if (!(currentSelectedOption ==
                                  Strings.createExperienceHomeTitle)) {
                                changeLocataionOption(
                                    Strings.createExperienceHomeTitle);
                              }
                            },
                            child: Container(
                              child: location ==
                                  Strings.createExperienceHomeTitle
                                  ? Image.asset(
                                Resources.checkPNG,
                                height: 22,
                              )
                                  : Image.asset(
                                Resources. transparentRingPNG,
                                height: 22,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          GeneralText(
                            Strings.createExperienceHomeTitle,
                            textAlign: TextAlign.center,
                            style:location ==
                                Strings.createExperienceHomeTitle ?
                              const TextStyle(color: Colors.white): appTheme
                .typographies.interFontFamily.headline6
                .copyWith(
                color: const Color(0xff909094),
          fontSize: 15.0,
          fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          InkWell(
                            onTap: () {
                              var currentSelectedOption = location;
                              if (!(currentSelectedOption ==
                                  Strings.createExperienceOtherTitle)) {
                                changeLocataionOption(
                                    Strings.createExperienceOtherTitle);
                              }
                            },
                            child: Container(
                              child: location ==
                                  Strings.createExperienceOtherTitle
                                  ? Image.asset(
                                Resources.checkPNG,
                                height: 22,
                              )
                                  : Image.asset(
                                Resources. transparentRingPNG,
                                height: 22,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 11,
                          ),
                          GeneralText(
                            Strings.createExperienceOtherTitle,
                            textAlign: TextAlign.center,
                            style: location ==
                                Strings.createExperienceOtherTitle ?
                            const TextStyle(color: Colors.white): appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                color: const Color(0xff909094),
                                fontSize: 15.0,
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
                                      fontSize: 14.0),
                                  // valueStyle: valueStyle,
                                  onChanged: (newValue) {
                                    experienceHelper.locationExperience =
                                        newValue;
                                  }),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 52,
                  ),
                  // Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         GeneralText(
                  //           Strings.createExperienceSubHostTitle,
                  //           textAlign: TextAlign.center,
                  //           style: appTheme
                  //               .typographies.interFontFamily.headline6
                  //               .copyWith(
                  //               color: const Color(0xfffbeccb),
                  //               fontSize: 18.0,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //         SizedBox(
                  //           width: 22,
                  //         ),
                  //         InkWell(
                  //           onTap: () {
                  //             var currentSelectedOption = viewModel.subhost;
                  //             if (!(currentSelectedOption ==
                  //                 Strings.createExperienceSubHostTitle)) {
                  //               viewModel.changesubHostOption(
                  //                   Strings.createExperienceSubHostTitle);
                  //             }else{
                  //               viewModel.changesubHostOption(" ");
                  //             }
                  //           },
                  //           child: Container(
                  //             child: viewModel.subhost ==
                  //                 Strings.createExperienceSubHostTitle
                  //                 ? Image.asset(
                  //               Resources.checkPNG,
                  //               height: 22,
                  //             )
                  //                 : Image.asset(
                  //               Resources. transparentRingPNG,
                  //               height: 22,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.only(right: 29),
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child: GeneralTextInput(
                  //                 height: 51,
                  //                 controller: viewModel.nameController,
                  //                 inputType: InputType.text,
                  //                 isEnable:  ((viewModel.subhost ==
                  //                     Strings.createExperienceSubHostTitle))?true:false,
                  //                 isMultiline: true,
                  //                 backgroundColor:
                  //                 appTheme.colors.textFieldFilledColor,
                  //                 inputBorder: appTheme.focusedBorder,
                  //                 valueStyle:
                  //                 const TextStyle(color: Colors.white),
                  //                 hint: 'Name',
                  //                 hintStyle: TextStyle(
                  //                     color: Colors.white.withOpacity(0.4),
                  //                     fontSize: 14.0),
                  //                 // valueStyle: valueStyle,
                  //                 onChanged: (newValue) {
                  //                   viewModel.nameController.text = newValue;
                  //                   _experienceHelper.subHostName =
                  //                       newValue; // subHostName
                  //                 }),
                  //           ),
                  //           SizedBox(
                  //             width: 5,
                  //           ),
                  //           Expanded(
                  //             child: GeneralTextInput(
                  //                 height: 51,
                  //                 controller: viewModel.mobileController,
                  //                 inputType: InputType.digit,
                  //                 isMultiline: true,
                  //                 isEnable: ((viewModel.subhost ==
                  //                     Strings.createExperienceSubHostTitle))?true:false,
                  //                 backgroundColor:
                  //                 appTheme.colors.textFieldFilledColor,
                  //                 inputBorder: appTheme.focusedBorder,
                  //                 valueStyle:
                  //                 const TextStyle(color: Colors.white),
                  //                 hint: 'Mobile',
                  //                 hintStyle: TextStyle(
                  //                     color: Colors.white.withOpacity(0.4),
                  //                     fontSize: 14.0),
                  //                 // valueStyle: valueStyle,
                  //                 onChanged: (newValue) {
                  //                   viewModel.mobileController.text = newValue;
                  //                   _experienceHelper.subHostMobileNumber =
                  //                       newValue;
                  //                 }),
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),

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
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 22,
                          ),

                          InkWell(
                            onTap: () {
                              var currentSelectedOption = subhost;
                              if (!(currentSelectedOption ==
                                  Strings.createExperienceSubHostTitle)) {
                                changesubHostOption(
                                    Strings.createExperienceSubHostTitle);
                              }else{
                                changesubHostOption(" ");
                              }
                            },
                            child: Container(
                              child: subhost ==
                                  Strings.createExperienceSubHostTitle
                                  ? Image.asset(
                                Resources.checkPNG,
                                height: 22,
                              )
                                  : Image.asset(
                                Resources. transparentRingPNG,
                                height: 22,
                              ),
                            ),
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
                                  isEnable:  ((subhost ==
                                      Strings.createExperienceSubHostTitle))?true:false,
                                  isMultiline: true,
                                  backgroundColor:
                                      appTheme.colors.textFieldFilledColor,
                                  inputBorder: appTheme.focusedBorder,
                                  valueStyle:
                                      const TextStyle(color: Colors.white),
                                  hint: 'Name',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 14.0),
                                  // valueStyle: valueStyle,
                                  onChanged: (newValue) {
                                    experienceHelper.subHostName =
                                        newValue; // subHostName
                                  }),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: GeneralTextInput(
                                  height: 51,
                                  controller: _mobileController,
                                  inputType: InputType.digit,
                                  isMultiline: true,
                                  isEnable:  ((subhost ==
                                      Strings.createExperienceSubHostTitle))?true:false,
                                  backgroundColor:
                                      appTheme.colors.textFieldFilledColor,
                                  inputBorder: appTheme.focusedBorder,
                                  valueStyle:
                                      const TextStyle(color: Colors.white),
                                  hint: 'Mobile',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 14.0),
                                  // valueStyle: valueStyle,
                                  onChanged: (newValue) {
                                    experienceHelper.subHostMobileNumber =
                                        newValue;
                                  }),
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

  Widget displayWowFactor(appTheme, wow.WowFactorResponse wowFactor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.createExperienceWowFactorsTitle,
          textAlign: TextAlign.center,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              color: const Color(0xfffbeccb),
              fontSize: 18.0,
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
            for (var item in wowFactor.t)
              displayChipWidget(appTheme, item.name, item: item),
          ],
        ),
        //),
      ],
    );
  }

  Widget displayChipWidget(appTheme, String _titleName, {dynamic item}) {
    return InkWell(
      onTap: () {
        developer.log(' Clicked on Title Name is ' + _titleName);

        setState(() {
          if (item is wow.T) {
            developer.log(' item of wow factor is ' + item.name);
            if (experienceHelper.selectedWowFactors.containsKey(item.name)) {
              experienceHelper.selectedWowFactors.remove(item.name);
            } else {
              experienceHelper.selectedWowFactors[item.name] = item.id;
            }
          } else if (item is preference.T) {
            developer.log(' item of preference factor is ' + item.name);

            if (experienceHelper.selectedPerferencesFactors
                .containsKey(item.name)) {
              experienceHelper.selectedPerferencesFactors.remove(item.name);
            } else {
              experienceHelper.selectedPerferencesFactors[item.name] = item.id;
            }
          }
        });
      },
      child: ChipsWidget(
        appTheme: appTheme,
        title: _titleName,
        selected: isSelected(_titleName),
      ),
    );
  }

  bool isSelected(String nameOfItem) {
    if (experienceHelper.selectedWowFactors.containsKey(nameOfItem)) {
      return true;
    } else if (experienceHelper.selectedPerferencesFactors
        .containsKey(nameOfItem)) {
      return true;
    }
    return false;
  }

  Widget displayPreferences(
      appTheme, preference.PreferenceResponse preferences) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.createExperiencePreferenceTitle,
          textAlign: TextAlign.center,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              color: const Color(0xfffbeccb),
              fontSize: 18.0,
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
            for (var item in preferences.t)
              displayChipWidget(appTheme, item.name, item: item),
          ],
        ),
      ],
    );
  }

  // Widget displayChipWidget(appTheme, String _titleName) {
  //   return ChipsWidget(
  //     appTheme: appTheme,
  //     title: _titleName,
  //   );
  // }

  void changePriceOption(String option) {
    price = option;
   setState(() {
   });
  }
  void changeLocataionOption(String option) {
    location = option;
    setState(() {
    });
  }
  void changesubHostOption(String option) {
    subhost = option;
    setState(() {
    });
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
