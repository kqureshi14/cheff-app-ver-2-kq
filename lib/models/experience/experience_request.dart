import 'dart:convert';

ExperienceRequest experienceRequestFromJson(String str) =>
    ExperienceRequest.fromJson(json.decode(str));

String experienceRequestToJson(ExperienceRequest data) =>
    json.encode(data.toJson());

class ExperienceRequest {
  ExperienceRequest({
    required this.t,
  });

  T t;

  factory ExperienceRequest.fromJson(Map<String, dynamic> json) =>
      ExperienceRequest(
        t: T.fromJson(json["t"]),
      );

  Map<String, dynamic> toJson() => {
        "t": t.toJson(),
      };
}

class T {
  T({
    required this.description,
    required this.experiencePreferences,
    required this.experienceWowFactors,
    required this.persons,
    required this.price,
    required this.priceTypeId,
    required this.subHostMobileNo,
    required this.subHostName,
    required this.title,
    required this.wowFactorId,
    required this.preferenceId,
    required this.locationId,
    required this.chefId,
    required this.chefName,
    required this.chefBrandName,
    required this.chefAddress,
  });

  String description;
  List<ExperiencePreference> experiencePreferences;
  List<ExperienceWowFactor> experienceWowFactors;
  String persons;
  int price;
  int priceTypeId;
  String subHostMobileNo;
  String subHostName;
  String title;
  int wowFactorId;
  int preferenceId;
  int locationId;
  int chefId;
  String chefName;
  String chefBrandName;
  String chefAddress;

  factory T.fromJson(Map<String, dynamic> json) => T(
        description: json["description"],
        experiencePreferences: List<ExperiencePreference>.from(
            json["experiencePreferences"]
                .map((x) => ExperiencePreference.fromJson(x))),
        experienceWowFactors: List<ExperienceWowFactor>.from(
            json["experienceWowFactors"]
                .map((x) => ExperienceWowFactor.fromJson(x))),
        persons: json["persons"],
        price: json["price"],
        priceTypeId: json["priceTypeId"],
        subHostMobileNo: json["subHostMobileNo"],
        subHostName: json["subHostName"],
        title: json["title"],
        wowFactorId: json["wowFactorId"],
        preferenceId: json["preferenceId"],
        locationId: json["locationId"],
        chefId: json["chefId"],
        chefName: json["chefName"],
        chefBrandName: json["chefBrandName"],
        chefAddress: json["chefAddress"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "experiencePreferences":
            List<dynamic>.from(experiencePreferences.map((x) => x.toJson())),
        "experienceWowFactors":
            List<dynamic>.from(experienceWowFactors.map((x) => x.toJson())),
        "persons": persons,
        "price": price,
        "priceTypeId": priceTypeId,
        "subHostMobileNo": subHostMobileNo,
        "subHostName": subHostName,
        "title": title,
        "wowFactorId": wowFactorId,
        "preferenceId": preferenceId,
        "locationId": locationId,
        "chefId": chefId,
        "chefName": chefName,
        "chefBrandName": chefBrandName,
        "chefAddress": chefAddress,
      };
}

class ExperiencePreference {
  ExperiencePreference({
    required this.preferenceId,
  });

  int preferenceId;

  factory ExperiencePreference.fromJson(Map<String, dynamic> json) =>
      ExperiencePreference(
        preferenceId: json["preferenceId"],
      );

  Map<String, dynamic> toJson() => {
        "preferenceId": preferenceId,
      };
}

class ExperienceWowFactor {
  ExperienceWowFactor({
    required this.wowFactorId,
  });

  int wowFactorId;

  factory ExperienceWowFactor.fromJson(Map<String, dynamic> json) =>
      ExperienceWowFactor(
        wowFactorId: json["wowFactorId"],
      );

  Map<String, dynamic> toJson() => {
        "wowFactorId": wowFactorId,
      };
}
