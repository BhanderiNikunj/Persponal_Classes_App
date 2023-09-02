import 'package:classes_app/Controllors/HomeControllor.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey key = GlobalKey();

  HomeControllor homeControllor = Get.put(
    HomeControllor(),
  );

  @override
  void initState() {
    super.initState();

    AdsHelper.adsHelper.loadBannerAd();
    AdsHelper.adsHelper.loadInterstitialAd();
    AdsHelper.adsHelper.loadInterstitialAd();
    AdsHelper.adsHelper.loadInterstitialAd();
    AdsHelper.adsHelper.loadInterstitialAd();
    AdsHelper.adsHelper.loadInterstitialAd();
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
            Stack(
              children: [
                allAppBar(
                  text: "Bright Education Classes",
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (homeControllor.titleList[index].routes!.isNotEmpty) {
                                AdsHelper.adsHelper.loadInterstitialAd();
                                AdsHelper.adsHelper.interstitialAd?.show();
                                Get.toNamed(
                                  '${homeControllor.titleList[index].routes}',
                                );
                              }
                              else {
                                Get.toNamed('/pageNotFound');
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(5.sp),
                              // color: Colors.black12,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    "${homeControllor.titleList[index].image}",
                                    height: 70.sp,
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: double.infinity,
                                    // color: Colors.black,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${homeControllor.titleList[index].name}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: homeControllor.titleList.length,
                      ),
                    ),
                  ],
                ),
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
