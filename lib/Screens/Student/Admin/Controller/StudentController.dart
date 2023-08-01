import 'package:classes_app/Models/StudentModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  List<StudentModel> studentList = [];

  // Add Data

  TextEditingController txtFName = TextEditingController();
  TextEditingController txtLName = TextEditingController();
  TextEditingController txtFaName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtStd = TextEditingController();

  void insertStudent({
    required StudentModel s1,
  }) {
    FirebaseHelper.firebaseHelper.insertStudent(
      s1: s1,
    );
  }

  void updateStudent({
    required StudentModel s1,
  }) {
    FirebaseHelper.firebaseHelper.updateStudent(
      s1: s1,
    );
  }

  void deleteStudent({
    required StudentModel s1,
  }) {
    FirebaseHelper.firebaseHelper.deleteStudent(s1: s1);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readStudent() {
    return FirebaseHelper.firebaseHelper.readStudent();
  }
}
