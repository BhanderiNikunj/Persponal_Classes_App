import 'package:classes_app/Models/AddAllDetailModel.dart';
import 'package:classes_app/Models/LogInModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  List<AddAllDetailModel> detailList = [];

  Future<String> logIn({
    required LogInModel logInModel,
  }) {
    return FirebaseHelper.firebaseHelper.logIn(
      logInModel: logInModel,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readDetail() {
    return FirebaseHelper.firebaseHelper.readDetail();
  }
}
