import 'package:classes_app/Models/FeesModel.dart';
import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeesControllor extends GetxController {
  List feesList = [];
  List studentUidList = [];
  String std = "1";

  TextEditingController txtName = TextEditingController();
  TextEditingController txtStd = TextEditingController();
  TextEditingController txtTotalFees = TextEditingController();
  TextEditingController txtPaidFees = TextEditingController();

  Future<bool> insertFees({
    required FeesModel f1,
  }) {
    return ApiHelper.apiHelper.insertFees(
      f1: f1,
    );
  }

  Future<bool> updateFees({
    required FeesModel f1,
  }) {
    return ApiHelper.apiHelper.updateFees(
      f1: f1,
    );
  }

  Future<bool> deleteFees({
    required FeesModel f1,
  }) {
    return ApiHelper.apiHelper.deleteFees(
      f1: f1,
    );
  }

  Future<List> readFees() {
    return ApiHelper.apiHelper.readFees();
  }

  Future<List> readStudentUid() {
    return ApiHelper.apiHelper.readStudentUid();
  }
}
