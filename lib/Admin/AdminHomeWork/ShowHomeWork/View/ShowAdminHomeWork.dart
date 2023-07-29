import 'dart:math';
import 'package:classes_app/Admin/AdminHomeWork/AddAdminHomeWork/Controllor/AddHomeWorkControllor.dart';
import 'package:classes_app/Admin/AdminHomeWork/ShowHomeWork/Model/HomeWorkModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminShowHomeWorkScreen extends StatefulWidget {
  const AdminShowHomeWorkScreen({super.key});

  @override
  State<AdminShowHomeWorkScreen> createState() =>
      _AdminShowHomeWorkScreenState();
}

class _AdminShowHomeWorkScreenState extends State<AdminShowHomeWorkScreen> {
  AddAdminHomeWorkControllor addHomeWorkControllor = Get.put(
    AddAdminHomeWorkControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: addHomeWorkControllor.readHomeWork(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                  style: GoogleFonts.archivo(),
                ),
              );
            } else if (snapshot.hasData) {
              addHomeWorkControllor.homeWorkList.clear();
              QuerySnapshot? snapData = snapshot.data;

              for (var x in snapData!.docs) {
                HomeWorkModel h1 = HomeWorkModel(
                    key: x.id,
                    subject: x['subject'],
                    dueDate: x['dueDate'],
                    title: x['title'],
                    std: x['std']);

                addHomeWorkControllor.homeWorkList.add(h1);
              }
              return Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "Assets/Images/bright_op.png",
                      height: 200.sp,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50.sp,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.sp),
                              bottomRight: Radius.circular(20.sp)),
                          color: Color(0xffE85720),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.offAndToNamed('/home');
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Home Work",
                                    style: GoogleFonts.archivo(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 150,
                            child: Obx(
                              () => DropdownButton(
                                isExpanded: true,
                                value: addHomeWorkControllor.checkStd.value,
                                items: [
                                  DropdownMenuItem(
                                    value: 0,
                                    child: Text(
                                      "All",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text(
                                      "Std 1",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text(
                                      "Std 2",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 3,
                                    child: Text(
                                      "Std 3",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 4,
                                    child: Text(
                                      "Std 4",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 5,
                                    child: Text(
                                      "Std 5",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 6,
                                    child: Text(
                                      "Std 6",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 7,
                                    child: Text(
                                      "Std 7",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 8,
                                    child: Text(
                                      "Std 8",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 9,
                                    child: Text(
                                      "Std 9",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 10,
                                    child: Text(
                                      "Std 10",
                                      style: GoogleFonts.archivo(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  addHomeWorkControllor.checkStd.value = value!;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => homeWork(
                          std: addHomeWorkControllor.checkStd.value,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff01957f),
          onPressed: () {
            HomeWorkModel h1 = HomeWorkModel(
              check: 0,
            );
            Get.toNamed(
              '/addHomeWork',
              arguments: h1,
            );
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }

  Widget homeWork({
    required std,
  }) {
    if (std == 1) {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return addHomeWorkControllor.homeWorkList[index].std != 1
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    } else if (std == 2) {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return addHomeWorkControllor.homeWorkList[index].std != 2
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    } else if (std == 3) {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return addHomeWorkControllor.homeWorkList[index].std != 3
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    } else if (std == 4) {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return addHomeWorkControllor.homeWorkList[index].std != 4
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    } else if (std == 5) {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return addHomeWorkControllor.homeWorkList[index].std != 5
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    } else if (std == 6) {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return addHomeWorkControllor.homeWorkList[index].std != 6
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    } else if (std == 7) {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return addHomeWorkControllor.homeWorkList[index].std != 7
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    } else if (std == 8) {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return addHomeWorkControllor.homeWorkList[index].std != 8
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    } else if (std == 9) {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return addHomeWorkControllor.homeWorkList[index].std != 9
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    } else if (std == 10) {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return addHomeWorkControllor.homeWorkList[index].std != 10
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                  style: GoogleFonts.archivo(),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                                  style: GoogleFonts.archivo(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: addHomeWorkControllor.homeWorkList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(15.sp),
              child: Container(
                height: 80.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                  gradient: LinearGradient(
                    transform: GradientRotation(pi / 4),
                    colors: [
                      Color(0xff2ED0FF),
                      Color(0xff50AFFF),
                      Color(0xff6E92FF),
                      Color(0xff7E82FF),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.sp,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150.sp,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                          ),
                        ),
                        SizedBox(height: 5.sp),
                        Container(
                          width: 150.sp,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                          ),
                        ),
                        SizedBox(height: 5.sp),
                        Container(
                          width: 150.sp,
                          child: Text(
                            "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 5.sp),
                        Container(
                          width: 150.sp,
                          child: Text(
                            "Std :- ${addHomeWorkControllor.homeWorkList[index].std}",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50.sp,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            HomeWorkModel h1 = HomeWorkModel(
                              std:
                                  addHomeWorkControllor.homeWorkList[index].std,
                              title: addHomeWorkControllor
                                  .homeWorkList[index].title,
                              dueDate: addHomeWorkControllor
                                  .homeWorkList[index].dueDate,
                              key:
                                  addHomeWorkControllor.homeWorkList[index].key,
                              subject: addHomeWorkControllor
                                  .homeWorkList[index].subject,
                              check: 1,
                            );

                            print(h1.std);
                            Get.toNamed(
                              '/addHomeWork',
                              arguments: h1,
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            HomeWorkModel h1 = HomeWorkModel(
                              key:
                                  addHomeWorkControllor.homeWorkList[index].key,
                            );
                            addHomeWorkControllor.deleteHomeWork(
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
          },
        ),
      );
    }
  }
}
