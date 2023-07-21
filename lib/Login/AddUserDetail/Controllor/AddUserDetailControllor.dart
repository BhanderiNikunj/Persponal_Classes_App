import 'dart:typed_data';
import 'package:classes_app/Login/AddUserDetail/Model/AddUserDetailModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUserDetailControllor extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSurname = TextEditingController();
  TextEditingController txtMobileNo = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  RxInt checkAdmin = 1.obs;
  RxInt checkStd = 1.obs;

  RxString iPath = "".obs;
  Uint8List? imageBytes;


  // admin

  Future<String> insertAdminDetail({
    required AddUserDetailModel a1,
  }) async {
    return await FirebaseHelper.firebaseHelper.insertAdminDetail(
      a1: a1,
    );
  }

  Future<String> updateAdminDetail({
    required AddUserDetailModel a1,
  }) async {
    return await FirebaseHelper.firebaseHelper.updateAdminDetail(
      a1: a1,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readAdminDetail() {
    return FirebaseHelper.firebaseHelper.readAdminDetail();
  }


  // user

  // Future<String> insertUserDetail({
  //   required AddUserDetailModel a1,
  // }) async {
  //   return await FirebaseHelper.firebaseHelper.insertUserDetail(
  //     a1: a1,
  //   );
  // }
  //
  // Future<String> updateUserDetail({
  //   required AddUserDetailModel a1,
  // }) async {
  //   return await FirebaseHelper.firebaseHelper.updateUserDetail(
  //     a1: a1,
  //   );
  // }
  //
  // Stream<QuerySnapshot<Map<String, dynamic>>> readUserDetail() {
  //   return FirebaseHelper.firebaseHelper.readUSerDetail();
  // }
}
