import 'package:classes_app/Screen/Profile/Model/ProfileModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileControllor extends GetxController {
  List<ProfileModel> detailList = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> readUserDetail() {
    return FirebaseHelper.firebaseHelper.readUSerDetail();
  }

  void signOut(){
    return FirebaseHelper.firebaseHelper.signOut();
  }
}
