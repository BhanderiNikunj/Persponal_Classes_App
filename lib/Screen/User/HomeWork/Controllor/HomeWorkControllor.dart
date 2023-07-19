import 'package:classes_app/Screen/User/HomeWork/Model/userHomeWorkModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserHomeWorkControllor extends GetxController {

  List<userHomeWorkModel> homeWorkList = [];


  Stream<QuerySnapshot<Map<String, dynamic>>> readHomeWork() {
    return FirebaseHelper.firebaseHelper.readHomeWork();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readUserDetail() {
    return FirebaseHelper.firebaseHelper.readUSerDetail();
  }
}
