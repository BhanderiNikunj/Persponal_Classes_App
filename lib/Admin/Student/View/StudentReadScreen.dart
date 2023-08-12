import 'package:classes_app/Controllors/StudentControllor.dart';
import 'package:classes_app/Models/StudentModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class StudentReadScreen extends StatefulWidget {
  const StudentReadScreen({super.key});

  @override
  State<StudentReadScreen> createState() => _StudentReadScreenState();
}

class _StudentReadScreenState extends State<StudentReadScreen> {
  StudentControllor studentControllor = Get.put(
    StudentControllor(),
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
                  text: "Student List",
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    studentControllor.std = "1";
                    listOfStudent(std: "1");
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                ),
                DropdownButton(
                  value: studentControllor.std,
                  items: [
                    DropdownMenuItem(
                      value: "1",
                      child: Text(
                        "Std 1",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text(
                        "Std 2",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "3",
                      child: Text(
                        "Std 3",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "4",
                      child: Text(
                        "Std 4",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "5",
                      child: Text(
                        "Std 5",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "6",
                      child: Text(
                        "Std 6",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "7",
                      child: Text(
                        "Std 7",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "8",
                      child: Text(
                        "Std 8",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "9",
                      child: Text(
                        "Std 9",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "10",
                      child: Text(
                        "Std 10",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    studentControllor.std = value!;
                    setState(() {});
                  },
                ),
                DropdownButton(
                  value: studentControllor.language,
                  items: [
                    DropdownMenuItem(
                      value: "gujarati",
                      child: Text(
                        "Gujarati",
                      ),
                    ),
                    DropdownMenuItem(
                      value: "english",
                      child: Text(
                        "English",
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(height: 10.sp),
            Expanded(
              child: listOfStudent(std: studentControllor.std),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            StudentModel s1 = StudentModel(
              check: 0,
            );
            Get.toNamed(
              '/studentAdd',
              arguments: s1,
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

  Widget listOfStudent({
    String? std,
  }) {
    return FutureBuilder(
      future: studentControllor.readStudent(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "${snapshot.error}",
              style: GoogleFonts.archivo(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          studentControllor.studentList = snapshot.data!;
          if (std!.compareTo("1") != 1) {
            return ListView.builder(
              itemCount: studentControllor.studentList.length,
              itemBuilder: (context, index) {
                return studentControllor.studentList[index].std
                            .compareTo("1") !=
                        0
                    ? Container()
                    : Padding(
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
                                      "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Std :- ${studentControllor.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                          check: 1,
                                          firstName: studentControllor
                                              .studentList[index].firstName,
                                          lastName: studentControllor
                                              .studentList[index].lastName,
                                          fatherName: studentControllor
                                              .studentList[index].fatherName,
                                          std: studentControllor
                                              .studentList[index].std,
                                          mobileNumber: studentControllor
                                              .studentList[index].mobileNumber,
                                        );

                                        Get.toNamed(
                                          '/studentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                        );

                                        print(studentControllor
                                            .studentList[index].id);
                                        studentControllor.deleteStudent(
                                          s1: s1,
                                        );
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
          } else if (std.compareTo("2") != 1) {
            return ListView.builder(
              itemCount: studentControllor.studentList.length,
              itemBuilder: (context, index) {
                return studentControllor.studentList[index].std
                            .compareTo("2") !=
                        0
                    ? Container()
                    : Padding(
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
                                      "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Std :- ${studentControllor.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                          check: 1,
                                          firstName: studentControllor
                                              .studentList[index].firstName,
                                          lastName: studentControllor
                                              .studentList[index].lastName,
                                          fatherName: studentControllor
                                              .studentList[index].fatherName,
                                          std: studentControllor
                                              .studentList[index].std,
                                          mobileNumber: studentControllor
                                              .studentList[index].mobileNumber,
                                        );

                                        Get.toNamed(
                                          '/studentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                        );

                                        print(studentControllor
                                            .studentList[index].id);
                                        studentControllor.deleteStudent(
                                          s1: s1,
                                        );
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
          } else if (std.compareTo("3") != 1) {
            return ListView.builder(
              itemCount: studentControllor.studentList.length,
              itemBuilder: (context, index) {
                return studentControllor.studentList[index].std
                            .compareTo("3") !=
                        0
                    ? Container()
                    : Padding(
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
                                      "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Std :- ${studentControllor.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                          check: 1,
                                          firstName: studentControllor
                                              .studentList[index].firstName,
                                          lastName: studentControllor
                                              .studentList[index].lastName,
                                          fatherName: studentControllor
                                              .studentList[index].fatherName,
                                          std: studentControllor
                                              .studentList[index].std,
                                          mobileNumber: studentControllor
                                              .studentList[index].mobileNumber,
                                        );

                                        Get.toNamed(
                                          '/studentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                        );

                                        print(studentControllor
                                            .studentList[index].id);
                                        studentControllor.deleteStudent(
                                          s1: s1,
                                        );
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
          } else if (std.compareTo("4") != 1) {
            return ListView.builder(
              itemCount: studentControllor.studentList.length,
              itemBuilder: (context, index) {
                return studentControllor.studentList[index].std
                            .compareTo("4") !=
                        0
                    ? Container()
                    : Padding(
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
                                      "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Std :- ${studentControllor.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                          check: 1,
                                          firstName: studentControllor
                                              .studentList[index].firstName,
                                          lastName: studentControllor
                                              .studentList[index].lastName,
                                          fatherName: studentControllor
                                              .studentList[index].fatherName,
                                          std: studentControllor
                                              .studentList[index].std,
                                          mobileNumber: studentControllor
                                              .studentList[index].mobileNumber,
                                        );

                                        Get.toNamed(
                                          '/studentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                        );

                                        print(studentControllor
                                            .studentList[index].id);
                                        studentControllor.deleteStudent(
                                          s1: s1,
                                        );
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
          } else if (std.compareTo("5") != 1) {
            return ListView.builder(
              itemCount: studentControllor.studentList.length,
              itemBuilder: (context, index) {
                return studentControllor.studentList[index].std
                            .compareTo("5") !=
                        0
                    ? Container()
                    : Padding(
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
                                      "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Std :- ${studentControllor.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                          check: 1,
                                          firstName: studentControllor
                                              .studentList[index].firstName,
                                          lastName: studentControllor
                                              .studentList[index].lastName,
                                          fatherName: studentControllor
                                              .studentList[index].fatherName,
                                          std: studentControllor
                                              .studentList[index].std,
                                          mobileNumber: studentControllor
                                              .studentList[index].mobileNumber,
                                        );

                                        Get.toNamed(
                                          '/studentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                        );

                                        print(studentControllor
                                            .studentList[index].id);
                                        studentControllor.deleteStudent(
                                          s1: s1,
                                        );
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
          } else if (std.compareTo("6") != 1) {
            return ListView.builder(
              itemCount: studentControllor.studentList.length,
              itemBuilder: (context, index) {
                return studentControllor.studentList[index].std
                            .compareTo("6") !=
                        0
                    ? Container()
                    : Padding(
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
                                      "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Std :- ${studentControllor.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                          check: 1,
                                          firstName: studentControllor
                                              .studentList[index].firstName,
                                          lastName: studentControllor
                                              .studentList[index].lastName,
                                          fatherName: studentControllor
                                              .studentList[index].fatherName,
                                          std: studentControllor
                                              .studentList[index].std,
                                          mobileNumber: studentControllor
                                              .studentList[index].mobileNumber,
                                        );

                                        Get.toNamed(
                                          '/studentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                        );

                                        print(studentControllor
                                            .studentList[index].id);
                                        studentControllor.deleteStudent(
                                          s1: s1,
                                        );
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
          } else if (std.compareTo("7") != 1) {
            return ListView.builder(
              itemCount: studentControllor.studentList.length,
              itemBuilder: (context, index) {
                return studentControllor.studentList[index].std
                            .compareTo("7") !=
                        0
                    ? Container()
                    : Padding(
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
                                      "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Std :- ${studentControllor.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                          check: 1,
                                          firstName: studentControllor
                                              .studentList[index].firstName,
                                          lastName: studentControllor
                                              .studentList[index].lastName,
                                          fatherName: studentControllor
                                              .studentList[index].fatherName,
                                          std: studentControllor
                                              .studentList[index].std,
                                          mobileNumber: studentControllor
                                              .studentList[index].mobileNumber,
                                        );

                                        Get.toNamed(
                                          '/studentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                        );

                                        print(studentControllor
                                            .studentList[index].id);
                                        studentControllor.deleteStudent(
                                          s1: s1,
                                        );
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
          } else if (std.compareTo("8") != 1) {
            return ListView.builder(
              itemCount: studentControllor.studentList.length,
              itemBuilder: (context, index) {
                return studentControllor.studentList[index].std
                            .compareTo("8") !=
                        0
                    ? Container()
                    : Padding(
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
                                      "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Std :- ${studentControllor.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                          check: 1,
                                          firstName: studentControllor
                                              .studentList[index].firstName,
                                          lastName: studentControllor
                                              .studentList[index].lastName,
                                          fatherName: studentControllor
                                              .studentList[index].fatherName,
                                          std: studentControllor
                                              .studentList[index].std,
                                          mobileNumber: studentControllor
                                              .studentList[index].mobileNumber,
                                        );

                                        Get.toNamed(
                                          '/studentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                        );

                                        print(studentControllor
                                            .studentList[index].id);
                                        studentControllor.deleteStudent(
                                          s1: s1,
                                        );
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
          } else if (std.compareTo("9") != 1) {
            return ListView.builder(
              itemCount: studentControllor.studentList.length,
              itemBuilder: (context, index) {
                return studentControllor.studentList[index].std
                            .compareTo("9") !=
                        0
                    ? Container()
                    : Padding(
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
                                      "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Std :- ${studentControllor.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                          check: 1,
                                          firstName: studentControllor
                                              .studentList[index].firstName,
                                          lastName: studentControllor
                                              .studentList[index].lastName,
                                          fatherName: studentControllor
                                              .studentList[index].fatherName,
                                          std: studentControllor
                                              .studentList[index].std,
                                          mobileNumber: studentControllor
                                              .studentList[index].mobileNumber,
                                        );

                                        Get.toNamed(
                                          '/studentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                        );

                                        print(studentControllor
                                            .studentList[index].id);
                                        studentControllor.deleteStudent(
                                          s1: s1,
                                        );
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
          } else if (std.compareTo("10") != 1) {
            return ListView.builder(
              itemCount: studentControllor.studentList.length,
              itemBuilder: (context, index) {
                return studentControllor.studentList[index].std
                            .compareTo("10") !=
                        0
                    ? Container()
                    : Padding(
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
                                      "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Std :- ${studentControllor.studentList[index].std}",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                          check: 1,
                                          firstName: studentControllor
                                              .studentList[index].firstName,
                                          lastName: studentControllor
                                              .studentList[index].lastName,
                                          fatherName: studentControllor
                                              .studentList[index].fatherName,
                                          std: studentControllor
                                              .studentList[index].std,
                                          mobileNumber: studentControllor
                                              .studentList[index].mobileNumber,
                                        );

                                        Get.toNamed(
                                          '/studentAdd',
                                          arguments: s1,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        StudentModel s1 = StudentModel(
                                          id: studentControllor
                                              .studentList[index].id,
                                        );

                                        print(studentControllor
                                            .studentList[index].id);
                                        studentControllor.deleteStudent(
                                          s1: s1,
                                        );
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
          } else {
            return Text(
              "Bad choice",
              style: GoogleFonts.archivo(),
            );
          }
        }
        return Center(
          child: Text(
            "Work In Process",
            style: GoogleFonts.archivo(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
