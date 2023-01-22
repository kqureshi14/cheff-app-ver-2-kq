import 'package:chef/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../../helpers/color_helper.dart';
import '../../theme/app_theme_widget.dart';
import '../../ui_kit/widgets/general_button.dart';
import '../../ui_kit/widgets/general_text.dart';
import '../home/popular_food_detail.dart';

class ShowOffTimeScreen extends StatefulWidget {
  const ShowOffTimeScreen({Key? key}) : super(key: key);

  @override
  State<ShowOffTimeScreen> createState() => _ShowOffTimeScreenState();
}

class _ShowOffTimeScreenState extends State<ShowOffTimeScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: getSaveButton(appTheme: appTheme),
        backgroundColor: HexColor.fromHex("#212129"),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                height: 218,
                child: Image.asset("assets/images/icons/show_off_time.png",

                )),
            Stack(
              children: [
                Positioned(
                  right: -150,
                  top: -40,
                  // bottom: -10,
                  child: Container(
                    width: 300,
                    height: 400,
                    child: Image.asset(
                      'assets/images/icons/food_product_ring.png',
                      color: Color(0xfff1c452).withOpacity(0.2),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 29),
                          child: GeneralText(
                            Strings.timeToShowLabel,
                            style: appTheme
                                .typographies.interFontFamily.headline6
                                .copyWith(
                                    fontSize: 24,
                                    color: HexColor.fromHex('#ffffff')),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 29, end: 35),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 53,
                          ),
                          uploadVideos(appTheme),
                          SizedBox(
                            height: 16,
                          ),
                          uploadPictures(appTheme),
                          SizedBox(
                            height: 28,
                          ),
                          Center(child: keepInMindLink(appTheme)),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget uploadVideos(IAppThemeData appTheme) {
    return Container(
      decoration: BoxDecoration(
          color: HexColor.fromHex("#ffffff"),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(left: 20, right: 24, top: 20.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GeneralText(
                Strings.uploadVideosLabel,
                style: appTheme.typographies.interFontFamily.headline6.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: HexColor.fromHex('#212129')),
              ),
              Row(
                children: [
                  GeneralText(
                    Strings.uploadVideosProgressValue,
                    style: appTheme.typographies.interFontFamily.headline6
                        .copyWith(
                            fontSize: 12, color: HexColor.fromHex('#8ea659')),
                  ),
                  SizedBox(
                    width: 5.5,
                  ),
                  Container(
                      width: 24,
                      child:
                          Image.asset("assets/images/icons/upload_videos.png"))
                ],
              )
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Container(
            height: 7,
            width: MediaQuery.of(context).size.width / 2.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: HexColor.fromHex("#8ea659")),
          )
        ],
      ),
    );
  }

  Widget uploadPictures(IAppThemeData appTheme) {
    return Container(
      decoration: BoxDecoration(
          color: HexColor.fromHex("#ffffff"),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(left: 20, right: 24, top: 20.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GeneralText(
                Strings.uploadPicturesLabel,
                style: appTheme.typographies.interFontFamily.headline6.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: HexColor.fromHex('#212129')),
              ),
              Row(
                children: [
                  GeneralText(
                    Strings.uploadPicturesProgressValue,
                    style: appTheme.typographies.interFontFamily.headline6
                        .copyWith(
                            fontSize: 12, color: HexColor.fromHex('#8ea659')),
                  ),
                  SizedBox(
                    width: 5.5,
                  ),
                  Container(
                      width: 24,
                      child: Image.asset(
                          "assets/images/icons/upload_pictures.png"))
                ],
              )
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Container(
            height: 7,
            width: MediaQuery.of(context).size.width / 1.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: HexColor.fromHex("#8ea659")),
          )
        ],
      ),
    );
  }

  Widget keepInMindLink(IAppThemeData appTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 24, child: Image.asset("assets/images/icons/info_icon.png")),
        SizedBox(
          width: 8,
        ),
        GeneralText(
          Strings.keepInMindLabel,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              fontSize: 15,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w300,
              color: HexColor.fromHex('#f1c452')),
        ),
      ],
    );
  }

  Widget getSaveButton({required IAppThemeData appTheme}) {
    return GeneralButton.button(
      width: 181,
      title: Strings.saveButtonLabel.toUpperCase(),
      styleType: ButtonStyleType.fill,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return PopularFoodDetails();
        }));
      },
    );
  }
}
