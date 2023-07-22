import 'dart:async';
import 'package:classes_app/Admin/AdminProfile/Model/AdminProfileModel.dart';
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
          stream: FirebaseHelper.firebaseHelper.readAdminDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<AdminProfileModel> dataList = [];
              for (var x in snapshot.data!.docs) {
                AdminProfileModel adminProfileModel = AdminProfileModel(
                  name: x['name'],
                  surname: x['surname'],
                  image: x['image'],
                  key: x.id,
                  adminUser: x['adminUser'],
                  email: x['email'],
                  std: x['std'],
                  uid: x['uid'],
                  mobile: x['mobile'],
                );

                dataList.add(adminProfileModel);
              }

              Timer(
                Duration(microseconds: 1),
                () {
                  if (dataList.isEmpty) {
                    Get.offAndToNamed('/addUserDetail');
                  } else {
                    if (dataList[0].adminUser == 1) {
                      Get.offAndToNamed('/bottom');
                    } else {
                      Get.offAndToNamed('/userHome');
                    }
                  }
                },
              );

              // for (int i = 0; i < dataList.length; i++) {
              //   if (dataList[i].checkAdmin == 0) {
              //     // Get.offAndToNamed('/userHome');
              //     if (dataList[i].uid ==
              //         FirebaseHelper.firebaseHelper.FindUid()) {
              //       Get.offAndToNamed('/userHome');
              //     } else {
              //       ProfileModel p1 = ProfileModel(
              //         checkUpdate: 0,
              //       );
              //       Get.offAndToNamed(
              //         '/addUserDetail',
              //         arguments: p1,
              //       );
              //     }
              //   }
              //
              //   else {
              //     Get.offAndToNamed('/bottom');
              //   }
              // }

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
