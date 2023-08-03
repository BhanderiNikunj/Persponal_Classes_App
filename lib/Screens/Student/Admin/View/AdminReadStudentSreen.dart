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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  child: DropdownButton(
                    isExpanded: true,
                    value: studentController.std!.value,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          "All",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "Std 1",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "Std 2",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text(
                          "Std 3",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 4,
                        child: Text(
                          "Std 4",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 5,
                        child: Text(
                          "Std 5",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 6,
                        child: Text(
                          "Std 6",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 7,
                        child: Text(
                          "Std 7",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 8,
                        child: Text(
                          "Std 8",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 9,
                        child: Text(
                          "Std 9",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 10,
                        child: Text(
                          "Std 10",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      studentController.std!.value = value!;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
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
                        if (studentController.std == 1) {
                          return studentController.studentList[index].std != 1
                              ? Container()
                              : Padding(
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
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  mobile_no: studentController
                                                      .studentList[index]
                                                      .mobile_no,
                                                  l_name: studentController
                                                      .studentList[index]
                                                      .l_name,
                                                  father_name: studentController
                                                      .studentList[index]
                                                      .father_name,
                                                  std: studentController
                                                      .studentList[index].std,
                                                  f_name: studentController
                                                      .studentList[index]
                                                      .f_name,
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
                        } else if (studentController.std == 2) {
                          return studentController.studentList[index].std != 2
                              ? Container()
                              : Padding(
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
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                    ),
                                    padding: EdgeInsets.all(10.sp),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 220.sp,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  mobile_no: studentController
                                                      .studentList[index]
                                                      .mobile_no,
                                                  l_name: studentController
                                                      .studentList[index]
                                                      .l_name,
                                                  father_name: studentController
                                                      .studentList[index]
                                                      .father_name,
                                                  std: studentController
                                                      .studentList[index].std,
                                                  f_name: studentController
                                                      .studentList[index]
                                                      .f_name,
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
                        } else if (studentController.std == 3) {
                          return studentController.studentList[index].std != 3
                              ? Container()
                              : Padding(
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
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  mobile_no: studentController
                                                      .studentList[index]
                                                      .mobile_no,
                                                  l_name: studentController
                                                      .studentList[index]
                                                      .l_name,
                                                  father_name: studentController
                                                      .studentList[index]
                                                      .father_name,
                                                  std: studentController
                                                      .studentList[index].std,
                                                  f_name: studentController
                                                      .studentList[index]
                                                      .f_name,
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
                        } else if (studentController.std == 4) {
                          return studentController.studentList[index].std != 4
                              ? Container()
                              : Padding(
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
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  mobile_no: studentController
                                                      .studentList[index]
                                                      .mobile_no,
                                                  l_name: studentController
                                                      .studentList[index]
                                                      .l_name,
                                                  father_name: studentController
                                                      .studentList[index]
                                                      .father_name,
                                                  std: studentController
                                                      .studentList[index].std,
                                                  f_name: studentController
                                                      .studentList[index]
                                                      .f_name,
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
                        } else if (studentController.std == 5) {
                          return studentController.studentList[index].std != 5
                              ? Container()
                              : Padding(
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
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  mobile_no: studentController
                                                      .studentList[index]
                                                      .mobile_no,
                                                  l_name: studentController
                                                      .studentList[index]
                                                      .l_name,
                                                  father_name: studentController
                                                      .studentList[index]
                                                      .father_name,
                                                  std: studentController
                                                      .studentList[index].std,
                                                  f_name: studentController
                                                      .studentList[index]
                                                      .f_name,
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
                        } else if (studentController.std == 6) {
                          return studentController.studentList[index].std != 6
                              ? Container()
                              : Padding(
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
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  mobile_no: studentController
                                                      .studentList[index]
                                                      .mobile_no,
                                                  l_name: studentController
                                                      .studentList[index]
                                                      .l_name,
                                                  father_name: studentController
                                                      .studentList[index]
                                                      .father_name,
                                                  std: studentController
                                                      .studentList[index].std,
                                                  f_name: studentController
                                                      .studentList[index]
                                                      .f_name,
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
                        } else if (studentController.std == 7) {
                          return studentController.studentList[index].std != 7
                              ? Container()
                              : Padding(
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
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  mobile_no: studentController
                                                      .studentList[index]
                                                      .mobile_no,
                                                  l_name: studentController
                                                      .studentList[index]
                                                      .l_name,
                                                  father_name: studentController
                                                      .studentList[index]
                                                      .father_name,
                                                  std: studentController
                                                      .studentList[index].std,
                                                  f_name: studentController
                                                      .studentList[index]
                                                      .f_name,
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
                        } else if (studentController.std == 8) {
                          return studentController.studentList[index].std != 8
                              ? Container()
                              : Padding(
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
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  mobile_no: studentController
                                                      .studentList[index]
                                                      .mobile_no,
                                                  l_name: studentController
                                                      .studentList[index]
                                                      .l_name,
                                                  father_name: studentController
                                                      .studentList[index]
                                                      .father_name,
                                                  std: studentController
                                                      .studentList[index].std,
                                                  f_name: studentController
                                                      .studentList[index]
                                                      .f_name,
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
                        } else if (studentController.std == 9) {
                          return studentController.studentList[index].std != 9
                              ? Container()
                              : Padding(
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
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  mobile_no: studentController
                                                      .studentList[index]
                                                      .mobile_no,
                                                  l_name: studentController
                                                      .studentList[index]
                                                      .l_name,
                                                  father_name: studentController
                                                      .studentList[index]
                                                      .father_name,
                                                  std: studentController
                                                      .studentList[index].std,
                                                  f_name: studentController
                                                      .studentList[index]
                                                      .f_name,
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
                        } else if (studentController.std == 10) {
                          return studentController.studentList[index].std != 10
                              ? Container()
                              : Padding(
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
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  mobile_no: studentController
                                                      .studentList[index]
                                                      .mobile_no,
                                                  l_name: studentController
                                                      .studentList[index]
                                                      .l_name,
                                                  father_name: studentController
                                                      .studentList[index]
                                                      .father_name,
                                                  std: studentController
                                                      .studentList[index].std,
                                                  f_name: studentController
                                                      .studentList[index]
                                                      .f_name,
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
                        } else {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                        }
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
