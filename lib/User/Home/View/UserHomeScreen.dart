import 'package:classes_app/Controllors/HomeControllor.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  HomeControllor homeControllor = Get.put(
    HomeControllor(),
  );

  @override
  void initState() {
    super.initState();

    AdsHelper.adsHelper.loadBannerAd();
    AdsHelper.adsHelper.loadBannerAd();
    AdsHelper.adsHelper.loadInterstitialAd();
    AdsHelper.adsHelper.loadInterstitialAd();
    AdsHelper.adsHelper.loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            allAppBar(
              text: "Home Screen",
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: homeControllor.userTitleList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (homeControllor
                          .userTitleList[index].routes!.isNotEmpty) {
                        AdsHelper.adsHelper.loadInterstitialAd();
                        AdsHelper.adsHelper.interstitialAd?.show();
                        Get.toNamed(
                            '${homeControllor.userTitleList[index].routes}');
                      } else {
                        Get.toNamed('/pageNotFound');
                      }
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.all(10.sp),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Image.asset(
                              "${homeControllor.userTitleList[index].image}",
                              height: 80.sp,
                            ),
                            Text(
                              "${homeControllor.userTitleList[index].name}",
                              style: GoogleFonts.archivo(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 50.sp,
          child: AdWidget(
            ad: AdsHelper.adsHelper.bannerAd!,
          ),
        ),
      ),
    );
  }
}
