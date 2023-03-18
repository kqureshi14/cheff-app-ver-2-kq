import 'dart:convert';
// import '../../../models/home/experience_list_response.dart' as experienceData;
// import '../screens/home/schedule_model.dart';

class ExperienceHelper {
  late String scheduleId;
  // DaysGroup daysGroup = DaysGroup(
  //     scheduledDate: DateTime(1900 - 12 - 12), dayOfMonth: 0, hours: []);
  // late Hour hourSelected;
  //late experienceData.T selectedExperienceDetail;
  String noteAdded = '';
  String selectedCategory = 'Couple';
  int numberOfPerson = 4;

  late String titleExperience;
  late String experienceDetails;
  late double priceExperience;
  late int personExperience;
  late String locationExperience;
  late String subHostName;
  late String subHostMobileNumber;

  late String mainCourseMeal;
  late String mainFoodMeal;

  late String dishName;
  late String dishDescription;
  late double dishPrice;
  late int dishServingNoOfPerson;

  // final selectedWowFactors = {};
  final selectedPerferencesFactors = {};

  final selectedWowFactors = {};

  ExperienceHelper updateChecklist({
    required ExperienceHelper checkList,
    //required List<CheckListItem> itemList,
  }) {
    return ExperienceHelper();
  }

  ExperienceHelper updateOrderHelperItem({
    required ExperienceHelper checkListItem,
    required Map<String, dynamic> value,
  }) {
    return ExperienceHelper();
  }

  void displayData() {}

  // String
}
