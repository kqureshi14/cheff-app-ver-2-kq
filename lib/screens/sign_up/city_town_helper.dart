import 'package:chef/screens/sign_in/sign_in_screen_vm.dart';
import 'package:chef/screens/sign_up/sign_up_screen_vm.dart';
import 'package:chef/setup.dart';

import '../../helpers/helpers.dart';

import 'dart:developer' as developer;

import '../../models/signup/city_response.dart';

class CityTownHelper extends StatefulWidget {
  const CityTownHelper(
      {required List<String> cityDropDown,
      required CityResponse cityResponse,
      required List<String> townDropDown,
      required Map<String, List<String>> cityTownInfo,
      required TextController townController,
      required TextController cityController,
      Key? key})
      : _cityDropDown = cityDropDown,
        _cityResponse = cityResponse,
        _townDropDown = townDropDown,
        _cityTownInfo = cityTownInfo,
        _townController = townController,
        _cityController = cityController,
        super(key: key);

  final List<String> _cityDropDown;
  final List<String> _townDropDown;
  final CityResponse _cityResponse;
  final Map<String, List<String>> _cityTownInfo;
  final TextController _townController;
  final TextController _cityController;
  // const CityTownHelper({Key? key})
  //     :
  //
  //       //  _cityDropDown = cityDropDown,
  //       super(key: key);

//  final _cityDropDown;

  @override
  _CityTownHelperState createState() => _CityTownHelperState();
}

class _CityTownHelperState extends State<CityTownHelper> {
  var _myCity = '';
  var _myTown = '';

  List<String> townData = [];

  final _signUpScreenViewModel = locateService<SignUpScreenViewModel>();
  final appTheme = locateService<IAppThemeData>();

  @override
  void initState() {
    developer.log(' Data of City Drop Down is ' +
        '${_signUpScreenViewModel.cityDropDown}');

    developer.log(' Data of City Drop Down selected is  ' +
        '${_signUpScreenViewModel.cityDropDown}');

    _myCity = widget._cityDropDown.first;

    developer.log(' My City here is ' + '${_myCity}');

    widget._cityTownInfo.forEach((key, value) {
      developer.log(' Key city is ' + '$key');
      developer.log(' Town value is ' + '$value');
    });

    _myTown = widget._cityTownInfo.isNotEmpty
        ? widget._cityTownInfo[_myCity]!.first
        : '';
    townData =
        widget._cityTownInfo.isNotEmpty ? widget._cityTownInfo[_myCity]! : [];

    //widget._townDropDown.first;

    developer.log(' Data of City Drop Down selected is  ' + '${_myCity}');

    developer.log(' Data of My Town is  ' + '${_myTown}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return displayCityList();
  }

  Widget displayCityList() {
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
              widget._cityTownInfo.isNotEmpty ? displayTown() : Container(),
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
              displayCity(),
            ],
          ),
        ),
      ],
    );
  }

  Widget displayCity() {
    return GeneralDropdown(
        items: widget._cityDropDown,
        name: 'Select City',
        borderColor: appTheme.colors.textFieldBorderColor,
        // selectedItem: dropdownItems.first,
        style: appTheme.typographies.interFontFamily.headline6.copyWith(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
        onChange: ({
          required String key,
          required dynamic value,
        }) {
          setState(() {
            _myCity = value!;
            // _signUpScreenViewModel.cityController.text = _myCity;
            widget._cityController.text = _myCity;
            // townData.clear();
            townData = widget._cityTownInfo.isNotEmpty
                ? widget._cityTownInfo[_myCity]!
                : [];
            _myTown = townData.isNotEmpty ? townData.first : 'F 7';
          });
        });

    // return DropdownButtonHideUnderline(
    //   child: ButtonTheme(
    //     alignedDropdown: true,
    //     child: DropdownButton<String>(
    //       value: _myCity,
    //       iconSize: 30,
    //       icon: (null),
    //       style: const TextStyle(
    //         color: Colors.black54,
    //         fontSize: 16,
    //       ),
    //
    //       hint: const GeneralText('Select City'),
    //       onChanged: (String? newValue) {
    //         setState(() {
    //           _myCity = newValue!;
    //           // townData.clear();
    //           townData = widget._cityTownInfo.isNotEmpty
    //               ? widget._cityTownInfo[_myCity]!
    //               : [];
    //           _myTown = townData.isNotEmpty ? townData.first : 'F 7';
    //         });
    //       },
    //       // items: _signUpScreenViewModel.cityDropDown.map((item) {
    //       items: widget._cityDropDown.map((item) {
    //             developer.log(' Item City is ' + '${item}');
    //             return DropdownMenuItem<String>(
    //               child: GeneralText(item.toString()),
    //               value: item.toString(),
    //               // child: Text('test'),
    //               // value: 'hello',
    //               //value: item['id'].toString(),
    //             );
    //           }).toList() ??
    //           [],
    //     ),
    //   ),
    // );
  }

  Widget displayTown() {
    // return GeneralDropdown(
    //     items: townData,
    //     name: 'Select Town',
    //     initialValue: _myTown,
    //     borderColor: appTheme.colors.textFieldBorderColor,
    //     // selectedItem: dropdownItems.first,
    //     style: appTheme.typographies.interFontFamily.headline6.copyWith(
    //         color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
    //     onChange: ({
    //       required String key,
    //       required dynamic value,
    //     }) {
    //       setState(() {
    //         _myTown = value!;
    //       });
    //     });
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SizedBox(
                height: 53.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: appTheme.colors.textFieldBorderColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _myTown,
                        dropdownColor: Colors.grey,
                        iconEnabledColor: appTheme.colors.textFieldBorderColor,
                        iconSize: 25,
                        icon: (null),
                        style: appTheme.typographies.interFontFamily.headline6
                            .copyWith(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                        hint: Text(
                          'Select Town',
                          style: appTheme.typographies.interFontFamily.headline6
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _myTown = newValue!;
                            // _signUpScreenViewModel.townController.text =
                            //     _myTown;

                            widget._townController.text = _myTown;
                          });
                        },
                        items: townData.map((item) {
                              developer.log(' Item Town is ' + '${item}');
                              return DropdownMenuItem(
                                child: Text(item),
                                value: item.toString(),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                  ),
                )),
          )
        ]);

    // return SizedBox(
    //     height: widget._dropDownHeight,
    //     child: DecoratedBox(
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //             color: widget._borderColor ??
    //                 const Color.fromRGBO(0, 0, 0, 0.57),
    //             width: 2,
    //           ),
    //           borderRadius: BorderRadius.circular(12),
    //         ),
    //         child: Container(
    //             padding: const EdgeInsets.symmetric(horizontal: 10),
    //             child: DropdownButton<String>(
    //               hint: widget._hintWidget,
    //               isExpanded: true,
    //               dropdownColor: Colors.grey,
    //               style: widget._style,
    //               value: currentChoice,
    //               iconEnabledColor: widget._borderColor,
    //               underline: Container(),
    //               onChanged: (value) {
    //                 setState(() => currentChoice = value!);
    //                 widget._onChange.call(
    //                   key: widget._name,
    //                   value: value.toString(),
    //                 );
    //               },
    //
    //               // onSaved: (value) {
    //               //   setState(() => currentChoice = value!);
    //               //   widget._onChange.call(
    //               //     key: widget._name,
    //               //     value: value.toString(),
    //               //   );
    //               // },
    //               items: widget._items
    //                   .map((data) => DropdownMenuItem(
    //                   value: data,
    //                   child: Text(
    //                     data,
    //                   )))
    //                   .toList(),
    //             ))));
  }
}
