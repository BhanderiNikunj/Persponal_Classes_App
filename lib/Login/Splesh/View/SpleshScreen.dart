import 'dart:async';
import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FirebaseHelper.firebaseHelper.checkLogin() == false
            ? notLogIn()
            : logIn(),
      ),
    );
  }

  Widget logIn() {
    return FutureBuilder(
      future: ApiHelper.apiHelper.readUserDetail(),
      builder: (Context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "${snapshot.error}",
          );
        } else if (snapshot.hasData) {
          List<dynamic> l1 = snapshot.data!;
          Timer(
            Duration(seconds: 3),
            () {
              if (FirebaseHelper.firebaseHelper.checkLogin()) {
                if (l1.isEmpty) {
                  Get.offAndToNamed('/logIn');
                } else {
                  if (l1[0].chechAdmin?.compareTo("1") == 0) {
                    Get.offAndToNamed('/home');
                  } else {
                    Get.offAndToNamed('/userHome');
                  }
                }
              } else {
                Get.offAndToNamed('/logIn');
              }
            },
          );
          return Center(
            child: Image.asset(
              "Assets/Images/bright.png",
              height: 200.sp,
            ),
          );
        }
        return Center(
          child: Image.asset(
            "Assets/Images/bright.png",
            height: 200.sp,
          ),
        );
      },
      // future: ,
    );
  }

  Widget notLogIn() {
    Timer(
      Duration(seconds: 3),
      () {
        Get.offAndToNamed('/logIn');
      },
    );
    return Center(
      child: Image.asset(
        "Assets/Images/bright.png",
        height: 200.sp,
      ),
    );
  }
}
