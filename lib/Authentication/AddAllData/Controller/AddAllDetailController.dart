import 'package:classes_app/Models/AddAllDetailModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAllDetailController extends GetxController {
  TextEditingController txtFName = TextEditingController();
  TextEditingController txtLName = TextEditingController();
  TextEditingController txtMobileNo = TextEditingController();
  RxInt isCheck = 0.obs;
  RxInt std = 1.obs;

  void insertDetail({
    required AddAllDetailModel addAllDetailModel,
  }) {
    FirebaseHelper.firebaseHelper.insertDetail(
      addAllDetailModel: addAllDetailModel,
    );
  }
}
