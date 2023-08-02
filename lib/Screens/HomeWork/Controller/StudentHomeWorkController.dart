import 'package:classes_app/Models/HomeWorkModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StudentHomeWorkController extends GetxController {
  List<HomeWorkModel> studentHomeWorkList = [];
  RxInt std = 1.obs;
  String subject = "Math's";

  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDueDate = TextEditingController(
    text:
        "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
  );

  void insertStudentHomeWork({
    required HomeWorkModel h1,
  }) {
    FirebaseHelper.firebaseHelper.insertHomeWork(
      h1: h1,
    );
  }

  void updateStudentHomeWork({
    required HomeWorkModel h1,
  }) {
    FirebaseHelper.firebaseHelper.updateHomeWork(
      h1: h1,
    );
  }

  void deleteStudentHomeWork({
    required HomeWorkModel h1,
  }) {
    FirebaseHelper.firebaseHelper.deleteHomeWork(
      h1: h1,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readStudentHomeWork() {
    return FirebaseHelper.firebaseHelper.readHomeWork();
  }
}
