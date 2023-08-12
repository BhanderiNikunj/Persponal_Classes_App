// To parse this JSON data, do
//
//     final massageModel = massageModelFromJson(jsonString);

import 'dart:convert';

List<MassageModel> massageModelFromJson(String str) => List<MassageModel>.from(
    json.decode(str).map((x) => MassageModel.fromJson(x)));

String massageModelToJson(List<MassageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MassageModel {
  String? id;
  String? date;
  String? time;
  String? massage;
  int? check;

  MassageModel({
    this.id,
    this.date,
    this.time,
    this.massage,
    this.check,
  });

  factory MassageModel.fromJson(Map<String, dynamic> json) => MassageModel(
        id: json["id"],
        date: json["date"],
        time: json["time"],
        massage: json["massage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "time": time,
        "massage": massage,
      };
}
