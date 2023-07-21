import 'package:classes_app/Admin/AdminMassage/Model/AdminMassageModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminMassageControllor extends GetxController {
  List<AdminMassageModel> massageList = [];

  TextEditingController txtMsg = TextEditingController();

  Future<String> insertMassage({
    required AdminMassageModel m1,
  }) {
    return FirebaseHelper.firebaseHelper.insertMassage(
      m1: m1,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readMassage() {
    return FirebaseHelper.firebaseHelper.readMassage();
  }

  Future<void> deleteMassage({
    required AdminMassageModel m1,
  }) {
    return FirebaseHelper.firebaseHelper.deleteMassage(
      m1: m1,
    );
  }

  void updateMassage({
    required AdminMassageModel m1,
  }) {
    FirebaseHelper.firebaseHelper.updateMassage(
      m1: m1,
    );
  }
}
