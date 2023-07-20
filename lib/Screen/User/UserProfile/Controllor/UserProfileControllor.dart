import 'package:classes_app/Screen/User/UserProfile/Model/UserProfileModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserProfileControllor extends GetxController {

  List<UserProfileModel> UserData = [];


  Stream<QuerySnapshot<Map<String, dynamic>>> readUserData() {
    return FirebaseHelper.firebaseHelper.readUSerDetail();
  }
}