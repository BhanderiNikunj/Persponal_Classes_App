import 'dart:async';
import 'package:classes_app/Admin/AdminProfile/Model/AdminProfileModel.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FirebaseHelper.firebaseHelper.checkLogin() ? login() : notLogin(),
      ),
    );
  }

  Widget login() {
    List<AdminProfileModel> dataList = [];
    return StreamBuilder(
      stream: FirebaseHelper.firebaseHelper.readAdminDetail(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "${snapshot.error}",
          );
        } else if (snapshot.hasData) {
          for (var x in snapshot.data!.docs) {
            AdminProfileModel a1 = AdminProfileModel(
              surname: x['surname'],
              image: x['image'],
              name: x['name'],
              std: x['std'],
              key: x.id,
              adminUser: x['adminUser'],
              checkUpdate: 0,
              mobile: x['mobile'],
              email: x['email'],
              uid: FirebaseHelper.firebaseHelper.FindUid(),
            );
            dataList.add(a1);
          }

          Timer(
            Duration(
              seconds: 3,
            ),
            () async {

              if (dataList.isNotEmpty) {
                if (dataList[0].adminUser == 1) {
                  String? fcm = await FirebaseHelper.firebaseHelper.findFCMToken();
                  print(fcm);
                  Get.offAndToNamed('/home');
                } else {
                  Get.offAndToNamed('/userHome');
                }
              } else {
                Get.offAndToNamed(
                  '/checkAdminUser',
                );
              }
            },
          );
          print(dataList.length);
          return Center(
            child: Image.asset(
              "Assets/Images/bright.png",
              height: 170.sp,
            ),
          );
        }
        return Center(
          child: Image.asset(
            "Assets/Images/bright_op.png",
            height: 170.sp,
          ),
        );
      },
    );
  }

  Widget notLogin() {
    Timer(
      Duration(seconds: 3),
      () {
        Get.offAndToNamed('/signIn');
      },
    );
    return Center(
      child: Container(
        height: 150.sp,
        child: Image.asset(
          "Assets/Images/bright.png",
        ),
      ),
    );
  }
}
