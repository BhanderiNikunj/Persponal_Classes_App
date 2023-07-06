import 'dart:typed_data';

import 'package:classes_app/Screen/ImageSet/Model/ImageSetModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ImageSetControllor extends GetxController {
  List<ImageSetModel> imageList = [];

  Uint8List? imageBytes;
  RxString ipath = "".obs;

  Stream<QuerySnapshot<Map<String, dynamic>>> readImage() {
    return FirebaseHelper.firebaseHelper.readImage();
  }

  Future<String> insertImage({
    required String image,
  }) async {
    return await FirebaseHelper.firebaseHelper.insertImage(
      image: image,
    );
  }

  void deleteImage({
    required id,
  }) {
    FirebaseHelper.firebaseHelper.deleteImage(
      id: id,
    );
  }
}
