import 'dart:convert';

MenuRequest menuRequestFromJson(String str) =>
    MenuRequest.fromJson(json.decode(str));

String menuRequestToJson(MenuRequest data) => json.encode(data.toJson());

class MenuRequest {
  MenuRequest({
    required this.t,
    this.userId,
  });

  T t;
  int? userId;

  factory MenuRequest.fromJson(Map<String, dynamic> json) => MenuRequest(
        t: T.fromJson(json["t"]),
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "t": t.toJson(),
        "userId": userId,
      };
}

class T {
  T({
    required this.description,
    required this.dish,
    required this.dishId,
    required this.experienceId,
    this.id,
    required this.mealId,
    this.pictureUrl,
    required this.price,
  });

  String description;
  String dish;
  int dishId;
  int experienceId;
  int? id;
  int mealId;
  String? pictureUrl;
  int price;

  factory T.fromJson(Map<String, dynamic> json) => T(
        description: json["description"],
        dish: json["dish"],
        dishId: json["dishId"],
        experienceId: json["experienceId"],
        id: json["id"],
        mealId: json["mealId"],
        pictureUrl: json["pictureUrl"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "dish": dish,
        "dishId": dishId,
        "experienceId": experienceId,
        "id": id,
        "mealId": mealId,
        "pictureUrl": pictureUrl,
        "price": price,
      };
}
