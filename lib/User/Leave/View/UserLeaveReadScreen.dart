import 'package:classes_app/Controllors/LeaveControllor.dart';
import 'package:classes_app/Models/LeaveModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLeaveReadScreen extends StatefulWidget {
  const UserLeaveReadScreen({super.key});

  @override
  State<UserLeaveReadScreen> createState() => _UserLeaveReadScreenState();
}

class _UserLeaveReadScreenState extends State<UserLeaveReadScreen> {
  LeaveControllor leaveControllor = Get.put(
    LeaveControllor(),
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
                  text: "Student Leave",
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                future: leaveControllor.readLeave(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "${snapshot.error}",
                      style: GoogleFonts.archivo(),
                    );
                  } else if (snapshot.hasData) {
                    leaveControllor.leaveList = snapshot.data!;
                    return ListView.builder(
                      itemCount: leaveControllor.leaveList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 160.sp,
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
                                        "Name :- ${leaveControllor.leaveList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        height: 50.sp,
                                        child: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          "Massage :- ${leaveControllor.leaveList[index].resion}",
                                          style: GoogleFonts.archivo(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Date From :- ${leaveControllor.leaveList[index].dateForm}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Date To :- ${leaveControllor.leaveList[index].dateTo}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${leaveControllor.leaveList[index].std}",
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          LeaveModel l1 = LeaveModel(
                                            std: leaveControllor
                                                .leaveList[index].std,
                                            id: leaveControllor
                                                .leaveList[index].id,
                                            firstName: leaveControllor
                                                .leaveList[index].firstName,
                                            dateForm: leaveControllor
                                                .leaveList[index].dateForm,
                                            dateTo: leaveControllor
                                                .leaveList[index].dateTo,
                                            resion: leaveControllor
                                                .leaveList[index].resion,
                                            check: 1,
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
                                      IconButton(
                                        onPressed: () async {
                                          LeaveModel l1 = LeaveModel(
                                            id: leaveControllor
                                                .leaveList[index].id,
                                          );
                                          bool check =
                                              await leaveControllor.deleteLeave(
                                            l1: l1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );
                                            leaveControllor.leaveList =
                                                await leaveControllor
                                                    .readLeave();
                                            setState(() {});
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
