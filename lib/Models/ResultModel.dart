// To parse this JSON data, do
//
//     final resultModel = resultModelFromJson(jsonString);

import 'dart:convert';

List<ResultModel> resultModelFromJson(String str) => List<ResultModel>.from(
    json.decode(str).map((x) => ResultModel.fromJson(x)));

String resultModelToJson(List<ResultModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResultModel {
  String? id;
  String? firstName;
  String? std;
  String? uid;
  String? math;
  String? science;
  String? english;
  String? socialScience;
  String? gujarati;
  String? sanskrit;
  String? hindi;
  String? totalOutOf;
  String? total;
  int? check;

  ResultModel({
    this.id,
    this.firstName,
    this.std,
    this.uid,
    this.math,
    this.science,
    this.english,
    this.socialScience,
    this.gujarati,
    this.sanskrit,
    this.hindi,
    this.totalOutOf,
    this.total,
    this.check,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        id: json["id"],
        firstName: json["firstName"],
        std: json["std"],
        uid: json["uid"],
        math: json["math"],
        science: json["science"],
        english: json["english"],
        socialScience: json["socialScience"],
        gujarati: json["gujarati"],
        sanskrit: json["sanskrit"],
        hindi: json["hindi"],
        totalOutOf: json["totalOutOf"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "std": std,
        "uid": uid,
        "math": math,
        "science": science,
        "english": english,
        "socialScience": socialScience,
        "gujarati": gujarati,
        "sanskrit": sanskrit,
        "hindi": hindi,
        "totalOutOf": totalOutOf,
        "total": total,
      };
}
