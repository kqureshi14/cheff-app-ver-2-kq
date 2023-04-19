import 'package:chef/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../../helpers/color_helper.dart';
import '../../models/booking/booking_overview.dart';
import '../../setup.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../account_settings/user_profile_v.dart';
import '../booking/component/order_screen_v.dart';
import '../booking/food_item_bookng.dart';
import '../earnings/earning_screen_v.dart';
import 'experiences_details/experience_details_screen_v.dart';

class LoungeHomeScreen extends StatefulWidget {
  LoungeHomeScreen({required BookingOverview bookingOverview, Key? key})
      : _bookingOverview = bookingOverview,
        super(key: key);
  BookingOverview _bookingOverview;

  @override
  State<LoungeHomeScreen> createState() => _LoungeHomeScreenState();
}

class _LoungeHomeScreenState extends State<LoungeHomeScreen> {
  final _navigation = locateService<INavigationService>();
  final _appService = locateService<ApplicationService>();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage("assets/images/icons/lounge_dashboard_bg.png"),
                  alignment: Alignment.topRight,
                )),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 81,
                    ),
                    GeneralText(
                      // Strings.loungeHeaderLabel,
                      // widget._bookingOverview.t.
                      _appService.state.userInfo!.t.brandName,
                      style: appTheme.typographies.interFontFamily.headline6
                          .copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: HexColor.fromHex('#ffffff'),
                      ),
                    ),
                    const SizedBox(
                      height: 44,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: HexColor.fromHex("#212129"),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(44),
                                topRight: Radius.circular(44))),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 47, end: 43, top: 33, bottom: 77),
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              _appService.updateTitlePage(
                                                  Strings.newOrder);
                                              _navigation.navigateTo(
                                                  route: OrderRouteView(
                                                type: Strings.newData,
                                              ));
                                            },
                                            child: Container(
                                                height: 108,
                                                width: 117,
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        bottom: 10),
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color: HexColor
                                                                .fromHex(
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
                                                                  color: HexColor
                                                                      .fromHex(
                                                                          "#bb3127"),
                                                                  shape: BoxShape
                                                                      .circle),
                                                              width: 13,
                                                              height: 13,
                                                            )),
                                                        GeneralText(
                                                          // Strings.loungeNewValue,
                                                          widget._bookingOverview.t
                                                                      .newBookings
                                                                      .toString()
                                                                      .length ==
                                                                  1
                                                              ? '0${widget._bookingOverview.t.newBookings}'
                                                              : '${widget._bookingOverview.t.newBookings}',
                                                          style: appTheme
                                                              .typographies
                                                              .interFontFamily
                                                              .headline6
                                                              .copyWith(
                                                            fontSize: 40,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: HexColor
                                                                .fromHex(
                                                                    '#fee4a4'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    GeneralText(
                                                      Strings.loungeNewLabel,
                                                      style: appTheme
                                                          .typographies
                                                          .interFontFamily
                                                          .headline6
                                                          .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: HexColor.fromHex(
                                                            '#fee4a4'),
                                                      ),
                                                    ),
                                                  ],
                                                ))),
                                        Container(
                                          width: 1,
                                          height: 49,
                                          color: HexColor.fromHex("#4b4b52"),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              //  _navigate. OrderScreenView
                                              // _navigation.replace(
                                              //     route: OrderRouteView());
                                              _appService.updateTitlePage(
                                                  Strings.acceptData);
                                              _navigation.navigateTo(
                                                  route: OrderRouteView(
                                                type: Strings.acceptData,
                                              ));
                                            },
                                            child: Container(
                                                height: 108,
                                                width: 117,
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .only(bottom: 10),
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#4b4b52")))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    GeneralText(
                                                      //   Strings.loungeAcceptedValue,
                                                      widget._bookingOverview.t
                                                                  .acceptedBookings
                                                                  .toString()
                                                                  .length ==
                                                              1
                                                          ? '0${widget._bookingOverview.t.acceptedBookings}'
                                                          : '${widget._bookingOverview.t.acceptedBookings}',
                                                      style: appTheme
                                                          .typographies
                                                          .interFontFamily
                                                          .headline6
                                                          .copyWith(
                                                        fontSize: 35,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: HexColor.fromHex(
                                                            '#ea7458'),
                                                      ),
                                                    ),
                                                    GeneralText(
                                                      Strings
                                                          .loungeAcceptedLabel,
                                                      style: appTheme
                                                          .typographies
                                                          .interFontFamily
                                                          .headline6
                                                          .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: HexColor.fromHex(
                                                            '#909094'),
                                                      ),
                                                    ),
                                                  ],
                                                ))),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              _appService.updateTitlePage(
                                                  Strings.confirmed);
                                              _navigation.navigateTo(
                                                  route: OrderRouteView(
                                                type: Strings.confirmed,
                                              ));
                                            },
                                            child: Container(
                                                width: 117,
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        bottom: 10),
                                                child: Column(
                                                  children: [
                                                    GeneralText(
                                                      // Strings.loungeConfirmedValue,
                                                      widget._bookingOverview.t
                                                                  .confirmedBookings
                                                                  .toString()
                                                                  .length ==
                                                              1
                                                          ? '0${widget._bookingOverview.t.confirmedBookings}'
                                                          : '${widget._bookingOverview.t.confirmedBookings}',
                                                      style: appTheme
                                                          .typographies
                                                          .interFontFamily
                                                          .headline6
                                                          .copyWith(
                                                        fontSize: 35,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: HexColor.fromHex(
                                                            '#b0c18b'),
                                                      ),
                                                    ),
                                                    GeneralText(
                                                      Strings
                                                          .loungeConfirmedLabel,
                                                      style: appTheme
                                                          .typographies
                                                          .interFontFamily
                                                          .headline6
                                                          .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: HexColor.fromHex(
                                                            '#909094'),
                                                      ),
                                                    ),
                                                  ],
                                                ))),
                                        Container(
                                          width: 1,
                                          height: 49,
                                          color: HexColor.fromHex("#4b4b52"),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              _appService.updateTitlePage(
                                                  Strings.inProgress);
                                              _navigation.navigateTo(
                                                  route: OrderRouteView(
                                                type: Strings.inProgress,
                                              ));
                                            },
                                            child: Container(
                                                width: 117,
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        bottom: 10),
                                                child: Column(
                                                  children: [
                                                    GeneralText(
                                                      // Strings.loungeInProgressValue,
                                                      widget._bookingOverview.t
                                                                  .inProgressBookings
                                                                  .toString()
                                                                  .length ==
                                                              1
                                                          ? '0${widget._bookingOverview.t.inProgressBookings}'
                                                          : '${widget._bookingOverview.t.inProgressBookings}',
                                                      style: appTheme
                                                          .typographies
                                                          .interFontFamily
                                                          .headline6
                                                          .copyWith(
                                                        fontSize: 35,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: HexColor.fromHex(
                                                            '#f1c452'),
                                                      ),
                                                    ),
                                                    GeneralText(
                                                      Strings
                                                          .loungeInProgressLabel,
                                                      style: appTheme
                                                          .typographies
                                                          .interFontFamily
                                                          .headline6
                                                          .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: HexColor.fromHex(
                                                            '#909094'),
                                                      ),
                                                    ),
                                                  ],
                                                ))),
                                      ],
                                    ),
                                  ])),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsetsDirectional.only(
                                          start: 47,
                                          end: 43,
                                          top: 94,
                                          bottom: 50),
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
                                                          color:
                                                              HexColor.fromHex(
                                                                  "#e7f8f2")))),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ExperienceDetailsScreen()),
                                                      );
                                                      //
                                                    },
                                                    child: Container(
                                                        width: 121,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .only(
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
                                                              Strings
                                                                  .loungeExperiencesLabel,
                                                              style: appTheme
                                                                  .typographies
                                                                  .interFontFamily
                                                                  .headline6
                                                                  .copyWith(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: HexColor
                                                                    .fromHex(
                                                                        '#ffffff'),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    height: 121,
                                                    color: HexColor.fromHex(
                                                        "#e7f8f2"),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const EarningScreen()),
                                                      );
                                                    },
                                                    child: Container(
                                                        width: 121,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .only(
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
                                                              Strings
                                                                  .loungeEarningLabel,
                                                              style: appTheme
                                                                  .typographies
                                                                  .interFontFamily
                                                                  .headline6
                                                                  .copyWith(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: HexColor
                                                                    .fromHex(
                                                                        '#ffffff'),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const OrderHistoryScreen()),
                                                    );
                                                  },
                                                  child: Container(
                                                      width: 121,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .only(bottom: 10),
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
                                                            Strings
                                                                .loungeHistoryLabel,
                                                            style: appTheme
                                                                .typographies
                                                                .interFontFamily
                                                                .headline6
                                                                .copyWith(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: HexColor
                                                                  .fromHex(
                                                                      '#ffffff'),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                                Container(
                                                  width: 1,
                                                  height: 121,
                                                  color: HexColor.fromHex(
                                                      "#e7f8f2"),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    //UserProfileScreen
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const UserProfileScreen()),
                                                    );
                                                  },
                                                  child: Container(
                                                      width: 121,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .only(bottom: 10),
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
                                                            Strings
                                                                .loungeProfileLabel,
                                                            style: appTheme
                                                                .typographies
                                                                .interFontFamily
                                                                .headline6
                                                                .copyWith(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: HexColor
                                                                  .fromHex(
                                                                      '#ffffff'),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: -50,
                                    child: Center(
                                      child: Container(
                                        height: 102,
                                        width: 102,
                                        decoration: BoxDecoration(
                                            color: HexColor.fromHex("#f1c452"),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 44.3,
                                                  child: Image.asset(
                                                      "assets/images/icons/lounge_qr_code.png")),
                                              SizedBox(
                                                height: 9.9,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           FoodieProfileDetail()),
                                                  // );
                                                },
                                                child: GeneralText(
                                                  "Start",
                                                  style: appTheme.typographies
                                                      .interFontFamily.headline6
                                                      .copyWith(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: HexColor.fromHex(
                                                        '#212129'),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
