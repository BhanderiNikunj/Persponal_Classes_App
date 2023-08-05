import 'dart:async';
import 'package:classes_app/Authentication/logIn/Controller/LogInController.dart';
import 'package:classes_app/Models/AddAllDetailModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GotoHomeScreen extends StatefulWidget {
  const GotoHomeScreen({super.key});

  @override
  State<GotoHomeScreen> createState() => _GotoHomeScreenState();
}

class _GotoHomeScreenState extends State<GotoHomeScreen> {
  LogInController logInController = Get.put(
    LogInController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: logInController.readDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                "${snapshot.hasError}",
                style: GoogleFonts.archivo(
                  fontWeight: FontWeight.bold,
                ),
              );
            } else if (snapshot.hasData) {
              logInController.detailList.clear();
              for (var x in snapshot.data!.docs) {
                print(snapshot.data!.docs);
                AddAllDetailModel addAllDetailModel = AddAllDetailModel(
                  std: x['std'],
                  adminUser: x['adminUser'],
                  key: x.id,
                  f_name: x['f_name'],
                  l_name: x['l_name'],
                  mobile: x['mobile'],
                  email: x['email'],
                );

                logInController.detailList.add(addAllDetailModel);

                print(logInController.detailList.length);
              }


              Timer(
                Duration(seconds: 300000),
                () async {
                  if (logInController.detailList.isEmpty) {

                    Get.offAndToNamed('/addDetail');
                  } else {
                    if(logInController.detailList[0].adminUser == 0){
                      Get.offAndToNamed('/userHome');
                    }
                    else{
                      Get.offAndToNamed('/home');
                    }
                  }
                },
              );

              return Center(child: Container());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

// LogInModel logInModel = LogInModel(
//   email: logInController.txtEmail.text,
//   password: logInController.txtPassword.text,
// );
// String msg = await logInController.logIn(
// logInModel: logInModel);
//
// if (msg == "success") {
//
// if(logInController.detailList.isEmpty){
// Get.offAndToNamed('/addDetail');
// }
// else{
// Get.offAndToNamed('/home');
// }
// } else {
// Get.snackbar(
// "$msg",
// "",
// );
// }
