import 'dart:async';

import 'package:classes_app/Screen/Login/AddUserDetail/Model/AddUserDetailModel.dart';
import 'package:classes_app/Screen/Profile/Model/ProfileModel.dart';
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
    return SafeArea(
      child: Scaffold(
        body: FirebaseHelper.firebaseHelper.checkLogin() == false
            ? notLogin()
            : login(),
      ),
    );
  }

  Widget login() {
    List<AddUserDetailModel> dataList = [];
    return StreamBuilder(
      stream: FirebaseHelper.firebaseHelper.readUSerDetail(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        else if (snapshot.hasData) {
          for (var data in snapshot.data!.docs) {
            AddUserDetailModel a1 = AddUserDetailModel(
              key: data.id,
              image: data['image'],
              mobileNo: data['mobile'],
              emailId: data['email'],
              name: data['name'],
              surname: data['surname'],
              checkAdmin: data['adminUser'],
            );
            dataList.add(a1);
          }

          if (dataList.isEmpty) {
            Timer(
              Duration(seconds: 3),
              () {
                ProfileModel p1 = ProfileModel(
                  checkUpdate: 0,
                );
                Get.offAndToNamed(
                  '/addUserDetail',
                  arguments: p1,
                );
              },
            );
          } else {
            Timer(
              Duration(seconds: 3),
              () {
                if (dataList[0].checkAdmin == 1) {
                  Get.offAndToNamed('/bottom');
                } else {
                  if (dataList.isEmpty) {
                    ProfileModel p1 = ProfileModel(
                      checkUpdate: 0,
                    );
                    Get.offAndToNamed(
                      '/addUserDetail',
                      arguments: p1,
                    );
                  } else {
                    Get.offAndToNamed('/userHome');
                  }
                }
              },
            );
          }

          return Center(
            child: Container(
              height: 150.sp,
              child: Image.asset(
                "Assets/Images/bright.png",
              ),
            ),
          );
        }
        return Center(
          child: Container(
            height: 150.sp,
            child: Image.asset(
              "Assets/Images/bright.png",
            ),
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
