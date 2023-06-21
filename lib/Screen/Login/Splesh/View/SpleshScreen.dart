import 'dart:async';

import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        FirebaseHelper.firebaseHelper.checkLogin() == false
            ? Get.offAndToNamed('/signIn')
            : Get.offAndToNamed('/bottom');
      },
    );

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            height: 150.sp,
            "Assets/Images/bright.jpg",
          ),
        ),
      ),
    );
  }
}
