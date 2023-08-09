import 'package:classes_app/Models/StudentModel.dart';
import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentControllor extends GetxController {
  TextEditingController txtFName = TextEditingController();
  TextEditingController txtLName = TextEditingController();
  TextEditingController txtFaName = TextEditingController();
  TextEditingController txtMobileNo = TextEditingController();
  TextEditingController txtStd = TextEditingController();

  String language = "gujarati", std = "1";

  List studentList = [];

  Future<List>  readStudent() {
    return ApiHelper.apiHelper.readStudent();
  }

  Future<bool> insertStudent({
    required StudentModel s1,
  }) {
    return ApiHelper.apiHelper.insertStudent(s1: s1);
  }

  Future<bool> updateStudent({
    required StudentModel s1,
  }) {
    return ApiHelper.apiHelper.updateStudent(s1: s1);
  }

  Future<bool> deleteStudent({
    required StudentModel s1,
  }) {
    return ApiHelper.apiHelper.deleteStudent(s1: s1);
  }
}
