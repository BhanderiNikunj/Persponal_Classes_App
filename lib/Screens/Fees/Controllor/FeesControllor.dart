import 'package:classes_app/Models/ReadStudentNameModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FeesControllor extends GetxController {

  List<ReadStudentNameModel> studentNameList = [];
  int std = 1;

  void inserFees() {}

  Stream<QuerySnapshot<Map<String, dynamic>>> readStudentName() {
    return FirebaseHelper.firebaseHelper.readStudentName();
  }
}
