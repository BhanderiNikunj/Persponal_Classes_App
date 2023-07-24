import 'package:classes_app/User/UserResult/Model/UserResultModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserResultControllor extends GetxController {

  List<UserResultModel> resultList = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> readStudentResult() {
    return FirebaseHelper.firebaseHelper.readResult();
  }


  String findUid(){
    return FirebaseHelper.firebaseHelper.FindUid();
  }
}
