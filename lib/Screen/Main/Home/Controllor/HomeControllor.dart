import 'package:carousel_slider/carousel_controller.dart';
import 'package:classes_app/Screen/Main/Home/Model/HomeModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/material.dart';
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

  List imageList = [
    "Assets/Images/ImageSlider/1.jpeg",
    "Assets/Images/ImageSlider/2.jpeg",
    // "Assets/Images/ImageSlider/3.jpeg",
    "Assets/Images/ImageSlider/4.jpeg",
    // "Assets/Images/ImageSlider/5.jpeg",
    "Assets/Images/ImageSlider/6.jpeg",
    "Assets/Images/ImageSlider/7.jpeg",
    "Assets/Images/ImageSlider/8.jpeg",
    "Assets/Images/ImageSlider/9.jpeg",
  ];

  void signOut() {
    FirebaseHelper.firebaseHelper.signOut();
  }
}
