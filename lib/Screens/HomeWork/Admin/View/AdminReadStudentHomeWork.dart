import 'package:classes_app/Models/HomeWorkModel.dart';
import 'package:classes_app/Screens/HomeWork/Controller/StudentHomeWorkController.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminReadStudentHomeWork extends StatefulWidget {
  const AdminReadStudentHomeWork({super.key});

  @override
  State<AdminReadStudentHomeWork> createState() =>
      _AdminReadStudentHomeWorkState();
}

class _AdminReadStudentHomeWorkState extends State<AdminReadStudentHomeWork> {
  StudentHomeWorkController studentHomeWorkController = Get.put(
    StudentHomeWorkController(),
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
                  text: "Home Work",
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
                    value: studentHomeWorkController.std.value,
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
                      studentHomeWorkController.std.value = value!;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            StreamBuilder(
              stream: studentHomeWorkController.readStudentHomeWork(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "${snapshot.error}",
                    ),
                  );
                } else if (snapshot.hasData) {
                  studentHomeWorkController.studentHomeWorkList.clear();
                  for (var x in snapshot.data!.docs) {
                    HomeWorkModel h1 = HomeWorkModel(
                      title: x['title'],
                      dueDate: x['dueDate'],
                      key: x.id,
                      subject: x['subject'],
                      std: x['std'],
                    );

                    studentHomeWorkController.studentHomeWorkList.add(h1);
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount:
                          studentHomeWorkController.studentHomeWorkList.length,
                      itemBuilder: (context, index) {
                        if (studentHomeWorkController.std == 1) {
                          return studentHomeWorkController
                                      .studentHomeWorkList[index].std !=
                                  1
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.all(10.sp),
                                  child: Container(
                                    height: 130.sp,
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
                                                "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .subject,
                                                  std: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .std,
                                                  dueDate:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .dueDate,
                                                  title:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .title,
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                  check: 1,
                                                );

                                                Get.toNamed(
                                                  '/adminStudentHomeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            SizedBox(height: 10.sp),
                                            IconButton(
                                              onPressed: () {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                );
                                                print(studentHomeWorkController
                                                    .studentHomeWorkList[index]
                                                    .key);
                                                studentHomeWorkController
                                                    .deleteStudentHomeWork(
                                                  h1: h1,
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
                        } else if (studentHomeWorkController.std == 2) {
                          return studentHomeWorkController
                                      .studentHomeWorkList[index].std !=
                                  2
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
                                                  "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                                  style: GoogleFonts.archivo(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 10.sp),
                                                Text(
                                                  "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                                  style: GoogleFonts.archivo(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 10.sp),
                                                Text(
                                                  "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                                  style: GoogleFonts.archivo(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 10.sp),
                                                Text(
                                                  "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .subject,
                                                  std: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .std,
                                                  dueDate:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .dueDate,
                                                  title:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .title,
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                  check: 1,
                                                );

                                                Get.toNamed(
                                                  '/adminStudentHomeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            SizedBox(height: 10.sp),
                                            IconButton(
                                              onPressed: () {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                );
                                                print(studentHomeWorkController
                                                    .studentHomeWorkList[index]
                                                    .key);
                                                studentHomeWorkController
                                                    .deleteStudentHomeWork(
                                                  h1: h1,
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
                        } else if (studentHomeWorkController.std == 3) {
                          return studentHomeWorkController
                                      .studentHomeWorkList[index].std !=
                                  3
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
                                                "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .subject,
                                                  std: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .std,
                                                  dueDate:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .dueDate,
                                                  title:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .title,
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                  check: 1,
                                                );

                                                Get.toNamed(
                                                  '/adminStudentHomeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            SizedBox(height: 10.sp),
                                            IconButton(
                                              onPressed: () {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                );
                                                print(studentHomeWorkController
                                                    .studentHomeWorkList[index]
                                                    .key);
                                                studentHomeWorkController
                                                    .deleteStudentHomeWork(
                                                  h1: h1,
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
                        } else if (studentHomeWorkController.std == 4) {
                          return studentHomeWorkController
                                      .studentHomeWorkList[index].std !=
                                  4
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
                                                "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .subject,
                                                  std: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .std,
                                                  dueDate:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .dueDate,
                                                  title:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .title,
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                  check: 1,
                                                );

                                                Get.toNamed(
                                                  '/adminStudentHomeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            SizedBox(height: 10.sp),
                                            IconButton(
                                              onPressed: () {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                );
                                                print(studentHomeWorkController
                                                    .studentHomeWorkList[index]
                                                    .key);
                                                studentHomeWorkController
                                                    .deleteStudentHomeWork(
                                                  h1: h1,
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
                        } else if (studentHomeWorkController.std == 5) {
                          return studentHomeWorkController
                                      .studentHomeWorkList[index].std !=
                                  5
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
                                                "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .subject,
                                                  std: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .std,
                                                  dueDate:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .dueDate,
                                                  title:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .title,
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                  check: 1,
                                                );

                                                Get.toNamed(
                                                  '/adminStudentHomeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            SizedBox(height: 10.sp),
                                            IconButton(
                                              onPressed: () {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                );
                                                print(studentHomeWorkController
                                                    .studentHomeWorkList[index]
                                                    .key);
                                                studentHomeWorkController
                                                    .deleteStudentHomeWork(
                                                  h1: h1,
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
                        } else if (studentHomeWorkController.std == 6) {
                          return studentHomeWorkController
                                      .studentHomeWorkList[index].std !=
                                  6
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
                                                "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .subject,
                                                  std: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .std,
                                                  dueDate:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .dueDate,
                                                  title:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .title,
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                  check: 1,
                                                );

                                                Get.toNamed(
                                                  '/adminStudentHomeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            SizedBox(height: 10.sp),
                                            IconButton(
                                              onPressed: () {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                );
                                                print(studentHomeWorkController
                                                    .studentHomeWorkList[index]
                                                    .key);
                                                studentHomeWorkController
                                                    .deleteStudentHomeWork(
                                                  h1: h1,
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
                        } else if (studentHomeWorkController.std == 7) {
                          return studentHomeWorkController
                                      .studentHomeWorkList[index].std !=
                                  7
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
                                                "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .subject,
                                                  std: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .std,
                                                  dueDate:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .dueDate,
                                                  title:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .title,
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                  check: 1,
                                                );

                                                Get.toNamed(
                                                  '/adminStudentHomeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            SizedBox(height: 10.sp),
                                            IconButton(
                                              onPressed: () {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                );
                                                print(studentHomeWorkController
                                                    .studentHomeWorkList[index]
                                                    .key);
                                                studentHomeWorkController
                                                    .deleteStudentHomeWork(
                                                  h1: h1,
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
                        } else if (studentHomeWorkController.std == 8) {
                          return studentHomeWorkController
                                      .studentHomeWorkList[index].std !=
                                  8
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
                                                "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .subject,
                                                  std: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .std,
                                                  dueDate:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .dueDate,
                                                  title:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .title,
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                  check: 1,
                                                );

                                                Get.toNamed(
                                                  '/adminStudentHomeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            SizedBox(height: 10.sp),
                                            IconButton(
                                              onPressed: () {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                );
                                                print(studentHomeWorkController
                                                    .studentHomeWorkList[index]
                                                    .key);
                                                studentHomeWorkController
                                                    .deleteStudentHomeWork(
                                                  h1: h1,
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
                        } else if (studentHomeWorkController.std == 9) {
                          return studentHomeWorkController
                                      .studentHomeWorkList[index].std !=
                                  9
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
                                                "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .subject,
                                                  std: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .std,
                                                  dueDate:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .dueDate,
                                                  title:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .title,
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                  check: 1,
                                                );

                                                Get.toNamed(
                                                  '/adminStudentHomeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            SizedBox(height: 10.sp),
                                            IconButton(
                                              onPressed: () {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                );
                                                print(studentHomeWorkController
                                                    .studentHomeWorkList[index]
                                                    .key);
                                                studentHomeWorkController
                                                    .deleteStudentHomeWork(
                                                  h1: h1,
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
                        } else if (studentHomeWorkController.std == 10) {
                          return studentHomeWorkController
                                      .studentHomeWorkList[index].std !=
                                  10
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
                                                "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              Text(
                                                "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  subject:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .subject,
                                                  std: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .std,
                                                  dueDate:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .dueDate,
                                                  title:
                                                      studentHomeWorkController
                                                          .studentHomeWorkList[
                                                              index]
                                                          .title,
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                  check: 1,
                                                );

                                                Get.toNamed(
                                                  '/adminStudentHomeWorkAdd',
                                                  arguments: h1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            SizedBox(height: 10.sp),
                                            IconButton(
                                              onPressed: () {
                                                HomeWorkModel h1 =
                                                    HomeWorkModel(
                                                  key: studentHomeWorkController
                                                      .studentHomeWorkList[
                                                          index]
                                                      .key,
                                                );
                                                studentHomeWorkController
                                                    .deleteStudentHomeWork(
                                                  h1: h1,
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
                                          "Title :- ${studentHomeWorkController.studentHomeWorkList[index].title}",
                                          style: GoogleFonts.archivo(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10.sp),
                                        Text(
                                          "Subject :- ${studentHomeWorkController.studentHomeWorkList[index].subject}",
                                          style: GoogleFonts.archivo(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 10.sp),
                                        Text(
                                          "Due Date :- ${studentHomeWorkController.studentHomeWorkList[index].dueDate}",
                                          style: GoogleFonts.archivo(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 10.sp),
                                        Text(
                                          "Std :- ${studentHomeWorkController.studentHomeWorkList[index].std}",
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
                                          HomeWorkModel h1 = HomeWorkModel(
                                            subject: studentHomeWorkController
                                                .studentHomeWorkList[index]
                                                .subject,
                                            std: studentHomeWorkController
                                                .studentHomeWorkList[index].std,
                                            dueDate: studentHomeWorkController
                                                .studentHomeWorkList[index]
                                                .dueDate,
                                            title: studentHomeWorkController
                                                .studentHomeWorkList[index]
                                                .title,
                                            key: studentHomeWorkController
                                                .studentHomeWorkList[index].key,
                                            check: 1,
                                          );

                                          Get.toNamed(
                                            '/adminStudentHomeWorkAdd',
                                            arguments: h1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      SizedBox(height: 10.sp),
                                      IconButton(
                                        onPressed: () {
                                          HomeWorkModel h1 = HomeWorkModel(
                                            key: studentHomeWorkController
                                                .studentHomeWorkList[index].key,
                                          );
                                          studentHomeWorkController
                                              .deleteStudentHomeWork(
                                            h1: h1,
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
            HomeWorkModel h1 = HomeWorkModel(
              check: 0,
            );

            Get.toNamed(
              '/adminStudentHomeWorkAdd',
              arguments: h1,
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
