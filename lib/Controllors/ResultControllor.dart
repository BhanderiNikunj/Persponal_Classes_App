import 'package:classes_app/Models/ResultModel.dart';
import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResultControllor extends GetxController {
  List studentUidList = [];
  List<dynamic> studentResultList = [];
  String std = "1";
  String? uid = FirebaseHelper.firebaseHelper.findUid();

  TextEditingController txtName = TextEditingController();
  TextEditingController txtStd = TextEditingController();
  TextEditingController txtMath = TextEditingController();
  TextEditingController txtScience = TextEditingController();
  TextEditingController txtSocialScience = TextEditingController();
  TextEditingController txtEnglish = TextEditingController();
  TextEditingController txtGujarati = TextEditingController();
  TextEditingController txtHindi = TextEditingController();
  TextEditingController txtSanskrit = TextEditingController();
  TextEditingController txtTotal = TextEditingController();

  Future<bool> insertResult({
    required ResultModel r1,
  }) {
    return ApiHelper.apiHelper.insertResult(
      r1: r1,
    );
  }

  Future<bool> updateResult({
    required ResultModel r1,
  }) {
    return ApiHelper.apiHelper.updateResult(
      r1: r1,
    );
  }

  Future<bool> deleteResult({
    required ResultModel r1,
  }) {
    return ApiHelper.apiHelper.deleteResult(
      r1: r1,
    );
  }

  Future<List> readResult() {
    return ApiHelper.apiHelper.readResult();
  }

  Future<List> readStudentUid() {
    return ApiHelper.apiHelper.readStudentUid();
  }
}
