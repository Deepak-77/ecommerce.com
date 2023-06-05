// To parse this JSON data, do
//
//     final signUpReqModel = signUpReqModelFromJson(jsonString);

import 'dart:convert';

SignUpReqModel signUpReqModelFromJson(String str) =>
    SignUpReqModel.fromJson(json.decode(str));

String signUpReqModelToJson(SignUpReqModel data) => json.encode(data.toJson());

class SignUpReqModel {
  final String? email;
  final String? fullname;
  final String? password;

  SignUpReqModel({
    this.email,
    this.fullname,
    this.password,
  });

  factory SignUpReqModel.fromJson(Map<String, dynamic> json) => SignUpReqModel(
        email: json["email"],
        fullname: json["fullname"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullname": fullname,
        "password": password,
      };
}
