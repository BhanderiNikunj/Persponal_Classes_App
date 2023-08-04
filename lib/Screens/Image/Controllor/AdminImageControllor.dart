import 'package:classes_app/Models/ImageModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AdminImageControllor extends GetxController {
  List<ImageModel> imageList = [];
  Uint8List? imageBytes;
  String? iPath;

  void insertImage({
    required ImageModel i1,
  }) {
    FirebaseHelper.firebaseHelper.insertImage(i1: i1);
  }

  void deleteImage({
    required ImageModel i1,
  }) {
    FirebaseHelper.firebaseHelper.deleteImage(i1: i1);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readImage() {
    return FirebaseHelper.firebaseHelper.readImage();
  }
}
