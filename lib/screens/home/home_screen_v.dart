import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../../helpers/color_helper.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../experience/experience_questionire_v.dart';

class LoungeHomeScreen extends StatefulWidget {
  const LoungeHomeScreen({Key? key}) : super(key: key);

  @override
  State<LoungeHomeScreen> createState() => _LoungeHomeScreenState();
}

class _LoungeHomeScreenState extends State<LoungeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                      "assets/images/icons/lounge_dashboard_bg.png"),
                )),
                width: double.infinity,
                height: 218,
                child: Center(
                  child: GeneralText(
                    Strings.loungeHeaderLabel,
                    style: appTheme
                        .typographies.interFontFamily.headline6
                        .copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: HexColor.fromHex('#ffffff'),
                    ),
                  ),
                ),
              ),
            ),

              Positioned(
                bottom: -290,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsetsDirectional.only(
                        start: 47, end: 43, top: 33, bottom: 113),
                    // height: 255,
                    decoration: BoxDecoration(
                        color: HexColor.fromHex("#212129"),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(44),
                            topRight: Radius.circular(44))),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 108,
                                  width: 117,
                                  padding: EdgeInsetsDirectional.only(
                                      bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: HexColor.fromHex(
                                                  "#4b4b52")))),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                              right: -15,
                                              top: 10,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color:
                                                    HexColor.fromHex(
                                                        "#bb3127"),
                                                    shape:
                                                    BoxShape.circle),
                                                width: 13,
                                                height: 13,
                                              )),
                                          GeneralText(
                                            Strings.loungeNewValue,
                                            style: appTheme.typographies
                                                .interFontFamily.headline6
                                                .copyWith(
                                              fontSize: 45,
                                              fontWeight: FontWeight.w600,
                                              color: HexColor.fromHex(
                                                  '#fee4a4'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GeneralText(
                                        Strings.loungeNewLabel,
                                        style: appTheme.typographies
                                            .interFontFamily.headline6
                                            .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color:
                                          HexColor.fromHex('#fee4a4'),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                width: 1,
                                height: 49,
                                color: HexColor.fromHex("#4b4b52"),
                              ),
                              Container(
                                  height: 108,
                                  width: 117,
                                  padding: EdgeInsetsDirectional.only(
                                      bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: HexColor.fromHex(
                                                  "#4b4b52")))),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      GeneralText(
                                        Strings.loungeAcceptedValue,
                                        style: appTheme.typographies
                                            .interFontFamily.headline6
                                            .copyWith(
                                          fontSize: 35,

                                          fontWeight: FontWeight.w300,
                                          color:
                                          HexColor.fromHex('#ea7458'),
                                        ),
                                      ),
                                      GeneralText(
                                        Strings.loungeAcceptedLabel,
                                        style: appTheme.typographies
                                            .interFontFamily.headline6
                                            .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                          HexColor.fromHex('#909094'),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 117,
                                  padding: EdgeInsetsDirectional.only(
                                      bottom: 10),
                                  child: Column(
                                    children: [
                                      GeneralText(
                                        Strings.loungeConfirmedValue,
                                        style: appTheme.typographies
                                            .interFontFamily.headline6
                                            .copyWith(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w300,
                                          color:
                                          HexColor.fromHex('#b0c18b'),
                                        ),
                                      ),
                                      GeneralText(
                                        Strings.loungeConfirmedLabel,
                                        style: appTheme.typographies
                                            .interFontFamily.headline6
                                            .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                          HexColor.fromHex('#909094'),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                width: 1,
                                height: 49,
                                color: HexColor.fromHex("#4b4b52"),
                              ),
                              Container(
                                  width: 117,
                                  padding: EdgeInsetsDirectional.only(
                                      bottom: 10),
                                  child: Column(
                                    children: [
                                      GeneralText(
                                        Strings.loungeInProgressValue,
                                        style: appTheme.typographies
                                            .interFontFamily.headline6
                                            .copyWith(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w300,
                                          color:
                                          HexColor.fromHex('#f1c452'),
                                        ),
                                      ),
                                      GeneralText(
                                        Strings.loungeInProgressLabel,
                                        style: appTheme.typographies
                                            .interFontFamily.headline6
                                            .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                          HexColor.fromHex('#909094'),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              Positioned(
                right: 0,
                left: 0,
                top:  450,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsetsDirectional.only(
                          start: 47, end: 43, top: 94, bottom: 50),
                      decoration: BoxDecoration(
                          color: HexColor.fromHex("#bb3127"),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(44),
                              topRight: Radius.circular(44))),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: HexColor.fromHex(
                                              "#e7f8f2")))),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const ExperienceQuestionireScreen()),
                                      );
                                     //
                                    },
                                    child: Container(
                                        width: 121,
                                        padding: EdgeInsetsDirectional.only(
                                            bottom: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                                width: 27.6,
                                                child: Image.asset(
                                                    "assets/images/icons/experiences.png")),
                                            SizedBox(
                                              height: 9.2,
                                            ),
                                            GeneralText(
                                              Strings.loungeExperiencesLabel,
                                              style: appTheme.typographies
                                                  .interFontFamily.headline6
                                                  .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: HexColor.fromHex(
                                                    '#ffffff'),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 121,
                                    color: HexColor.fromHex("#e7f8f2"),
                                  ),
                                  Container(
                                      width: 121,
                                      padding: EdgeInsetsDirectional.only(
                                          bottom: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 30.2,
                                              child: Image.asset(
                                                  "assets/images/icons/earnings.png")),
                                          SizedBox(
                                            height: 9.2,
                                          ),
                                          GeneralText(
                                            Strings.loungeEarningLabel,
                                            style: appTheme.typographies
                                                .interFontFamily.headline6
                                                .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor.fromHex(
                                                  '#ffffff'),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 121,
                                    padding: EdgeInsetsDirectional.only(
                                        bottom: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 26.1,
                                            child: Image.asset(
                                                "assets/images/icons/history_recent.png")),
                                        SizedBox(
                                          height: 9.2,
                                        ),
                                        GeneralText(
                                          Strings.loungeHistoryLabel,
                                          style: appTheme.typographies
                                              .interFontFamily.headline6
                                              .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color:
                                            HexColor.fromHex('#ffffff'),
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: 1,
                                  height: 121,
                                  color: HexColor.fromHex("#e7f8f2"),
                                ),
                                Container(
                                    width: 121,
                                    padding: EdgeInsetsDirectional.only(
                                        bottom: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: 18.7,
                                            child: Image.asset(
                                                "assets/images/icons/people.png")),
                                        SizedBox(
                                          height: 9.2,
                                        ),
                                        GeneralText(
                                          Strings.loungeProfileLabel,
                                          style: appTheme.typographies
                                              .interFontFamily.headline6
                                              .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color:
                                            HexColor.fromHex('#ffffff'),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: -290,
                child: Center(
                  child: Container(
                    height: 102,
                    width: 102,
                    decoration: BoxDecoration(
                        color: HexColor.fromHex("#f1c452"),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 44.3,
                              child: Image.asset(
                                  "assets/images/icons/lounge_qr_code.png")),
                          SizedBox(
                            height: 9.9,
                          ),
                          GeneralText(
                            "Start",
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: HexColor.fromHex('#212129'),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),



          ],
        ),
      ),
    );
  }
}
