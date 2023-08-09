import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        Get.offAndToNamed('/home');
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "Assets/Images/bright.png",
            height: 200.sp,
          ),
        ),
      ),
    );
  }
}
