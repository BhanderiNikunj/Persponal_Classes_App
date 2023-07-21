import 'package:classes_app/Admin/AdminMassage/Model/AdminMassageModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserMassageControllor extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> readMassage() {
    return FirebaseHelper.firebaseHelper.readMassage();
  }

  List<AdminMassageModel> massageList = [];
}
