import 'package:classes_app/Controllors/FeesControllor.dart';
import 'package:classes_app/Models/FeesModel.dart';
import 'package:classes_app/Models/StudentUidModel.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class FeesReadScreen extends StatefulWidget {
  const FeesReadScreen({super.key});

  @override
  State<FeesReadScreen> createState() => _FeesReadScreenState();
}

class _FeesReadScreenState extends State<FeesReadScreen> {
  FeesControllor feesControllor = Get.put(
    FeesControllor(),
  );

  StudentUidModel studentUidModel = Get.arguments;

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
                              if (feesControllor.feesList[index].uid
                                      .compareTo("${studentUidModel.uid}") !=
                                  0) {
                                return Padding(
                                  padding: EdgeInsets.all(8.sp),
                                  child: Container(
                                    height: 150.sp,
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
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Data Not Found",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
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
                                        Container(
                                          width: 20.sp,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  FeesModel f1 = FeesModel(
                                                    firstName: feesControllor
                                                        .feesList[index]
                                                        .firstName,
                                                    std: feesControllor
                                                        .feesList[index].std,
                                                    totalFees: feesControllor
                                                        .feesList[index]
                                                        .totalFees,
                                                    paidFees: feesControllor
                                                        .feesList[index]
                                                        .paidFees,
                                                    uid: studentUidModel.uid,
                                                    id: feesControllor
                                                        .feesList[index].id,
                                                    lessFees: feesControllor
                                                        .feesList[index]
                                                        .lessFees,
                                                    check: 1,
                                                  );
                                                  Get.toNamed(
                                                    '/feesAdd',
                                                    arguments: f1,
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () async {
                                                  FeesModel f1 = FeesModel(
                                                    id: feesControllor
                                                        .feesList[index].id,
                                                  );

                                                  bool check =
                                                      await feesControllor
                                                          .deleteFees(
                                                    f1: f1,
                                                  );

                                                  if (check) {
                                                    Get.snackbar(
                                                      "Success Fully Delete",
                                                      "",
                                                    );

                                                    feesControllor.feesList =
                                                        await feesControllor
                                                            .readFees();
                                                    setState(() {});
                                                  } else {
                                                    Get.snackbar(
                                                      "Un Success Fully Delete",
                                                      "",
                                                    );
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                ),
                                              ),
                                            ],
                                          ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FeesModel f1 = FeesModel(
              check: 0,
              firstName: studentUidModel.firstName,
              uid: studentUidModel.uid,
              std: studentUidModel.std,
            );
            Get.toNamed(
              '/feesAdd',
              arguments: f1,
            );
          },
          backgroundColor: Color(0xff5055C4),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(17.sp),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
