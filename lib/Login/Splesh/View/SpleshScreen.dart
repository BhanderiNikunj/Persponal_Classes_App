import 'dart:async';

import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
    AdsHelper.adsHelper.loadBannerAds();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        if(FirebaseHelper.firebaseHelper.checkLogin()){
          Get.offAndToNamed('/home');
        }
        else{
          Get.offAndToNamed('/logIn');
        }
      },
    );
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 50.sp,
          child: AdWidget(
            ad: AdsHelper.adsHelper.bannerAd!,
          ),
        ),
        body: Center(
          child: Image.asset(
            "Assets/Images/bright.png",
            height: 200.sp,
          ),
        ),
      ),
    );
  }
}
