// To parse this JSON data, do
//
//     final feesModel = feesModelFromJson(jsonString);

import 'dart:convert';

List<FeesModel> feesModelFromJson(String str) => List<FeesModel>.from(json.decode(str).map((x) => FeesModel.fromJson(x)));

String feesModelToJson(List<FeesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeesModel {
  String? id;
  String? firstName;
  String? std;
  String? uid;
  String? totalFees;
  String? paidFees;
  String? lessFees;
  int? check;

  FeesModel({
    this.id,
    this.check,
    this.firstName,
    this.std,
    this.uid,
    this.totalFees,
    this.paidFees,
    this.lessFees,
  });

  factory FeesModel.fromJson(Map<String, dynamic> json) => FeesModel(
    id: json["id"],
    firstName: json["firstName"],
    std: json["std"],
    uid: json["uid"],
    totalFees: json["totalFees"],
    paidFees: json["paidFees"],
    lessFees: json["lessFees"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "std": std,
    "uid": uid,
    "totalFees": totalFees,
    "paidFees": paidFees,
    "lessFees": lessFees,
  };
}
