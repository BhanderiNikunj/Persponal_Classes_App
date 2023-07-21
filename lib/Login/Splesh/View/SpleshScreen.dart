import 'dart:async';

import 'package:classes_app/Admin/AdminProfile/Model/AdminProfileModel.dart';
import 'package:classes_app/Login/AddUserDetail/Model/AddUserDetailModel.dart';
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
    List<AddUserDetailModel> dataList = [];
    return StreamBuilder(
      stream: FirebaseHelper.firebaseHelper.readAdminDetail(),
      builder: (context, snapshot) {
        print("---------------------");
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
          for (var data in snapshot.data!.docs) {
            AddUserDetailModel a1 = AddUserDetailModel(
              key: data.id,
              image: data['image'],
              mobileNo: data['mobile'],
              emailId: data['email'],
              name: data['name'],
              surname: data['surname'],
              checkAdmin: data['adminUser'],
              std: data['std'],
              uid: data['uid'],
            );
            dataList.add(a1);
          }

          print(dataList.length);

          Timer(
            Duration(seconds: 3),
            () {
              if (dataList[0].checkAdmin == 1) {
                Get.offAndToNamed('/home');
              } else {
                if (dataList.isEmpty) {
                  AdminProfileModel a1 = AdminProfileModel(
                    checkUpdate: 0,
                  );
                  Get.offAndToNamed(
                    '/addUserDetail',
                    arguments: a1,
                  );
                } else {
                  if (dataList[0].checkAdmin == 1) {
                    Get.offAndToNamed('/bottom');
                  } else {
                    Get.offAndToNamed('/userHome');
                  }
                }
              }
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
