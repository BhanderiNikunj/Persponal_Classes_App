import 'package:classes_app/Controllors/HomeWorkControllor.dart';
import 'package:classes_app/Models/HomeWorkModel.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class HomeWorkReadScreen extends StatefulWidget {
  const HomeWorkReadScreen({super.key});

  @override
  State<HomeWorkReadScreen> createState() => _HomeWorkReadScreenState();
}

class _HomeWorkReadScreenState extends State<HomeWorkReadScreen> {
  HomeWorkControllor homeWorkControllor = Get.put(
    HomeWorkControllor(),
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
                  text: "Student HomeWork",
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
                DropdownButton(
                  value: homeWorkControllor.std,
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
                    homeWorkControllor.std = value!;
                    setState(() {});
                  },
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: homeWorkControllor.readHomeWork(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "${snapshot.error}",
                        style: GoogleFonts.archivo(),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    homeWorkControllor.homeWorkList = snapshot.data!;
                    return ListView.builder(
                      itemCount: homeWorkControllor.homeWorkList.length,
                      itemBuilder: (context, index) {
                        return homeWorkControllor.homeWorkList[index].std
                                    .compareTo(homeWorkControllor.std) !=
                                0
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: Container(
                                  height: 100.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black26,
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
                                              "Home Work :- ${homeWorkControllor.homeWorkList[index].homeWork}",
                                              style: GoogleFonts.archivo(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Subject :- ${homeWorkControllor.homeWorkList[index].subject}",
                                              style: GoogleFonts.archivo(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Due Date :- ${homeWorkControllor.homeWorkList[index].dueDate}",
                                              style: GoogleFonts.archivo(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Std :- ${homeWorkControllor.homeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject: homeWorkControllor
                                                      .homeWorkList[index]
                                                      .subject,
                                                  std: homeWorkControllor
                                                      .homeWorkList[index].std,
                                                  dueDate: homeWorkControllor
                                                      .homeWorkList[index]
                                                      .dueDate,
                                                  homeWork: homeWorkControllor
                                                      .homeWorkList[index]
                                                      .homeWork,
                                                  id: homeWorkControllor
                                                      .homeWorkList[index].id,
                                                  check: 1,
                                                );
                                                Get.toNamed(
                                                  '/homeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  id: homeWorkControllor
                                                      .homeWorkList[index].id,
                                                );
                                                bool check =
                                                    await homeWorkControllor
                                                        .deleteHomeWork(
                                                  h1: h1,
                                                );

                                                if (check) {
                                                  Get.snackbar(
                                                    "Success Fully Delete",
                                                    "",
                                                  );

                                                  homeWorkControllor
                                                          .homeWorkList =
                                                      await homeWorkControllor
                                                          .readHomeWork();
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
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            HomeWorkModel h1 = HomeWorkModel(
              check: 0,
            );
            Get.toNamed(
              '/homeWorkAdd',
              arguments: h1,
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
