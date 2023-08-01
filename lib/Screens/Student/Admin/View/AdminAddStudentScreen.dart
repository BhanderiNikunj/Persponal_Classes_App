import 'package:classes_app/Models/StudentModel.dart';
import 'package:classes_app/Screens/Student/Admin/Controller/StudentController.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminAddStudentScreen extends StatefulWidget {
  const AdminAddStudentScreen({super.key});

  @override
  State<AdminAddStudentScreen> createState() => _AdminAddStudentScreenState();
}

class _AdminAddStudentScreenState extends State<AdminAddStudentScreen> {
  StudentController studentController = Get.put(
    StudentController(),
  );

  StudentModel studentModel = Get.arguments;

  @override
  void initState() {
    super.initState();

    if (studentModel.checkUpdate == 1) {
      studentController.txtLName =
          TextEditingController(text: "${studentModel.l_name}");
      studentController.txtFName =
          TextEditingController(text: "${studentModel.f_name}");
      studentController.txtFaName =
          TextEditingController(text: "${studentModel.father_name}");
      studentController.txtMobile =
          TextEditingController(text: "${studentModel.mobile_no}");
      studentController.txtStd =
          TextEditingController(text: "${studentModel.std}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Add Student Detail",
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
            SizedBox(height: 20.sp),
            TextField(
              controller: studentController.txtFName,
              style: GoogleFonts.archivo(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Ex. user",
                hintStyle: GoogleFonts.archivo(
                  fontWeight: FontWeight.bold,
                ),
                labelText: "Enter Student Name",
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
            SizedBox(height: 10.sp),
            TextField(
              controller: studentController.txtLName,
              style: GoogleFonts.archivo(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Ex. user",
                hintStyle: GoogleFonts.archivo(
                  fontWeight: FontWeight.bold,
                ),
                labelText: "Enter Student Surname",
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
            SizedBox(height: 10.sp),
            TextField(
              controller: studentController.txtFaName,
              style: GoogleFonts.archivo(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Ex. user",
                hintStyle: GoogleFonts.archivo(
                  fontWeight: FontWeight.bold,
                ),
                labelText: "Enter Student Father Name",
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
            SizedBox(height: 10.sp),
            TextField(
              controller: studentController.txtMobile,
              style: GoogleFonts.archivo(
                color: Colors.black,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Ex. 1234567890",
                hintStyle: GoogleFonts.archivo(
                  fontWeight: FontWeight.bold,
                ),
                labelText: "Enter Mobile No.",
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
            SizedBox(height: 10.sp),
            TextField(
              controller: studentController.txtStd,
              style: GoogleFonts.archivo(
                color: Colors.black,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Ex. 10",
                hintStyle: GoogleFonts.archivo(
                  fontWeight: FontWeight.bold,
                ),
                labelText: "Enter Student Std.",
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
            SizedBox(height: 20.sp),
            InkWell(
              onTap: () {
                if (studentModel.checkUpdate == 1) {
                  StudentModel s1 = StudentModel(
                    mobile_no: studentController.txtMobile.text,
                    std: int.parse("${studentController.txtStd.text}"),
                    l_name: studentController.txtLName.text,
                    f_name: studentController.txtFName.text,
                    father_name: studentController.txtFaName.text,
                    key: studentModel.key,
                  );

                  studentController.updateStudent(
                    s1: s1,
                  );

                  studentController.txtLName.clear();
                  studentController.txtStd.clear();
                  studentController.txtFName.clear();
                  studentController.txtMobile.clear();
                  studentController.txtFaName.clear();

                  Get.back();
                } else {
                  StudentModel s1 = StudentModel(
                    mobile_no: studentController.txtMobile.text,
                    std: int.parse("${studentController.txtStd.text}"),
                    l_name: studentController.txtLName.text,
                    f_name: studentController.txtFName.text,
                    father_name: studentController.txtFaName.text,
                  );

                  studentController.insertStudent(
                    s1: s1,
                  );

                  studentController.txtLName.clear();
                  studentController.txtStd.clear();
                  studentController.txtFName.clear();
                  studentController.txtMobile.clear();
                  studentController.txtFaName.clear();

                  Get.back();
                }
              },
              child: allButton(
                string: studentModel.checkUpdate == 1 ? "Update" : "Add",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
