import 'dart:async';

import 'package:classes_app/Screen/Login/AddUserDetail/Model/AddUserDetailModel.dart';
import 'package:classes_app/Screen/Profile/Model/ProfileModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class checkUserScreen extends StatefulWidget {
  const checkUserScreen({super.key});

  @override
  State<checkUserScreen> createState() => _checkUserScreenState();
}

class _checkUserScreenState extends State<checkUserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseHelper.firebaseHelper.readUSerDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<AddUserDetailModel> dataList = [];
              for (var x in snapshot.data!.docs) {
                AddUserDetailModel addUserDetailModel = AddUserDetailModel(
                  name: x['name'],
                  surname: x['surname'],
                  image: x['image'],
                  key: x.id,
                  checkAdmin: x['adminUser'],
                  emailId: x['email'],
                  mobileNo: x['mobile'],
                );

                dataList.add(addUserDetailModel);
              }

              Timer(
                Duration(microseconds: 1),
                () {
                  for (int i = 0; i < dataList.length; i++) {
                    if (dataList[i].checkAdmin == 0) {
                      // Get.offAndToNamed('/userHome');
                      if (dataList[i].uid ==
                          FirebaseHelper.firebaseHelper.FindUid()) {
                        Get.offAndToNamed('/userHome');
                      } else {
                        ProfileModel p1 = ProfileModel(
                          checkUpdate: 0,
                        );
                        Get.offAndToNamed(
                          '/addUserDetail',
                          arguments: p1,
                        );
                      }
                    } else {
                      // ProfileModel profileModel = ProfileModel(
                      //   checkUpdate: 0,
                      // );
                      // Get.offAndToNamed(
                      //   '/addUserDetail',
                      //   arguments: profileModel,
                      // );
                      Get.offAndToNamed('/bottom');
                    }
                  }
                  // if (dataList[0].checkAdmin == 0) {}
                  // if (dataList.isEmpty) {
                  //
                  // } else {
                  //   if (dataList[0].checkAdmin == 0) {
                  //     Get.offAndToNamed('/userHome');
                  //   } else {
                  //     Get.offAndToNamed('/bottom');
                  //   }
                  // }
                },
              );

              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
