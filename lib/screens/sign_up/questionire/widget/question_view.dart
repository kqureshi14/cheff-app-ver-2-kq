import '../../../../helpers/helpers.dart';
import '../../../../models/signup/questionire_response.dart';

class QuestionView extends StatefulWidget {
  // const QuestionView({Key? key}) : super(key: key);
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
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
//
// class QuestionView extends StatelessWidget {
//   QuestionView({
//     Key? key,
//     required this.appTheme,
//     required this.questionObj,
//     // required this.answersIds,
//   }) : super(key: key);
//
//   final IAppThemeData appTheme;
//
//   QuestionsList questionObj;
  List<int> answersIds = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 27,
        ),
        Container(
          // padding: EdgeInsets.only(left: 30),
          child: GeneralText(
            widget.questionObj.name ?? "",
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

        // questionObj.type == "SINGLE_DROPDOWN" ?
        // SingleOption(appTheme: appTheme, answerList: questionObj.answers, answersIds: answersIds)
        //     : questionObj.type == "MULTI_CHIP" ?
        // multiChipView(appTheme: appTheme, answerList: questionObj.answers)
        //     :
        // // // questionObj.type == "INPUT" ?
        // InputField(appTheme: appTheme)

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
                // // questionObj.type == "INPUT" ?
                InputField(appTheme: widget.appTheme)
      ],
    );
  }
}

class multiChipView extends StatelessWidget {
  multiChipView({
    Key? key,
    required this.appTheme,
    required this.answerList,
  }) : super(key: key);

  final IAppThemeData appTheme;
  List<Answer> answerList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20, top: 4),
      child: GridView.builder(
        // padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.5,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: answerList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            child: ChipsWidget(
              appTheme: appTheme,
              title: answerList[index].name,
            ),
          );
        },
      ),
    );
  }
}

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    required this.appTheme,
    // this.widthContainer = 130,
  }) : super(key: key);

  final IAppThemeData appTheme;

  final TextController _journeyController = TextController();

  // final String title;
  // final double widthContainer;

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
        // valueStyle: valueStyle,
        onChanged: (newValue) {});
  }
}

class SingleOption extends StatefulWidget {
  // const SingleOption({Key? key}) : super(key: key);

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
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
//
// class SingleOption extends StatelessWidget {
//   SingleOption({
//     Key? key,
//     required this.appTheme,
//     required this.answerList,
//     required this.answersIds,
//     // required this.title,
//     // this.selected = false,
//     // this.widthContainer = 130,
//   }) : super(key: key);

  // final IAppThemeData appTheme;
  // List<Answer> answerList;
  // List<int> answersIds = [];
  // final String title;
  // final bool selected;
  // final double widthContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        child: ListView.builder(
            itemCount: widget.answerList.length,
            physics: NeverScrollableScrollPhysics(), // BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(bottom: 9),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      color: widget.answersIds
                              .contains(widget.answerList[index].id)
                          ? Color(0xfffee4a4)
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
                          SizedBox(
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
                          widget.answersIds.contains(widget.answerList[index].id)? widget.answersIds.remove(widget.answerList[index].id) :widget.answersIds.add(widget.answerList[index].id);
                        });
                      }),
                ),
              );
            }));
  }
}
