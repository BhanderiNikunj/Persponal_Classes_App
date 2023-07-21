import 'package:carousel_slider/carousel_controller.dart';
import 'package:classes_app/Admin/AdminImageSet/Model/AdminImageSetModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserHomeControllor extends GetxController {
  CarouselController buttonCarouselController = CarouselController();


  List<AdminImageSetModel> imageList = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> readImages() {
    return FirebaseHelper.firebaseHelper.readImage();
  }
}
