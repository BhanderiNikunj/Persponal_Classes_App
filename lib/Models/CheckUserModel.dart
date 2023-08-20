// To parse this JSON data, do
//
//     final checkUserModel = checkUserModelFromJson(jsonString);

import 'dart:convert';

List<CheckUserModel> checkUserModelFromJson(String str) => List<CheckUserModel>.from(json.decode(str).map((x) => CheckUserModel.fromJson(x)));

String checkUserModelToJson(List<CheckUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckUserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? std;
  String? emailId;
  String? chechAdmin;

  CheckUserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.std,
    this.emailId,
    this.chechAdmin,
  });

  factory CheckUserModel.fromJson(Map<String, dynamic> json) => CheckUserModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    fatherName: json["fatherName"],
    std: json["std"],
    emailId: json["emailId"],
    chechAdmin: json["chechAdmin"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "fatherName": fatherName,
    "std": std,
    "emailId": emailId,
    "chechAdmin": chechAdmin,
  };
}
