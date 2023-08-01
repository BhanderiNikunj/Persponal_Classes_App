import 'package:carousel_slider/carousel_controller.dart';
import 'package:classes_app/Models/ImageModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeControllor extends GetxController {

  List<ImageModel> imageList = [];

  CarouselController buttonCarouselController = CarouselController();

  Stream<QuerySnapshot<Map<String, dynamic>>> readImage() {
    return FirebaseHelper.firebaseHelper.readImage();
  }
}
