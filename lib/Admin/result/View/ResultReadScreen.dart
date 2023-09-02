import 'package:classes_app/Controllors/ResultControllor.dart';
import 'package:classes_app/Models/ResultModel.dart';
import 'package:classes_app/Models/StudentUidModel.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class ResultReadScreen extends StatefulWidget {
  const ResultReadScreen({super.key});

  @override
  State<ResultReadScreen> createState() => _ResultReadScreenState();
}

class _ResultReadScreenState extends State<ResultReadScreen> {
  ResultControllor resultControllor = Get.put(
    ResultControllor(),
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
                  text: "Student Result",
                ),
                Container(
                  height: 50.sp,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: resultControllor.readResult(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                            "${snapshot.error}",
                          );
                        } else if (snapshot.hasData) {
                          resultControllor.studentResultList = snapshot.data!;

                          return Expanded(
                            child: ListView.builder(
                              itemCount:
                                  resultControllor.studentResultList.length,
                              itemBuilder: (context, index) {
                                print(
                                    "${resultControllor.uid}================= ${resultControllor.studentResultList[index].uid!}");
                                return studentUidModel.uid!.compareTo(
                                            "${resultControllor.uid!}") !=
                                        0
                                    ? Padding(
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
                                      )
                                    : Padding(
                                        padding: EdgeInsets.all(8.sp),
                                        child: Container(
                                          height: 220.sp,
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
                                                      "Name :- ${resultControllor.studentResultList[index].firstName}",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.sp),
                                                    Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "Total Mark :- ${resultControllor.studentResultList[index].total}",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.sp),
                                                    Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "Out Mark :- ${resultControllor.studentResultList[index].totalOutOf}",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.sp),
                                                    Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "English :- ${resultControllor.studentResultList[index].english}",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.sp),
                                                    Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "Social Science :- ${resultControllor.studentResultList[index].socialScience}",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.sp),
                                                    Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "Science :- ${resultControllor.studentResultList[index].science}",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.sp),
                                                    Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "Gujarati :- ${resultControllor.studentResultList[index].gujarati}",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.sp),
                                                    Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "Hindi :- ${resultControllor.studentResultList[index].hindi}",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.sp),
                                                    Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "Sanskrit :- ${resultControllor.studentResultList[index].sanskrit}",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        ResultModel r1 =
                                                            ResultModel(
                                                          id: resultControllor
                                                              .studentResultList[
                                                                  index]
                                                              .id,
                                                          english: resultControllor
                                                              .studentResultList[
                                                                  index]
                                                              .english,
                                                          gujarati: resultControllor
                                                              .studentResultList[
                                                                  index]
                                                              .gujarati,
                                                          hindi: resultControllor
                                                              .studentResultList[
                                                                  index]
                                                              .hindi,
                                                          math: resultControllor
                                                              .studentResultList[
                                                                  index]
                                                              .math,
                                                          sanskrit: resultControllor
                                                              .studentResultList[
                                                                  index]
                                                              .sanskrit,
                                                          science: resultControllor
                                                              .studentResultList[
                                                                  index]
                                                              .science,
                                                          socialScience:
                                                              resultControllor
                                                                  .studentResultList[
                                                                      index]
                                                                  .socialScience,
                                                          total: resultControllor
                                                              .studentResultList[
                                                                  index]
                                                              .total,
                                                          firstName:
                                                              studentUidModel
                                                                  .firstName,
                                                          uid: studentUidModel
                                                              .uid,
                                                          std: studentUidModel
                                                              .std,
                                                          check: 1,
                                                        );

                                                        Get.toNamed(
                                                          '/resultAdd',
                                                          arguments: r1,
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () async {},
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
                              },
                            ),
                          );
                        }
                        return Center(
                          child: Text(
                            "Work In Process",
                            style: GoogleFonts.archivo(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ResultModel r1 = ResultModel(
              firstName: studentUidModel.firstName,
              uid: studentUidModel.uid,
              std: studentUidModel.std,
              check: 0,
            );

            Get.toNamed(
              '/resultAdd',
              arguments: r1,
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
