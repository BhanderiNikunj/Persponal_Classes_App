import 'package:classes_app/Models/MassageModel.dart';
import 'package:classes_app/Screens/Message/Controllor/MassageControllor.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminMessageReadScreen extends StatefulWidget {
  const AdminMessageReadScreen({super.key});

  @override
  State<AdminMessageReadScreen> createState() => _AdminMessageReadScreenState();
}

class _AdminMessageReadScreenState extends State<AdminMessageReadScreen> {
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
                  text: "Announcement",
                ),
                Container(
                  height: 50.sp,
                  child: IconButton(
                    onPressed: () {
                      Get.offAndToNamed('/adminHome');
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
              child: StreamBuilder(
                stream: massageControllor.readMassage(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "${snapshot.error}",
                      style: GoogleFonts.archivo(
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else if (snapshot.hasData) {
                    massageControllor.massageList.clear();
                    for (var x in snapshot.data!.docs) {
                      MassageModel m1 = MassageModel(
                        date: x['date'],
                        title: x['title'],
                        key: x.id,
                        time: x['time'],
                      );

                      massageControllor.massageList.add(m1);
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                            margin: EdgeInsets.all(10.sp),
                            height: 100.sp,
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  spreadRadius: 5,
                                  color: Colors.black12,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 10.sp),
                                    Container(
                                      width: 220.sp,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10.sp),
                                          Text(
                                            "${massageControllor.massageList[index].title}",
                                            style: GoogleFonts.archivo(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30.sp,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.edit,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              MassageModel m1 = MassageModel(
                                                key: massageControllor
                                                    .massageList[index].key,
                                              );
                                              massageControllor.deleteMassage(
                                                m1: m1,
                                              );
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${massageControllor.massageList[index].date} - ",
                                            style: GoogleFonts.archivo(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "${massageControllor.massageList[index].time}",
                                            style: GoogleFonts.archivo(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: massageControllor.massageList.length,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                controller: massageControllor.txtMassage,
                style: GoogleFonts.archivo(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  labelText: "Enter Massage",
                  suffixIcon: IconButton(
                    onPressed: () {
                      MassageModel m1 = MassageModel(
                        title: massageControllor.txtMassage.text,
                        date:
                            "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
                        time:
                            "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute}",
                      );
                      massageControllor.insertMassage(
                        m1: m1,
                      );
                      massageControllor.txtMassage.clear();
                    },
                    icon: Icon(
                      Icons.send,
                    ),
                  ),
                  labelStyle: GoogleFonts.archivo(
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.sp),
          ],
        ),
      ),
    );
  }
}
