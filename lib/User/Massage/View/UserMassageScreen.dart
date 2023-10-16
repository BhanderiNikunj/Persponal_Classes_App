import 'package:classes_app/Controllors/MassageControllor.dart';
import 'package:classes_app/Models/MassageModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UserMassageScreen extends StatefulWidget {
  const UserMassageScreen({super.key});

  @override
  State<UserMassageScreen> createState() => _UserMassageScreenState();
}

class _UserMassageScreenState extends State<UserMassageScreen> {
  MassageControllor massageControllor = Get.put(
    MassageControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Massage",
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          MassageModel m1 = MassageModel(
                                            check: 1,
                                            time: massageControllor
                                                .massageList[index].time,
                                            date: massageControllor
                                                .massageList[index].date,
                                            massage: massageControllor
                                                .massageList[index].massage,
                                            id: massageControllor
                                                .massageList[index].id,
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
                                        onPressed: () async {
                                          MassageModel m1 = MassageModel(
                                            id: massageControllor
                                                .massageList[index].id,
                                          );
                                          bool check = await massageControllor
                                              .deleteMassage(
                                            m1: m1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Delete Success Fully",
                                              "",
                                            );

                                            massageControllor.readMassage();
                                          } else {
                                            Get.snackbar(
                                              "Delete Un Success Fully",
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
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
