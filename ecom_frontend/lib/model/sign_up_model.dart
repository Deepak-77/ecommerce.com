// To parse this JSON data, do
//
//     final signUpResModel = signUpResModelFromJson(jsonString);

import 'dart:convert';

SignUpResModel signUpResModelFromJson(String str) =>
    SignUpResModel.fromJson(json.decode(str));

String signUpResModelToJson(SignUpResModel data) => json.encode(data.toJson());

class SignUpResModel {
  final String? status;
  final String? message;

  SignUpResModel({
    this.status,
    this.message,
  });

  factory SignUpResModel.fromJson(Map<String, dynamic> json) => SignUpResModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
