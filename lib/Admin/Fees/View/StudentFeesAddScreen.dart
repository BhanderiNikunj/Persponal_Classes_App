import 'package:classes_app/Controllors/FeesControllor.dart';
import 'package:classes_app/Models/FeesModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class StudentFeesAddScreen extends StatefulWidget {
  const StudentFeesAddScreen({super.key});

  @override
  State<StudentFeesAddScreen> createState() => _StudentFeesAddScreenState();
}

class _StudentFeesAddScreenState extends State<StudentFeesAddScreen> {
  FeesControllor feesControllor = Get.put(
    FeesControllor(),
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
                  text: "Student Fees Add",
                ),
                Container(
                  height: 50.sp,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.offAndToNamed(
                            '/studentRead',
                          );
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
                    controller: feesControllor.txtName,
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
                    keyboardType: TextInputType.number,
                    controller: feesControllor.txtStd,
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
                  SizedBox(height: 10.sp),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: feesControllor.txtTotalFees,
                    style: GoogleFonts.archivo(),
                    cursorColor: Color(0xffe85720),
                    cursorWidth: 1,
                    cursorRadius: Radius.circular(50),
                    decoration: InputDecoration(
                      hintText: "Ex. 10000",
                      hintStyle: GoogleFonts.archivo(),
                      filled: true,
                      fillColor: Color(0x27e85720),
                      label: Text(
                        "Student Total Fees",
                        style: GoogleFonts.archivo(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: feesControllor.txtPaidFees,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.archivo(),
                    cursorColor: Color(0xffe85720),
                    cursorWidth: 1,
                    cursorRadius: Radius.circular(50),
                    decoration: InputDecoration(
                      hintText: "Ex. 5000",
                      hintStyle: GoogleFonts.archivo(),
                      filled: true,
                      fillColor: Color(0x27e85720),
                      label: Text(
                        "Student Paid Fees",
                        style: GoogleFonts.archivo(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  InkWell(
                    onTap: () async {
                      FeesModel f1 = FeesModel(
                        uid: "-",
                        std: feesControllor.txtStd.text,
                        totalFees: feesControllor.txtPaidFees.text,
                        paidFees: feesControllor.txtPaidFees.text,
                        firstName: feesControllor.txtName.text,
                      );

                      bool check = await feesControllor.insertFees(
                        f1: f1,
                      );

                      if (check) {
                        Get.back();
                      } else {
                        Get.snackbar(
                          "Failed",
                          "",
                        );
                      }
                    },
                    child: allButton(
                      string: "Add",
                    ),
                  ),
                  // InkWell(
                  //   onTap: () async {
                  //     if (studentModel.check == 1) {
                  //       StudentModel s1 = StudentModel(
                  //         id: studentModel.id,
                  //         firstName: studentControllor.txtFName.text,
                  //         lastName: studentControllor.txtLName.text,
                  //         fatherName: studentControllor.txtFaName.text,
                  //         std: studentControllor.txtStd.text,
                  //         mobileNumber: studentControllor.txtMobileNo.text,
                  //       );
                  //
                  //       bool check = await studentControllor.updateStudent(
                  //         s1: s1,
                  //       );
                  //
                  //       if (check) {
                  //         studentControllor.txtLName.clear();
                  //         studentControllor.txtFName.clear();
                  //         studentControllor.txtFaName.clear();
                  //         studentControllor.txtMobileNo.clear();
                  //         studentControllor.txtStd.clear();
                  //         Get.back();
                  //         Get.snackbar("Success", "");
                  //       } else {
                  //         // Get.back();
                  //         Get.snackbar("Failed", "");
                  //       }
                  //     } else {
                  //       StudentModel s1 = StudentModel(
                  //         id: "0",
                  //         firstName: studentControllor.txtFName.text,
                  //         lastName: studentControllor.txtLName.text,
                  //         fatherName: studentControllor.txtFaName.text,
                  //         std: studentControllor.txtStd.text,
                  //         mobileNumber: studentControllor.txtMobileNo.text,
                  //       );
                  //
                  //       bool check = await studentControllor.insertStudent(
                  //         s1: s1,
                  //       );
                  //
                  //       if (check) {
                  //         studentControllor.txtLName.clear();
                  //         studentControllor.txtFName.clear();
                  //         studentControllor.txtFaName.clear();
                  //         studentControllor.txtMobileNo.clear();
                  //         studentControllor.txtStd.clear();
                  //         Get.back();
                  //         Get.snackbar("Success", "");
                  //       } else {
                  //         // Get.back();
                  //         Get.snackbar("Failed", "");
                  //       }
                  //     }
                  //   },
                  //   child: allButton(
                  //     string: "Add",
                  //     // string: studentModel.check == 1 ? "Update" : "Add",
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
