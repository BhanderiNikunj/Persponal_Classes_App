import 'package:classes_app/Models/LeaveModel.dart';
import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveControllor extends GetxController {
  List leaveList = [];
  String std = "1";

  TextEditingController txtName = TextEditingController();
  TextEditingController txtStd = TextEditingController();
  TextEditingController txtResion = TextEditingController();
  TextEditingController txtDateFrom = TextEditingController(text: "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}");
  TextEditingController txtDateTo = TextEditingController(text: "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}");

  Future<List> readLeave() {
    return ApiHelper.apiHelper.readLeave();
  }

  Future<bool> deleteLeave({
    required LeaveModel l1,
  }) {
    return ApiHelper.apiHelper.deleteLeave(
      l1: l1,
    );
  }

  Future<bool> insertLeave({
    required LeaveModel l1,
  }) {
    return ApiHelper.apiHelper.insertLeave(
      l1: l1,
    );
  }

  Future<bool> updateLeave({
    required LeaveModel l1,
  }) {
    return ApiHelper.apiHelper.updateLeave(
      l1: l1,
    );
  }
}
