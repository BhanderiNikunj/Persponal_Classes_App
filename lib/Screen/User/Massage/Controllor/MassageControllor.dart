import 'package:classes_app/Screen/Massage/Model/MassageModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MassageControllor extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> readMassage() {
    return FirebaseHelper.firebaseHelper.readMassage();
  }

  List<MassageModel> massageList = [];
}
