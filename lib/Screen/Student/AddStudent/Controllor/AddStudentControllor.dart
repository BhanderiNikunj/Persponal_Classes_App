import 'package:classes_app/Screen/Student/AddStudent/Model/StudentModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddStudentControllor extends GetxController {
  TextEditingController txtf_name = TextEditingController();
  TextEditingController txtl_name = TextEditingController();
  TextEditingController txtfatherName = TextEditingController();
  TextEditingController txtmobile_no = TextEditingController();
  TextEditingController txtemail_id = TextEditingController();
  TextEditingController txtpaid_fees = TextEditingController();
  TextEditingController txttotal_fees = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  RxInt std = 1.obs;
  String key = "";

  void insertData({
    required StudentModel s1,
  }) {
    FirebaseHelper.firebaseHelper.InsertStudentDetail(
      s1: s1,
    );
  }

  void updateData({
    required StudentModel s1,
  }) {
    FirebaseHelper.firebaseHelper.updateStudentDetail(
      s1: s1,
    );
  }

  Uint8List? imageBytes;
  RxString ipath = "".obs;
}
