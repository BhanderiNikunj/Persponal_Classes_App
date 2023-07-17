import 'package:carousel_slider/carousel_controller.dart';
import 'package:classes_app/Screen/ImageSet/Model/ImageSetModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserHomeControllor extends GetxController {
  CarouselController buttonCarouselController = CarouselController();


  List<ImageSetModel> imageList = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> readImages() {
    return FirebaseHelper.firebaseHelper.readImage();
  }
}
