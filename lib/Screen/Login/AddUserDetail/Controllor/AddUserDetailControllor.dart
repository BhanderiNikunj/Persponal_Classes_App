import 'dart:typed_data';
import 'package:classes_app/Screen/Login/AddUserDetail/Model/AddUserDetailModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUserDetailControllor extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSurname = TextEditingController();
  TextEditingController txtMobileNo = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  RxInt checkAdmin = 1.obs;
  RxString iPath = "".obs;
  Uint8List? imageBytes;

  Future<String> insertUserDetail({
    required AddUserDetailModel a1,
  }) async {
    return await FirebaseHelper.firebaseHelper.insertUserDetail(
      a1: a1,
    );
  }

  Future<String> updateUserDetail({
    required AddUserDetailModel a1,
  }) async {
    return await FirebaseHelper.firebaseHelper.updateUserDetail(
      a1: a1,
    );
  }

  void readUserDetail({
    required AddUserDetailModel a1,
  }) {
    FirebaseHelper.firebaseHelper.readUSerDetail(
      // a1: a1,
    );
  }
}
