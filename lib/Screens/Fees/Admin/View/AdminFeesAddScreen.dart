import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminFeesAddScreen extends StatefulWidget {
  const AdminFeesAddScreen({super.key});

  @override
  State<AdminFeesAddScreen> createState() => _AdminFeesAddScreenState();
}

class _AdminFeesAddScreenState extends State<AdminFeesAddScreen> {
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
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  TextField(
                    // controller: studentHomeWorkController.txtTitle,
                    style: GoogleFonts.archivo(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Ex. Total Fees",
                      hintStyle: GoogleFonts.archivo(
                        fontWeight: FontWeight.bold,
                      ),
                      labelText: "Enter Total Fees",
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
                    // controller: studentHomeWorkController.txtTitle,
                    style: GoogleFonts.archivo(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Ex. Paid Fees",
                      hintStyle: GoogleFonts.archivo(
                        fontWeight: FontWeight.bold,
                      ),
                      labelText: "Enter Paid Fees",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
