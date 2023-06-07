import 'package:classes_app/Screen/AddStudent/Model/StudentModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddStudentControllor extends GetxController {
  TextEditingController txtf_name = TextEditingController();
  TextEditingController txtl_name = TextEditingController();
  TextEditingController txtmobile_no = TextEditingController();
  TextEditingController txtemail_id = TextEditingController();
  TextEditingController txtpaid_fees = TextEditingController();
  TextEditingController txttotal_fees = TextEditingController();

  void InsertData({
    required StudentModel s1,
  }) {
    FirebaseHelper.firebaseHelper.InsertStudentDetail(
      s1: s1,
    );
  }
}
