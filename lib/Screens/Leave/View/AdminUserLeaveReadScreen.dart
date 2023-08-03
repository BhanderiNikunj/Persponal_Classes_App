import 'package:classes_app/Models/LeaveModel.dart';
import 'package:classes_app/Screens/Leave/Controllor/AdminUserLeaveControllor.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminUserLeaveReadScreen extends StatefulWidget {
  const AdminUserLeaveReadScreen({super.key});

  @override
  State<AdminUserLeaveReadScreen> createState() =>
      _AdminUserLeaveReadScreenState();
}

class _AdminUserLeaveReadScreenState extends State<AdminUserLeaveReadScreen> {
  AdminUserLeaveControllor adminUserLeaveControllor = Get.put(
    AdminUserLeaveControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            LeaveModel l1 = LeaveModel(
              check: 0,
            );
            Get.toNamed(
              '/leaveAdd',
              arguments: l1,
            );
          },
          backgroundColor: Color(0xff2660A6),
          child: Icon(
            Icons.add,
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Leave",
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
                stream: adminUserLeaveControllor.readLeave(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "${snapshot.error}",
                      style: GoogleFonts.archivo(),
                    );
                  } else if (snapshot.hasData) {
                    adminUserLeaveControllor.leaveList.clear();
                    for (var x in snapshot.data!.docs) {
                      LeaveModel l1 = LeaveModel(
                        name: x['name'],
                        detail: x['detail'],
                        date_to: x['date_to'],
                        date_form: x['date_form'],
                        std: x['std'],
                        key: x.id,
                      );

                      adminUserLeaveControllor.leaveList.add(l1);
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                            margin: EdgeInsets.all(10.sp),
                            height: 120.sp,
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
                            child: Row(
                              children: [
                                SizedBox(width: 10.sp),
                                Container(
                                  width: 220.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Name :- ${adminUserLeaveControllor.leaveList[index].name}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Resion :- ${adminUserLeaveControllor.leaveList[index].detail}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Date From :- ${adminUserLeaveControllor.leaveList[index].date_form}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Date To :- ${adminUserLeaveControllor.leaveList[index].date_to}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${adminUserLeaveControllor.leaveList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        LeaveModel l1 = LeaveModel(
                                          date_form: adminUserLeaveControllor
                                              .leaveList[index].date_form,
                                          date_to: adminUserLeaveControllor
                                              .leaveList[index].date_to,
                                          detail: adminUserLeaveControllor
                                              .leaveList[index].detail,
                                          key: adminUserLeaveControllor
                                              .leaveList[index].key,
                                          name: adminUserLeaveControllor
                                              .leaveList[index].name,
                                          check: 1,
                                          std: adminUserLeaveControllor
                                              .leaveList[index].std,
                                        );

                                        Get.toNamed(
                                          '/leaveAdd',
                                          arguments: l1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    SizedBox(height: 10.sp),
                                    IconButton(
                                      onPressed: () {
                                        LeaveModel l1 = LeaveModel(
                                          key: adminUserLeaveControllor
                                              .leaveList[index].key,
                                        );
                                        adminUserLeaveControllor.deleteLeave(
                                          l1: l1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: adminUserLeaveControllor.leaveList.length,
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
