

import 'dart:convert';

SignupResponse signupResponseFromJson(String str) => SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  SignupResponse({
    required this.t,
    this.userId,
    required this.message,
    this.error,
    required this.code,
  });

  T t;
  dynamic userId;
  String message;
  dynamic error;
  int code;

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
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
