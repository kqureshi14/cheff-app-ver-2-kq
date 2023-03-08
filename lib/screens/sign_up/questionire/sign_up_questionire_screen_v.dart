import 'package:chef/helpers/helpers.dart';
import 'package:chef/models/signup/questionire_response.dart';
import 'package:chef/screens/sign_up/questionire/sign_up_questionire_screen_m.dart';
import 'package:chef/screens/sign_up/questionire/sign_up_questionire_screen_vm.dart';

import '../../../helpers/color_helper.dart';
import 'dart:developer' as developer;
import 'package:flutter_bloc/flutter_bloc.dart';

// class SignUpQuestionireScreen extends StatefulWidget {
//   @override
//   _SignUpQuestionireScreenState createState() =>
//       _SignUpQuestionireScreenState();
// }
//
// class _SignUpQuestionireScreenState extends State<SignUpQuestionireScreen> {

class SignUpQuestionireScreen extends BaseView<SignUpQuestionireScreenViewModel> {
  SignUpQuestionireScreen({Key? key}) : super(key: key);


  final TextController _journeyController = TextController();
  List<SocialMediaHandles> handlesList = [];

  void loadQuestionList(
      List<QuestionsList> questionsList,
      ) {
    for (int i = 0; i < questionsList.length; i++) {
      developer.log(' Question id is ' + '${questionsList[i].name}');
      // dropdownDetails[professionList[i].name] = professionList[i].id;
    }
  }

  @override
  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  }) {
    final appTheme = AppTheme.of(context).theme;

    viewModel.loadQuestion(baseUrl: Api.baseURL, context: context);
    return BlocBuilder<SignUpQuestionireScreenViewModel, SignUpQuestionireScreenState>(
        bloc: viewModel,
        builder: (_, state) => state.when(
            // initialized:
            //     (isBusy) =>
            //     _initialized(),
            loading: _loading,
            loaded: (questionsList) => _displayLoadedData(
                state: state,
                appTheme: appTheme,
                context: context,
                questionList: questionsList,
                screenSizeData: screenSizeData)));
  }

  Widget _initialized() {
    return Container();
  }

  Widget _loading() => const GeneralLoading();




  // @override
  // void initState() {
  //   // TODO: implement initState
  //
  //   handlesList.addAll([
  //     SocialMediaHandles(
  //         socialMediaName: Strings.userProfileSocialMediaHandle,
  //         socialMediaIcon: "assets/images/icons/instagram_1.png"),
  //     SocialMediaHandles(
  //         socialMediaName: Strings.userProfileSocialMediaHandle,
  //         socialMediaIcon: "assets/images/icons/facebook.png"),
  //     SocialMediaHandles(
  //         socialMediaName: Strings.userProfileSocialMediaHandle,
  //         socialMediaIcon: "assets/images/icons/twitter.png"),
  //     SocialMediaHandles(
  //         socialMediaName: Strings.userProfileSocialMediaHandle,
  //         socialMediaIcon: "assets/images/icons/tiktok.png")
  //   ]);
  //   super.initState();
  // }


  Widget _displayLoadedData({
    state,
    appTheme,
    required BuildContext context,
    required List<QuestionsList> questionList,
    required ScreenSizeData screenSizeData,
  }) {
    final size = screenSizeData.size;
    return  Scaffold(
      backgroundColor: appTheme.colors.primaryBackground,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(  bottom: 12),
        child: Container(
          margin: EdgeInsets.only(left:32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpLetsStartScreen()),
                  );
                },
                child: SvgPicture.asset(
                  Resources.getSignInLeftArrow,
                  color: Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpLetsStartScreen()),
                  );
                },
                child: SvgPicture.asset(
                  Resources.getSignInRightArrow,
                  color: Colors.grey,

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
              height: 260,
              width: double.infinity,
              child: Image.asset(Resources.getSignUpQuestionireBgPng),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
           //   alignment: Alignment.center,
              //  padding: const EdgeInsets.only(left: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralText(
                Strings.questionireLabel,
                textAlign: TextAlign.start,
                style: appTheme.typographies.interFontFamily.headline4
                    .copyWith(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 27,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralText(
                    Strings.questionireLabel2,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: appTheme.typographies.interFontFamily.headline4
                        .copyWith(
                            color: const Color(0xfffbeccb),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        color: Colors.white),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Image.asset(Resources.ringPNG,height: 22,),
                        SizedBox(width: 15,),
                        Expanded(child: GeneralText(
                          Strings.letsStartScreenLabel2,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: appTheme
                              .typographies.interFontFamily.headline6
                              .copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),)

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        color: Color(0xfffee4a4)),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Image.asset(Resources.checkPNG,height: 22,),
                        SizedBox(width: 15,),
                        Expanded(child: GeneralText(
                          Strings.letsStartScreenLabel2,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: appTheme
                              .typographies.interFontFamily.headline6
                              .copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),)

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        color: Colors.white),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Image.asset(Resources.ringPNG,height: 22,),
                        SizedBox(width: 15,),
                        Expanded(child: GeneralText(
                          Strings.letsStartScreenLabel2,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: appTheme
                              .typographies.interFontFamily.headline6
                              .copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),)

                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 51,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralText(
                    Strings.questionireLabel3,
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
                  GeneralTextInput(
                      height: 80,

                      controller: _journeyController,
                      inputType: InputType.text,
                      isMultiline: true,
                      backgroundColor: appTheme.colors.textFieldFilledColor,
                      inputBorder: appTheme.focusedBorder,
                      valueStyle: const TextStyle(color: Colors.white),
                      hint: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.4), fontSize: 14),
                      // valueStyle: valueStyle,
                      onChanged: (newValue) {}),
                ],
              ),
              const SizedBox(
                height: 36,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralText(
                    Strings.questionireLabel5,
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
                    spacing: 10 ,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      ChipsWidget(
                        appTheme: appTheme,
                        title: 'Sports',
                      ),
                      ChipsWidget(
                        appTheme: appTheme,
                        title: 'Music',
                      ),
                      ChipsWidget(
                        appTheme: appTheme,
                        title: 'Traveling',
                      ),
                      ChipsWidget(
                        appTheme: appTheme,
                        title: 'Movies',
                      ),
                      ChipsWidget(
                        appTheme: appTheme,
                        title: 'Current Affairs',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              socialMediaHandles(appTheme),

              const SizedBox(
                height: 40,
              ),

              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 22),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GeneralText(
                      Strings.labelProfilePicture,
                      textAlign: TextAlign.center,
                      style: appTheme.typographies.interFontFamily.headline4
                          .copyWith(
                              color: appTheme.colors.primaryBackground,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                    ),
                    Image.asset(
                      Resources.userProfilePicPng,
                      height: 47,
                    )
                  ],
                ),
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



  Widget socialMediaHandles(IAppThemeData appTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.userProfileSocialMediaLabel,
          style: appTheme.typographies.interFontFamily.headline6
              .copyWith(
              color: const Color(0xfffbeccb),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        GridView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              childAspectRatio: 2.9,
            ),
            itemCount: handlesList.length,//

            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xfff1c452),width: 2),
                    color: HexColor.fromHex("#4b4b52"),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                 height:31,
                      padding: const EdgeInsetsDirectional.all(6),
                      decoration: BoxDecoration(
                          color: HexColor.fromHex("#4b4b52"),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        handlesList[index].socialMediaIcon ?? "",
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: GeneralText(
                        handlesList[index].socialMediaName ?? "",
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                          fontSize: 14,
                          color: HexColor.fromHex('#ffffff'),
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
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