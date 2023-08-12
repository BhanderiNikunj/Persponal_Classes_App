import 'package:classes_app/Models/HomeWorkModel.dart';
import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWorkControllor extends GetxController {
  List<dynamic> homeWorkList = [];
  String subject = "Math";

  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDueDate = TextEditingController(
      text:
          "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}");

  Future<bool> insertHomeWork({
    required HomeWorkModel h1,
  }) {
    return ApiHelper.apiHelper.insertHomeWork(
      h1: h1,
    );
  }

  Future<bool> updateHomeWork({
    required HomeWorkModel h1,
  }) {
    return ApiHelper.apiHelper.updateHomeWork(
      h1: h1,
    );
  }

  Future<bool> deleteHomeWork({
    required HomeWorkModel h1,
  }) {
    return ApiHelper.apiHelper.deleteHomeWork(
      h1: h1,
    );
  }

  Future<List> readHomeWork() {
    return ApiHelper.apiHelper.readHomeWork();
  }
}
