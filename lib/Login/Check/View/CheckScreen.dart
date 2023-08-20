import 'dart:async';
import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  String email = Get.arguments;

  @override
  void initState() {
    super.initState();

    print("${FirebaseHelper.firebaseHelper.findEmail()}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: ApiHelper.apiHelper.readUserDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                "${snapshot.error}",
              );
            } else if (snapshot.hasData) {
              List l1 = snapshot.data!;

              Timer(
                Duration(seconds: 1),
                () {
                  if (l1.isEmpty) {
                    Get.offAndToNamed(
                      '/addDetail',
                      arguments: email,
                    );
                  }
                  else {
                    if (l1[0].chechAdmin.compareTo("1") == 0) {
                      Get.offAndToNamed(
                        '/home',
                      );
                    } else {
                      Get.offAndToNamed(
                        '/userHome',
                      );
                    }
                  }
                },
              );
              return Text(
                "${l1.length}",
              );
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
