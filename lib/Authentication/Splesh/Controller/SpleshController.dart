import 'package:classes_app/Authentication/AddAllData/Model/AddAllDetailModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SpleshController extends GetxController {

  List<AddAllDetailModel> detailList = [];

  bool checkLogin() {
    return FirebaseHelper.firebaseHelper.checkLogin();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readDetail() {
    return FirebaseHelper.firebaseHelper.readDetail();
  }
}
