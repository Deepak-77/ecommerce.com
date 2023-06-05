// To parse this JSON data, do
//
//     final loginResponsemodel = loginResponsemodelFromJson(jsonString);

import 'dart:convert';

LoginResponsemodel loginResponsemodelFromJson(String str) =>
    LoginResponsemodel.fromJson(json.decode(str));

String loginResponsemodelToJson(LoginResponsemodel data) =>
    json.encode(data.toJson());

class LoginResponsemodel {
  String status;
  Data data;

  LoginResponsemodel({
    required this.status,
    required this.data,
  });

  factory LoginResponsemodel.fromJson(Map<String, dynamic> json) =>
      LoginResponsemodel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String fullname;
  String email;
  bool isAdmin;
  String token;
  ShippingAddress shippingAddress;

  Data({
    required this.id,
    required this.fullname,
    required this.email,
    required this.isAdmin,
    required this.token,
    required this.shippingAddress,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        isAdmin: json["isAdmin"],
        token: json["token"],
        shippingAddress: ShippingAddress.fromJson(json["shippingAddress"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "isAdmin": isAdmin,
        "token": token,
        "shippingAddress": shippingAddress.toJson(),
      };
}

class ShippingAddress {
  String address;
  String city;
  bool isEmpty;

  ShippingAddress({
    required this.address,
    required this.city,
    required this.isEmpty,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      ShippingAddress(
        address: json["address"],
        city: json["city"],
        isEmpty: json["isEmpty"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "isEmpty": isEmpty,
      };
}
