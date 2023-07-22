import 'package:classes_app/Admin/AdminProfile/Model/AdminProfileModel.dart';
import 'package:classes_app/User/UserHomeWork/Model/UserHomeWorkModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserHomeWorkControllor extends GetxController {

  List<UserHomeWorkModel> homeWorkList = [];
  List<AdminProfileModel> detailList = [];


  Stream<QuerySnapshot<Map<String, dynamic>>> readHomeWork() {
    return FirebaseHelper.firebaseHelper.readHomeWork();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readUserDetail() {
    return FirebaseHelper.firebaseHelper.readAdminDetail();
  }
}
