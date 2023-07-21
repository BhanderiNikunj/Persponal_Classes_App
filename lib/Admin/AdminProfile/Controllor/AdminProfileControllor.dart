import 'package:classes_app/Admin/AdminProfile/Model/AdminProfileModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminProfileControllor extends GetxController {
  List<AdminProfileModel> detailList = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> readUserDetail() {
    return FirebaseHelper.firebaseHelper.readAdminDetail();
  }

  void signOut(){
    return FirebaseHelper.firebaseHelper.signOut();
  }
}
