import 'package:chef/helpers/helpers.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../ui_kit/helpers/dialog_helper.dart';
import '../sign_in/sign_in_screen_v.dart';

enum Gender {
  male,
  female,
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late List<DropdownMenuItem<String>> items = [];
  final TextController _nameController = TextController();
  final TextController _brandController = TextController();
  final TextController _mobileNumberController = TextController();
  final TextController _addressController = TextController();
  final TextController _townController = TextController();
  final TextController _cityController = TextController();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Scaffold(
      backgroundColor: appTheme.colors.primaryBackground,
      bottomNavigationBar:
      displayAlreadySignIn(appTheme),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 41,
                ),
                _getStartedTitle(appTheme: appTheme),
                Center(
                  child: GeneralText(
                    Strings.signUpTitle,
                    textAlign: TextAlign.center,
                    style: appTheme.typographies.interFontFamily.headline4
                        .copyWith(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                displayFullName(appTheme),
                const SizedBox(
                  height: 24,
                ),

                displayBrandName(appTheme),
                const SizedBox(
                  height: 24,
                ),
                displayMobileNumber(appTheme),
                const SizedBox(
                  height: 24,
                ),

                displayAddress(appTheme),
                const SizedBox(
                  height: 24,
                ),
                displayAgeGender(appTheme),
                const SizedBox(
                  height: 10,
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget displayFullName(IAppThemeData appTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.signFullNameLabel,
          textAlign: TextAlign.center,
          style: appTheme.typographies.interFontFamily.headline4.copyWith(
              color: const Color(0xfffbeccb),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        GeneralTextInput(
            controller: _nameController,
            inputType: InputType.text,
            backgroundColor: appTheme.colors.textFieldFilledColor,
            inputBorder: appTheme.focusedBorder,
            valueStyle: const TextStyle(color: Colors.white),
            hint: 'Enter name',
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
            // valueStyle: valueStyle,
            onChanged: (newValue) {}),
      ],
    );
  }
  Widget displayBrandName(IAppThemeData appTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.signBrandNameLabel,
          textAlign: TextAlign.center,
          style: appTheme.typographies.interFontFamily.headline4.copyWith(
              color: const Color(0xfffbeccb),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        GeneralTextInput(
            controller: _brandController,
            inputType: InputType.text,
            backgroundColor: appTheme.colors.textFieldFilledColor,
            inputBorder: appTheme.focusedBorder,
            valueStyle: const TextStyle(color: Colors.white),
            hint: 'Enter brand name',
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
            // valueStyle: valueStyle,
            onChanged: (newValue) {}),
      ],
    );
  }

  Widget displayMobileNumber(IAppThemeData appTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.signMobileNumberLabel,
          textAlign: TextAlign.center,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              color: const Color(0xfffbeccb),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        GeneralTextInput(
            controller: _mobileNumberController,
            inputType: InputType.digit,
            backgroundColor: appTheme.colors.textFieldFilledColor,
            inputBorder: appTheme.focusedBorder,
            valueStyle: const TextStyle(color: Colors.white),
            hint: 'Enter Mobile Number',
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
            // valueStyle: valueStyle,
            onChanged: (newValue) {}),
      ],
    );
  }
  Widget displayAddress(IAppThemeData appTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          Strings.signAddressLabel,
          textAlign: TextAlign.center,
          style: appTheme.typographies.interFontFamily.headline6.copyWith(
              color: const Color(0xfffbeccb),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        GeneralTextInput(
            controller: _addressController,
            inputType: InputType.digit,
            suffix: Image.asset(Resources.locationIconPNG,height: 20,),
            backgroundColor: appTheme.colors.textFieldFilledColor,
            inputBorder: appTheme.focusedBorder,
            valueStyle: const TextStyle(color: Colors.white),
            hint: 'Enter Address',
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
            // valueStyle: valueStyle,
            onChanged: (newValue) {}),
      ],
    );
  }

  Widget displayAgeGender(IAppThemeData appTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralText(
                Strings.signTownLabel,
                textAlign: TextAlign.center,
                style: appTheme.typographies.interFontFamily.headline4.copyWith(
                    color: const Color(0xfffbeccb),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              GeneralTextInput(
                  height: 80,
                  textFieldWidth: 145,
                  controller: _townController,
                  inputType: InputType.digit,
                  backgroundColor: appTheme.colors.textFieldFilledColor,
                  inputBorder: appTheme.focusedBorder,
                  valueStyle: const TextStyle(color: Colors.white),
                  hint: 'Enter Town',
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 14),
                  // valueStyle: valueStyle,
                  onChanged: (newValue) {}),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralText(
                Strings.signCityLabel,
                textAlign: TextAlign.center,
                style: appTheme.typographies.interFontFamily.headline4.copyWith(
                    color: const Color(0xfffbeccb),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              GeneralTextInput(
                  height: 80,
                  textFieldWidth: 145,
                  controller: _cityController,
                  inputType: InputType.digit,
                  backgroundColor: appTheme.colors.textFieldFilledColor,
                  inputBorder: appTheme.focusedBorder,
                  valueStyle: const TextStyle(color: Colors.white),
                  hint: 'Enter City',
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 14),
                  // valueStyle: valueStyle,
                  onChanged: (newValue) {}),
            ],
          ),
        ),
      ],
    );
  }


  Widget displayAlreadySignIn(IAppThemeData appTheme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            child: GeneralText(
              Strings.signAlreadyUserLabel,
              textAlign: TextAlign.center,
              style: appTheme.typographies.interFontFamily.headline4.copyWith(
                  color: const Color(0xfff7dc99),
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500),
            ),
          ),
          InkWell(
            onTap: () {
              _showVerificationPopup(context);

            },
            child: SvgPicture.asset(
              Resources.getRightArrow,
            ),
          )
        ],
      ),
    );
  }


  Widget _getStartedTitle({required IAppThemeData appTheme}) {
    return Center(
      child: GeneralText(
        Strings.letsGetTitle,
        textAlign: TextAlign.center,
        style: appTheme.typographies.interFontFamily.headline4.copyWith(
            color: const Color(0xfff1c452),
            fontSize: 28,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _getStartedButtonTitle({required IAppThemeData appTheme}) {
    return GeneralButton.button(
      title: Strings.getStartedButtonTitle.toUpperCase(),
      styleType: ButtonStyleType.fill,
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => SignUpScreen()),
        // );
        //    viewModel.goToForgotPasswordScreen();
      },
    );
    GeneralText(
      Strings.getStartedButtonTitle,
      style: appTheme.typographies.interFontFamily.headline2,
    );
  }
  Future<dynamic> _showVerificationPopup(BuildContext context) async {
    final appTheme = AppTheme.of(context).theme;
    final TextController _otpController = TextController();

    return DialogHelper.show(
      context: context,
      // dialogType: GeneralComponentStyle.success,
      isDismissible: true,
      barrierLabel: '',

      // title: 'Verification\nCode',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GeneralText(
              Strings.verificationPopupTitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: appTheme.typographies.interFontFamily.headline6.copyWith(
                  color: appTheme.colors.secondaryBackground,
                  fontSize: 24,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 14,
            ),
            GeneralText(
              Strings.verificationPopupSubtitle,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: appTheme.typographies.interFontFamily.headline4.copyWith(
                  color: appTheme.colors.secondaryBackground,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 34,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: PinCodeTextField(
                controller: _otpController,

                length: 4,
                cursorColor: appTheme.colors.secondaryBackground,

                textStyle: TextStyle(
                  color: appTheme.colors.secondaryBackground,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  selectedColor: Color(0xfff1c452),
                  disabledColor: Color(0xfff1c452),
                  inactiveColor: Color(0xfff1c452),
                  inactiveFillColor: Color(0xff35353C),
                  activeColor: Color(0xff35353C),
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 58,
                  fieldWidth: 65,
                  selectedFillColor: Color(0xff35353C),
                  activeFillColor: Color(0xff35353C),
                ),
                obscureText: false,
                keyboardType: TextInputType.number,

                enableActiveFill: true,
                // validator: (value) {
                //   String? validationText =getIt<Localization>().mtLocalized("otp_enterOTP");
                //       "Fields cannot be empty";
                //   if (value!.length == AppConstants.otpLength) {
                //     validationText = null;
                //   }
                //   return validationText;
                // },
                animationType: AnimationType.fade,
                animationDuration: const Duration(milliseconds: 300),
                //errorAnimationController: errorController, // Pass it here
                onChanged: (value) {},
                onSubmitted: (value) {},
                appContext: context,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GeneralButton.button(
              title: Strings.verificationPopupButton.toUpperCase(),
              styleType: ButtonStyleType.fill,
              width: 170,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUpQuestionireScreen()),
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SignUpScreen()),
                // );
                //    viewModel.goToForgotPasswordScreen();
              },
            ),
            SizedBox(
              height: 22,
            ),
            GeneralText(
              Strings.verificationPopupResendCode,
              textAlign: TextAlign.center,
              style: appTheme.typographies.interFontFamily.headline4.copyWith(
                  color: const Color(0xfff7dc99),
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      // body: GBottomSheet<String>(
      //   bottomSheetTitle: Strings.chooseDateFormat,
      //   list: ['7878,87,876'],
      //   selectedItem: viewModel.getSelectedFormat(),
      //   bottomSheetType: BottomSheetType.dateFormat,
      // ),
    );
  }


}
