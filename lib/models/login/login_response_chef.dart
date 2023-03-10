// To parse this JSON data, do
//
//     final loginResponseChef = loginResponseChefFromJson(jsonString);

import 'dart:convert';

LoginResponseChef loginResponseChefFromJson(String str) =>
    LoginResponseChef.fromJson(json.decode(str));

String loginResponseChefToJson(LoginResponseChef data) =>
    json.encode(data.toJson());

class LoginResponseChef {
  LoginResponseChef({
    required this.t,
    this.userId,
    this.message,
    this.error,
    required this.code,
  });

  T t;
  dynamic userId;
  dynamic message;
  dynamic error;
  int code;

  factory LoginResponseChef.fromJson(Map<String, dynamic> json) =>
      LoginResponseChef(
        t: T.fromJson(json["t"]),
        userId: json["userId"],
        message: json["message"],
        error: json["error"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "t": t.toJson(),
        "userId": userId,
        "message": message,
        "error": error,
        "code": code,
      };
}

class T {
  T({
    required this.id,
    required this.name,
    required this.mobileNo,
    required this.address,
    required this.brandName,
  });

  int id;
  String name;
  String mobileNo;
  String address;
  String brandName;

  factory T.fromJson(Map<String, dynamic> json) => T(
        id: json["id"],
        name: json["name"],
        mobileNo: json["mobileNo"],
        address: json["address"],
        brandName: json["brandName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobileNo": mobileNo,
        "address": address,
        "brandName": brandName,
      };
}
