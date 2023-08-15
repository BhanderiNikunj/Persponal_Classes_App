// To parse this JSON data, do
//
//     final leaveModel = leaveModelFromJson(jsonString);

import 'dart:convert';

List<LeaveModel> leaveModelFromJson(String str) => List<LeaveModel>.from(json.decode(str).map((x) => LeaveModel.fromJson(x)));

String leaveModelToJson(List<LeaveModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveModel {
  String? id;
  String? firstName;
  String? std;
  String? resion;
  String? dateForm;
  String? dateTo;

  LeaveModel({
    this.id,
    this.firstName,
    this.std,
    this.resion,
    this.dateForm,
    this.dateTo,
  });

  factory LeaveModel.fromJson(Map<String, dynamic> json) => LeaveModel(
    id: json["id"],
    firstName: json["firstName"],
    std: json["std"],
    resion: json["resion"],
    dateForm: json["dateForm"],
    dateTo: json["dateTo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "std": std,
    "resion": resion,
    "dateForm": dateForm,
    "dateTo": dateTo,
  };
}
