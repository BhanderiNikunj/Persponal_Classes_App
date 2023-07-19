import 'package:classes_app/Screen/HomeWork/ShowHomeWork/Model/HomeWorkModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddHomeWorkControllor extends GetxController {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDueData = TextEditingController(
      text:
          "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}");
  RxString subject = "math".obs;
  List<HomeWorkModel> homeWorkList = [];
  RxInt std = 1.obs;
  RxInt checkStd = 0.obs;

  Future<String> insertHomeWork({
    required HomeWorkModel h1,
  }) async {
    return await FirebaseHelper.firebaseHelper.insertHomeWork(
      h1: h1,
    );
  }

  Future<String> updateHomeWork({
    required HomeWorkModel h1,
  }) async {
    return await FirebaseHelper.firebaseHelper.updateHomeWork(
      h1: h1,
    );
  }

  void deleteHomeWork({
    required HomeWorkModel h1,
  }) {
    FirebaseHelper.firebaseHelper.deleteHomeWork(
      h1: h1,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readHomeWork() {
    return FirebaseHelper.firebaseHelper.readHomeWork();
  }
}
