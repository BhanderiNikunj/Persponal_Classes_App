import 'dart:async';

import 'package:classes_app/Models/AddAllDetailModel.dart';
import 'package:classes_app/Authentication/Splesh/Controller/SpleshController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  SpleshController spleshController = Get.put(
    SpleshController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: spleshController.readDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                "${snapshot.hasError}",
                style: GoogleFonts.archivo(
                  fontWeight: FontWeight.bold,
                ),
              );
            } else if (snapshot.hasData) {
              spleshController.detailList.clear();
              for (var x in snapshot.data!.docs) {
                AddAllDetailModel addAllDetailModel = AddAllDetailModel(
                  std: x['std'],
                  adminUser: x['adminUser'],
                  key: x.id,
                  f_name: x['f_name'],
                  l_name: x['l_name'],
                  mobile: x['mobile_no'],
                  email: x['email'],
                  checkUpdate: 0,
                );
                //
                spleshController.detailList.add(addAllDetailModel);
              }

              Timer(
                Duration(
                  seconds: 3,
                ),
                () {
                  if (spleshController.checkLogin()) {
                    if (spleshController.detailList[0].adminUser == 1) {
                      if (spleshController.detailList.isEmpty) {
                        Get.offAndToNamed('/addDetail');
                      } else {
                        // home
                        Get.offAndToNamed('/adminHome');
                      }
                    } else {
                      if (spleshController.detailList.isEmpty) {
                        Get.offAndToNamed('/addDetail');
                      } else {
                        // userHome
                        Get.offAndToNamed('/userHome');
                      }
                    }
                  } else {
                    Get.offAndToNamed('/login');
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
        ),
      ),
    );
  }
}
