import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNotFoundScreen extends StatefulWidget {
  const PageNotFoundScreen({super.key});

  @override
  State<PageNotFoundScreen> createState() => _PageNotFoundScreenState();
}

class _PageNotFoundScreenState extends State<PageNotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "Assets/Images/pageNotFound.png",
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: allButton(
                  string: "Back To Home",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
