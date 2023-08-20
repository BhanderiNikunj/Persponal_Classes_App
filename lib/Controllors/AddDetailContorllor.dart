import 'package:classes_app/Models/CheckUserModel.dart';
import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailContorllor extends GetxController {
  TextEditingController txtFName = TextEditingController();
  TextEditingController txtLName = TextEditingController();
  TextEditingController txtFaName = TextEditingController();
  TextEditingController txtStd = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  String checkAdmin = "0";

  Future<bool> insertUserDetail({
    required CheckUserModel c1,
  }) {
    return ApiHelper.apiHelper.insertUserDetail(
      c1: c1,
    );
  }
}
