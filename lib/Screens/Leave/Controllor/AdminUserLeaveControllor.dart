import 'package:classes_app/Models/LeaveModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminUserLeaveControllor extends GetxController {
  int checkStudent = 0;
  int? std = 1;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtResion = TextEditingController();
  TextEditingController txtDateFrom = TextEditingController(
    text:
        "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
  );
  TextEditingController txtDateTo = TextEditingController(
    text:
        "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
  );


  List<LeaveModel> leaveList = [];

  void insertLeave({
    required LeaveModel l1,
  }) {
    FirebaseHelper.firebaseHelper.insertLeave(
      l1: l1,
    );
  }

  void updateLeave({
    required LeaveModel l1,
  }) {
    FirebaseHelper.firebaseHelper.updateLeave(
      l1: l1,
    );
  }

  void deleteLeave({
    required LeaveModel l1,
  }) {
    FirebaseHelper.firebaseHelper.deleteLeave(
      l1: l1,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readLeave() {
    return FirebaseHelper.firebaseHelper.readLeave();
  }
}
