// To parse this JSON data, do
//
//     final studentUidModel = studentUidModelFromJson(jsonString);

import 'dart:convert';

List<StudentUidModel> studentUidModelFromJson(String str) =>
    List<StudentUidModel>.from(
        json.decode(str).map((x) => StudentUidModel.fromJson(x)));

String studentUidModelToJson(List<StudentUidModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentUidModel {
  String? id;
  String? firstName;
  String? uid;
  String? std;
  int? check;

  StudentUidModel({
    this.id,
    this.firstName,
    this.uid,
    this.std,
    this.check,
  });

  factory StudentUidModel.fromJson(Map<String, dynamic> json) =>
      StudentUidModel(
        id: json["id"],
        firstName: json["firstName"],
        uid: json["uid"],
        std: json["std"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "uid": uid,
        "std": std,
      };
}
