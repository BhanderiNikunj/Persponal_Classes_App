import 'package:classes_app/Models/StudentModel.dart';
import 'package:classes_app/Screens/Student/Admin/Controller/StudentController.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminReadStudentScreen extends StatefulWidget {
  const AdminReadStudentScreen({super.key});

  @override
  State<AdminReadStudentScreen> createState() => _AdminReadStudentScreenState();
}

class _AdminReadStudentScreenState extends State<AdminReadStudentScreen> {
  StudentController studentController = Get.put(
    StudentController(),
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
                  text: "Student Detail",
                ),
                Container(
                  height: 50.sp,
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
            // SizedBox(height: 10.sp),
            StreamBuilder(
              stream: studentController.readStudent(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "${snapshot.error}",
                    ),
                  );
                } else if (snapshot.hasData) {
                  studentController.studentList.clear();
                  for (var x in snapshot.data!.docs) {
                    StudentModel s1 = StudentModel(
                      f_name: x['f_name'],
                      std: x['std'],
                      father_name: x['father_name'],
                      l_name: x['l_name'],
                      key: x.id,
                      mobile_no: x['mobile_no'],
                    );

                    studentController.studentList.add(s1);
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: studentController.studentList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Container(
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
                            padding: EdgeInsets.all(10.sp),
                            child: Row(
                              children: [
                                Container(
                                  width: 220.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "name :- ${studentController.studentList[index].f_name} ${studentController.studentList[index].l_name}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10.sp),
                                      Text(
                                        "Father Name :- ${studentController.studentList[index].father_name}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 10.sp),
                                      Text(
                                        "Mobile No :- ${studentController.studentList[index].mobile_no}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 10.sp),
                                      Text(
                                        "Std :- ${studentController.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          mobile_no: studentController
                                              .studentList[index].mobile_no,
                                          l_name: studentController
                                              .studentList[index].l_name,
                                          father_name: studentController
                                              .studentList[index].father_name,
                                          std: studentController
                                              .studentList[index].std,
                                          f_name: studentController
                                              .studentList[index].f_name,
                                          checkUpdate: 1,
                                          key: studentController
                                              .studentList[index].key,
                                        );
                                        Get.toNamed(
                                          '/adminStudentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    SizedBox(height: 10.sp),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          key: studentController
                                              .studentList[index].key,
                                        );
                                        studentController.deleteStudent(
                                          s1: s1,
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
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            StudentModel s1 = StudentModel(
              checkUpdate: 0,
            );
            Get.toNamed(
              '/adminStudentAdd',
              arguments: s1,
            );
          },
          backgroundColor: Color(0xff2660A6),
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
