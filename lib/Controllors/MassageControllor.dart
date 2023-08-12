import 'package:classes_app/Models/MassageModel.dart';
import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MassageControllor extends GetxController {
  List massageList = [];

  TextEditingController txtMassage = TextEditingController();
  TextEditingController txtTime = TextEditingController(
      text: "${TimeOfDay.now().hour} / ${TimeOfDay.now().minute}");
  TextEditingController txtDate = TextEditingController(
      text:
          "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}");

  Future<bool> insertMassage({
    required MassageModel m1,
  }) {
    return ApiHelper.apiHelper.insertMassage(
      m1: m1,
    );
  }

  Future<bool> updateMassage({
    required MassageModel m1,
  }) {
    return ApiHelper.apiHelper.updateMassage(
      m1: m1,
    );
  }

  Future<bool> deleteMassage({
    required MassageModel m1,
  }) {
    return ApiHelper.apiHelper.deleteMassage(
      m1: m1,
    );
  }

  Future<List> readMassage() {
    return ApiHelper.apiHelper.readMassage();
  }
}
