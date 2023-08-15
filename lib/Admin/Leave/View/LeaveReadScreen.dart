import 'package:classes_app/Controllors/LeaveControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LeaveReadScreen extends StatefulWidget {
  const LeaveReadScreen({super.key});

  @override
  State<LeaveReadScreen> createState() => _LeaveReadScreenState();
}

class _LeaveReadScreenState extends State<LeaveReadScreen> {
  LeaveControllor leaveControllor = Get.put(
    LeaveControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
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
                                // Text(
                                //   "Id :- ${massageControllor.massageList[index].id}",
                                //   style: GoogleFonts.archivo(
                                //     fontSize: 15.sp,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // Text(
                                //   "Massage :- ${massageControllor.massageList[index].massage}",
                                //   style: GoogleFonts.archivo(
                                //     fontSize: 15.sp,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // Text(
                                //   "Date :- ${massageControllor.massageList[index].date}",
                                //   style: GoogleFonts.archivo(
                                //     fontSize: 15.sp,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // Text(
                                //   "Time :- ${massageControllor.massageList[index].time}",
                                //   style: GoogleFonts.archivo(
                                //     fontSize: 15.sp,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
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
                                  onPressed: () {},
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
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
