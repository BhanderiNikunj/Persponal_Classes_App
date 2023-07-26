import 'package:carousel_slider/carousel_controller.dart';
import 'package:classes_app/Admin/AdminHome/Model/AdminHomeModel.dart';
import 'package:classes_app/Admin/AdminImageSet/Model/AdminImageSetModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminHomeControllor extends GetxController {
  CarouselController buttonCarouselController = CarouselController();

  List<AdminHomeModel> Types = [
    AdminHomeModel(
      image: "Assets/Images/student.png",
      name: "Student",
    ),
    AdminHomeModel(
      image: "Assets/Images/homeWork.png",
      name: "HomeWork",
    ),
    AdminHomeModel(
      image: "Assets/Images/result.png",
      name: "Result",
    ),
  ];

  List<AdminImageSetModel> imageList = [];

  void signOut() {
    FirebaseHelper.firebaseHelper.signOut();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readImage() {
    return FirebaseHelper.firebaseHelper.readImage();
  }
}
