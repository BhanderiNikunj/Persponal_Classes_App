import 'package:classes_app/Controllors/FeesControllor.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class UserFeesReadScreen extends StatefulWidget {
  const UserFeesReadScreen({super.key});

  @override
  State<UserFeesReadScreen> createState() => _UserFeesReadScreenState();
}

class _UserFeesReadScreenState extends State<UserFeesReadScreen> {
  FeesControllor feesControllor = Get.put(FeesControllor());

  @override
  void initState() {
    super.initState();

    AdsHelper.adsHelper.loadBannerAd();
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
                  text: "Student Fees",
                ),
                Container(
                  height: 50.sp,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: feesControllor.readFees(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "${snapshot.error}",
                    );
                  } else if (snapshot.hasData) {
                    feesControllor.feesList = snapshot.data!;
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: feesControllor.feesList.length,
                            itemBuilder: (context, index) {
                              if (FirebaseHelper.firebaseHelper
                                      .findUid()
                                      ?.compareTo(
                                          "${feesControllor.feesList[index].uid}") ==
                                  1) {
                                return Text(
                                  "",
                                  style: GoogleFonts.archivo(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsets.all(8.sp),
                                  child: Container(
                                    height: 120.sp,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: Colors.white70,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Colors.black12,
                                          offset: Offset(
                                            0,
                                            0,
                                          ),
                                          spreadRadius: 7,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10.sp,
                                        ),
                                        Container(
                                          width: 200.sp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Name :- ${feesControllor.feesList[index].firstName}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Std :- ${feesControllor.feesList[index].std}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  return Center(
                    child: Text(
                      "Work In Process",
                      style: GoogleFonts.archivo(),
                    ),
                  );
                },
              ),
            )
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
