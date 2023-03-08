
import 'dart:convert';

SignupRequest signupRequestFromJson(String str) => SignupRequest.fromJson(json.decode(str));

String signupRequestToJson(SignupRequest data) => json.encode(data.toJson());

class SignupRequest {
  SignupRequest({
    required this.t,
  });

  T t;

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
    t: T.fromJson(json["t"]),
  );

  Map<String, dynamic> toJson() => {
    "t": t.toJson(),
  };
}

class T {
  T({
    required this.address,
    required this.brandName,
    // required this.id,
    required this.mobileNo,
    required this.name,
  });

  String address;
  String brandName;
  // int id;
  String mobileNo;
  String name;

  factory T.fromJson(Map<String, dynamic> json) => T(
    address: json["address"],
    brandName: json["brandName"],
    // id: json["id"],
    mobileNo: json["mobileNo"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "brandName": brandName,
    // "id": id,
    "mobileNo": mobileNo,
    "name": name,
  };
}
