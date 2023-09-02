import 'package:classes_app/Controllors/StudentControllor.dart';
import 'package:classes_app/Models/StudentModel.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class StudentAddScreen extends StatefulWidget {
  const StudentAddScreen({super.key});

  @override
  State<StudentAddScreen> createState() => _StudentAddScreenState();
}

class _StudentAddScreenState extends State<StudentAddScreen> {
  StudentControllor studentControllor = Get.put(
    StudentControllor(),
  );

  StudentModel studentModel = Get.arguments;

  @override
  void initState() {
    super.initState();

    AdsHelper.adsHelper.loadBannerAd();

    if (studentModel.check == 1) {
      studentControllor.txtStd =
          TextEditingController(text: "${studentModel.std}");
      studentControllor.txtMobileNo =
          TextEditingController(text: "${studentModel.mobileNumber}");
      studentControllor.txtFName =
          TextEditingController(text: "${studentModel.firstName}");
      studentControllor.txtLName =
          TextEditingController(text: "${studentModel.lastName}");
      studentControllor.txtFaName =
          TextEditingController(text: "${studentModel.fatherName}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  allAppBar(
                    text: "Student Add",
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
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  children: [
                    TextField(
                      controller: studentControllor.txtFName,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. user",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Student Name",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: studentControllor.txtLName,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        hintText: "Ex. user",
                        hintStyle: GoogleFonts.archivo(),
                        filled: true,
                        fillColor: Color(0x27e85720),
                        label: Text(
                          "Student Last Name",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: studentControllor.txtFaName,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        hintText: "Ex. user",
                        hintStyle: GoogleFonts.archivo(),
                        filled: true,
                        fillColor: Color(0x27e85720),
                        label: Text(
                          "Student Father Name",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: studentControllor.txtMobileNo,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        hintText: "Ex. user",
                        hintStyle: GoogleFonts.archivo(),
                        filled: true,
                        fillColor: Color(0x27e85720),
                        label: Text(
                          "Student Mobile No.",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: studentControllor.txtStd,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        hintText: "Ex. 10",
                        hintStyle: GoogleFonts.archivo(),
                        filled: true,
                        fillColor: Color(0x27e85720),
                        label: Text(
                          "Student Std",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    InkWell(
                      onTap: () async {
                        if (studentModel.check == 1) {
                          StudentModel s1 = StudentModel(
                            id: studentModel.id,
                            firstName: studentControllor.txtFName.text,
                            lastName: studentControllor.txtLName.text,
                            fatherName: studentControllor.txtFaName.text,
                            std: studentControllor.txtStd.text,
                            mobileNumber: studentControllor.txtMobileNo.text,
                          );

                          bool check = await studentControllor.updateStudent(
                            s1: s1,
                          );

                          if (check) {
                            studentControllor.txtLName.clear();
                            studentControllor.txtFName.clear();
                            studentControllor.txtFaName.clear();
                            studentControllor.txtMobileNo.clear();
                            studentControllor.txtStd.clear();
                            Get.back();
                            Get.snackbar("Success", "");
                          } else {
                            // Get.back();
                            Get.snackbar("Failed", "");
                          }
                        } else {
                          StudentModel s1 = StudentModel(
                            id: "0",
                            firstName: studentControllor.txtFName.text,
                            lastName: studentControllor.txtLName.text,
                            fatherName: studentControllor.txtFaName.text,
                            std: studentControllor.txtStd.text,
                            mobileNumber: studentControllor.txtMobileNo.text,
                          );

                          bool check = await studentControllor.insertStudent(
                            s1: s1,
                          );

                          if (check) {
                            studentControllor.txtLName.clear();
                            studentControllor.txtFName.clear();
                            studentControllor.txtFaName.clear();
                            studentControllor.txtMobileNo.clear();
                            studentControllor.txtStd.clear();
                            Get.back();
                            Get.snackbar("Success", "");
                          } else {
                            // Get.back();
                            Get.snackbar("Failed", "");
                          }
                        }
                      },
                      child: allButton(
                        string: studentModel.check == 1 ? "Update" : "Add",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 50.sp,
          child: AdWidget(
            ad: AdsHelper.adsHelper.bannerAd!,
          ),
        ),
      ),
    );
  }
}
