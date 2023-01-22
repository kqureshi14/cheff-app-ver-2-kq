import 'package:chef/screens/experience/show_off_screen_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/resources.dart';
import '../../constants/strings.dart';
import '../../helpers/color_helper.dart';
import '../../theme/app_theme_data/app_theme_data.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/widgets/general_text.dart';
// import '../show_off_time/show_off_time_screen.dart';

class SetupScheduleScreen extends StatefulWidget {
  const SetupScheduleScreen({Key? key}) : super(key: key);

  @override
  State<SetupScheduleScreen> createState() => _SetupScheduleScreenState();
}

class _SetupScheduleScreenState extends State<SetupScheduleScreen> {
  bool repeatChecked = false;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Scaffold(
      backgroundColor: HexColor.fromHex("#212129"),
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
                        builder: (context) => const ShowOffTimeScreen()),
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
        child: Column(children: [
          Container(
            height: 218,
            width: double.infinity,
            child: Image.asset(Resources.expHeaderBGPNG),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 29),
                child: GeneralText(
                  Strings.setYourScheduleLabel,
                  style: appTheme.typographies.interFontFamily.headline6
                      .copyWith(
                          fontSize: 24, color: HexColor.fromHex('#ffffff')),
                ),
              ),
            ],
          ),


          Container(
            margin: EdgeInsetsDirectional.only(start: 40, bottom: 50),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: HexColor.fromHex("#ffffff"),
                              ))
                        ],
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                             Column(children: [

                              GeneralText('MON'.toUpperCase(),
                                  style: appTheme.typographies
                                      .interFontFamily.headline6
                                      .copyWith(
                                      color:
                                      HexColor.fromHex('#f1c452'),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                              GeneralText('13',
                                  style: appTheme.typographies
                                      .interFontFamily.headline2
                                      .copyWith(
                                    color: HexColor.fromHex('#909094'),
                                    fontSize: 40,
                                  ))
                            ]),
                            SizedBox(
                              width: 27,
                            ),
                            Expanded(
                              child: Container(
                                 width: double.infinity,
                                padding: EdgeInsets.only(
                                    left: 8, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    color: HexColor.fromHex('#2b2b33'),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                child: Wrap(children: [
                                  timeSelectorBox(appTheme,
                                      showSelectedTime: false),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  timeSelectorBox(appTheme,
                                      showSelectedTime: false),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  timeSelectorBox(appTheme,
                                      showSelectedTime: false),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  timeSelectorBox(appTheme,
                                      showSelectedTime: false),
                                  SizedBox(
                                    width: 7,
                                  ),
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
          ),

          SizedBox(
            height: 37,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (repeatChecked) {
                              repeatChecked = false;
                            } else {
                              repeatChecked = true;
                            }
                          });
                        },
                        icon: Icon(
                          repeatChecked
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank,
                          color: HexColor.fromHex('#f1c452'),
                        )),
                    // SizedBox(
                    //   width: 12.5,
                    // ),
                    GeneralText(
                      Strings.scheduleSetupRepeatText,
                      style: appTheme.typographies.interFontFamily.headline6
                          .copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: HexColor.fromHex('#ffffff'),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ShowOffTime()));
                  },
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                        color: HexColor.fromHex("#bb3127"),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.add_sharp,
                        size: 35,
                        color: HexColor.fromHex("#ffffff"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 49.5,
          ),
        ]),
      ),
    );
  }
  Widget timeSelectorBox(IAppThemeData appTheme,
      {bool showSelectedTime = false}) {
    return Container(
      // width: 71,
      // height: 36,
      child: GeneralText('10 AM',
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              color: showSelectedTime
                  ? HexColor.fromHex('#212129')
                  : HexColor.fromHex('#f1c452'),
              fontSize: 14)),
      decoration: BoxDecoration(
          border: Border.all(color: HexColor.fromHex('#f1c452')),
          color: showSelectedTime
              ? HexColor.fromHex('#f1c452')
              : HexColor.fromHex('#2b2b33'),
          borderRadius: BorderRadius.circular(10)),
      padding:
      EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 16, end: 16),
      margin: EdgeInsetsDirectional.only(bottom: 8),
    );
  }
}
