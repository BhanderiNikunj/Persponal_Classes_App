// To parse this JSON data, do
//
//     final homeWorkModel = homeWorkModelFromJson(jsonString);

import 'dart:convert';

List<HomeWorkModel> homeWorkModelFromJson(String str) =>
    List<HomeWorkModel>.from(
        json.decode(str).map((x) => HomeWorkModel.fromJson(x)));

String homeWorkModelToJson(List<HomeWorkModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeWorkModel {
  String? id;
  String? homeWork;
  String? subject;
  String? dueDate;
  String? std;
  int? check;

  HomeWorkModel({
    this.id,
    this.homeWork,
    this.subject,
    this.dueDate,
    this.std,
    this.check,
  });

  factory HomeWorkModel.fromJson(Map<String, dynamic> json) => HomeWorkModel(
        id: json["id"],
        homeWork: json["homeWork"],
        subject: json["subject"],
        dueDate: json["dueDate"],
        std: json["std"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "homeWork": homeWork,
        "subject": subject,
        "dueDate": dueDate,
        "std": std,
      };
}
