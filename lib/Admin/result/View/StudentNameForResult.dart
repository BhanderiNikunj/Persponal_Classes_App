import 'package:classes_app/Controllors/ResultControllor.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class StudentNameForResultScreen extends StatefulWidget {
  const StudentNameForResultScreen({super.key});

  @override
  State<StudentNameForResultScreen> createState() =>
      _StudentNameForResultScreenState();
}

class _StudentNameForResultScreenState
    extends State<StudentNameForResultScreen> {
  ResultControllor resultControllor = Get.put(
    ResultControllor(),
  );

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
            Container(
              width: 200.sp,
              height: 50.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: resultControllor.std,
                    items: [
                      DropdownMenuItem(
                        value: "1",
                        child: Text(
                          "Std 1",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text(
                          "Std 2",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text(
                          "Std 3",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Text(
                          "Std 4",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "5",
                        child: Text(
                          "Std 5",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "6",
                        child: Text(
                          "Std 6",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "7",
                        child: Text(
                          "Std 7",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "8",
                        child: Text(
                          "Std 8",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "9",
                        child: Text(
                          "Std 9",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "10",
                        child: Text(
                          "Std 10",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      resultControllor.std = value!;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: resultControllor.readStudentUid(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "${snapshot.error}",
                      style: GoogleFonts.archivo(),
                    );
                  } else if (snapshot.hasData) {
                    resultControllor.studentUidList = snapshot.data!;
                    return ListView.builder(
                      itemCount: resultControllor.studentUidList.length,
                      itemBuilder: (context, index) {
                        return resultControllor.studentUidList[index].std
                                    .compareTo(resultControllor.std) !=
                                0
                            ? Text(
                                "",
                                style: GoogleFonts.archivo(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    '/resultRead',
                                    arguments:
                                        resultControllor.studentUidList[index],
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    "${resultControllor.studentUidList[index].firstName}",
                                    style: GoogleFonts.archivo(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  leading: Text(
                                    "${resultControllor.studentUidList[index].std}",
                                    style: GoogleFonts.archivo(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
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
