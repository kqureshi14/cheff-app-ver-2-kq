import '../../../../helpers/helpers.dart';
import '../../../../models/signup/questionire_response.dart';

class QuestionView extends StatefulWidget {
  QuestionView({
    Key? key,
    required this.appTheme,
    required this.questionObj,
    // required this.answersIds,
  }) : super(key: key);

  final IAppThemeData appTheme;

  QuestionsList questionObj;
  // List<int> answersIds = [];
  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  List<int> answersIds = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(
        //   height: 27,
        // ),
        Container(
          // padding: EdgeInsets.only(left: 30),
          child: GeneralText(
            widget.questionObj.name,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: widget.appTheme.typographies.interFontFamily.headline6
                .copyWith(
                    color: const Color(0xfffbeccb),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 15,
        ),

        widget.questionObj.type == "SINGLE_DROPDOWN"
            ? SingleOption(
                appTheme: widget.appTheme,
                answerList: widget.questionObj.answers,
                answersIds: answersIds)
            : widget.questionObj.type == "MULTI_CHIP"
                ? multiChipView(
                    appTheme: widget.appTheme,
                    answerList: widget.questionObj.answers)
                :
                // questionObj.type == "INPUT" ?
                InputField(appTheme: widget.appTheme)
      ],
    );
  }
}

// class  extends StatefulWidget {
//   const ({Key? key}) : super(key: key);
//
//   @override
//   _State createState() => _State();
// }
//
// class _State extends State<> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class multiChipView extends StatefulWidget {
  // const multiChipView({Key? key}) : super(key: key);

  multiChipView({
    Key? key,
    required this.appTheme,
    required this.answerList,
  }) : super(key: key);

  final IAppThemeData appTheme;
  List<Answer> answerList;

  @override
  _multiChipViewState createState() => _multiChipViewState();
}

class _multiChipViewState extends State<multiChipView> {
  Map<String, bool> selectedData = {};

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// class multiChipView extends StatelessWidget {
//   multiChipView({
//     Key? key,
//     required this.appTheme,
//     required this.answerList,
//   }) : super(key: key);
//
//   final IAppThemeData appTheme;
//   List<Answer> answerList;
//
//   Map<String, bool> selectedData = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 4),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.5,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: widget.answerList.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                setState(() {
                  if (selectedData.isEmpty) {
                    selectedData[widget.answerList[index].name] = true;
                  } else {
                    if (selectedData
                        .containsKey(widget.answerList[index].name)) {
                      if (selectedData[widget.answerList[index].name]!) {
                        selectedData[widget.answerList[index].name] = false;
                      } else {
                        selectedData[widget.answerList[index].name] = true;
                      }
                    } else {
                      selectedData[widget.answerList[index].name] = true;
                    }
                  }
                });
              },
              child: SizedBox(
                height: 50,
                child: ChipsWidget(
                  appTheme: widget.appTheme,
                  title: widget.answerList[index].name,
                  selected: isSelected(widget.answerList[index].name),
                ),
              ));
        },
      ),
    );
  }

  bool isSelected(String nameOfItem) {
    if (selectedData.isEmpty) {
      selectedData[nameOfItem] = true;
      return true;
    } else if (selectedData.containsKey(nameOfItem)) {
      selectedData[nameOfItem]!;
    }
    return false;
    // if (experienceHelper.selectedWowFactors.containsKey(nameOfItem)) {
    //   return true;
    // } else if (experienceHelper.selectedPerferencesFactors
    //     .containsKey(nameOfItem)) {
    //   return true;
    // }
    // return false;
  }
}

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    required this.appTheme,
  }) : super(key: key);

  final IAppThemeData appTheme;

  final TextController _journeyController = TextController();

  @override
  Widget build(BuildContext context) {
    return GeneralTextInput(
        height: 80,
        controller: _journeyController,
        inputType: InputType.text,
        isMultiline: true,
        backgroundColor: appTheme.colors.textFieldFilledColor,
        inputBorder: appTheme.focusedBorder,
        valueStyle: const TextStyle(color: Colors.white),
        hint: 'Please enter description here',
        hintStyle:
            TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
        onChanged: (newValue) {});
  }
}

class SingleOption extends StatefulWidget {
  SingleOption({
    Key? key,
    required this.appTheme,
    required this.answerList,
    required this.answersIds,
    this.title = '',
    this.selected = false,
    this.widthContainer = 130,
  }) : super(key: key);
  final IAppThemeData appTheme;
  List<Answer> answerList;
  List<int> answersIds = [];

  final String title;
  final bool selected;
  final double widthContainer;
  @override
  _SingleOptionState createState() => _SingleOptionState();
}

class _SingleOptionState extends State<SingleOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        child: ListView.builder(
            itemCount: widget.answerList.length,
            physics:
                const NeverScrollableScrollPhysics(), // BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(bottom: 9),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      color: widget.answersIds
                              .contains(widget.answerList[index].id)
                          ? const Color(0xfffee4a4)
                          : Colors.white),
                  padding: const EdgeInsets.all(12),
                  child: TextButton(
                      child: Row(
                        children: [
                          Image.asset(
                            widget.answersIds
                                    .contains(widget.answerList[index].id)
                                ? Resources.checkPNG
                                : Resources.ringPNG,
                            height: 22,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: GeneralText(
                              widget.answerList[index].name,
                              maxLines: 3,
                              textAlign: TextAlign.start,
                              style: widget.appTheme.typographies
                                  .interFontFamily.headline6
                                  .copyWith(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                      onPressed: () async {
                        setState(() {
                          widget.answersIds
                                  .contains(widget.answerList[index].id)
                              ? widget.answersIds
                                  .remove(widget.answerList[index].id)
                              : (widget.answersIds..clear())
                                  .add(widget.answerList[index].id);
                        });
                      }),
                ),
              );
            }));
  }
}
