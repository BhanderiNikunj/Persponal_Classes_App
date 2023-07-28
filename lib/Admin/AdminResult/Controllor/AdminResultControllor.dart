import 'package:classes_app/Admin/AdminResult/Model/AdminResultModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminResultControllor extends GetxController {
  RxInt checkStd = 1.obs;
  List<AdminResultModel> allStdList = [];
  List<AdminResultModel> resultList = [];
  DateTime? d1;

  TextEditingController txtMath = TextEditingController();
  TextEditingController txtSS = TextEditingController();
  TextEditingController txtSci = TextEditingController();
  TextEditingController txtEng = TextEditingController();
  TextEditingController txtDate = TextEditingController(
      text:
          "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}");

  // result

  void insertResult({
    required AdminResultModel r1,
  }) {
    return FirebaseHelper.firebaseHelper.insertResult(
      r1: r1,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readResult() {
    return FirebaseHelper.firebaseHelper.readResult();
  }

  Future<void> deleteResult({
    required AdminResultModel r1,
  }) {
    return FirebaseHelper.firebaseHelper.deleteResult(r1: r1);
  }

  void updateResult({
    required AdminResultModel r1,
  }) {
    FirebaseHelper.firebaseHelper.updateResult(
      r1: r1,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readStudentOnResult() {
    return FirebaseHelper.firebaseHelper.readStudentOnResult();
  }
}
