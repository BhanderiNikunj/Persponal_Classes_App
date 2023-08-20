import 'package:classes_app/Controllors/MassageControllor.dart';
import 'package:classes_app/Models/MassageModel.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MassageReadScreen extends StatefulWidget {
  const MassageReadScreen({super.key});

  @override
  State<MassageReadScreen> createState() => _MassageReadScreenState();
}

class _MassageReadScreenState extends State<MassageReadScreen> {
  MassageControllor massageControllor = Get.put(
    MassageControllor(),
  );

  @override
  void initState() {
    super.initState();

    AdsHelper.adsHelper.loadInterstitialAds();
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
                  text: "Massages",
                ),
                Container(
                  height: 50.sp,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          AdsHelper.adsHelper.loadInterstitialAds();
                          AdsHelper.adsHelper.interstitialAd?.show();
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                ),
                SizedBox(width: 10.sp),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: massageControllor.readMassage(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "${snapshot.error}",
                      style: GoogleFonts.archivo(),
                    );
                  } else if (snapshot.hasData) {
                    massageControllor.massageList = snapshot.data!;
                    return ListView.builder(
                      itemCount: massageControllor.massageList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Id :- ${massageControllor.massageList[index].id}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Massage :- ${massageControllor.massageList[index].massage}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Date :- ${massageControllor.massageList[index].date}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Time :- ${massageControllor.massageList[index].time}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          MassageModel m1 = MassageModel(
                                            check: 1,
                                            time:
                                            massageControllor.massageList[index].time,
                                            date:
                                            massageControllor.massageList[index].date,
                                            massage: massageControllor
                                                .massageList[index].massage,
                                            id: massageControllor.massageList[index].id,
                                          );
                                          Get.toNamed(
                                            '/massageAdd',
                                            arguments: m1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
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
                  return Center(
                    child: Text("Work In Process"),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MassageModel m1 = MassageModel(
              check: 0,
            );
            Get.toNamed(
              '/massageAdd',
              arguments: m1,
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

  Widget listOfMassage() {
    return FutureBuilder(
      future: massageControllor.readMassage(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "${snapshot.error}",
            style: GoogleFonts.archivo(),
          );
        } else if (snapshot.hasData) {
          massageControllor.massageList = snapshot.data!;
          return ListView.builder(
            itemCount: massageControllor.massageList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.sp),
                child: Container(
                  height: 120.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Id :- ${massageControllor.massageList[index].id}",
                              style: GoogleFonts.archivo(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Massage :- ${massageControllor.massageList[index].massage}",
                              style: GoogleFonts.archivo(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Date :- ${massageControllor.massageList[index].date}",
                              style: GoogleFonts.archivo(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Time :- ${massageControllor.massageList[index].time}",
                              style: GoogleFonts.archivo(
                                fontSize: 15.sp,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                MassageModel m1 = MassageModel(
                                  check: 1,
                                  time:
                                      massageControllor.massageList[index].time,
                                  date:
                                      massageControllor.massageList[index].date,
                                  massage: massageControllor
                                      .massageList[index].massage,
                                  id: massageControllor.massageList[index].id,
                                );
                                Get.toNamed(
                                  '/massageAdd',
                                  arguments: m1,
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
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
        return Center(
          child: Text("Work In Process"),
        );
      },
    );
  }
}
