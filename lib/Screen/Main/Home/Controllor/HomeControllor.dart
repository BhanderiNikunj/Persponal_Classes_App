import 'package:carousel_slider/carousel_controller.dart';
import 'package:classes_app/Screen/ImageSet/Model/ImageSetModel.dart';
import 'package:classes_app/Screen/Main/Home/Model/HomeModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeControllor extends GetxController {
  CarouselController buttonCarouselController = CarouselController();

  List<HomeModel> Types = [
    HomeModel(
      image: "Assets/Images/student.png",
      name: "Student",
    ),
    HomeModel(
      image: "Assets/Images/Homework.png",
      name: "HomeWork",
    ),
    HomeModel(
      image: "Assets/Images/announcement.png",
      name: "Announcement",
    ),
  ];

  List<ImageSetModel> imageList = [];

  void signOut() {
    FirebaseHelper.firebaseHelper.signOut();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readImage() {
    return FirebaseHelper.firebaseHelper.readImage();
  }
}
