// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

List<StudentModel> studentModelFromJson(String str) => List<StudentModel>.from(
    json.decode(str).map((x) => StudentModel.fromJson(x)));

String studentModelToJson(List<StudentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentModel {
  String? id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? std;
  String? mobileNumber;
  int? check;

  StudentModel({
    this.id,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.std,
    this.check,
    this.mobileNumber,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fatherName: json["fatherName"],
        std: json["std"],
        mobileNumber: json["mobileNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "fatherName": fatherName,
        "std": std,
        "mobileNumber": mobileNumber,
      };
}
