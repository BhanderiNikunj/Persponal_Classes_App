import 'package:classes_app/Admin/AdminResult/Controllor/AdminResultControllor.dart';
import 'package:classes_app/Admin/AdminResult/Model/AdminResultModel.dart';
import 'package:classes_app/Admin/AdminResult/Model/AdminStudentUidModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdminAddStudentResultScreen extends StatefulWidget {
  const AdminAddStudentResultScreen({super.key});

  @override
  State<AdminAddStudentResultScreen> createState() =>
      _AdminAddStudentResultScreenState();
}

class _AdminAddStudentResultScreenState
    extends State<AdminAddStudentResultScreen> {
  AdminResultControllor adminResultControllor = Get.put(
    AdminResultControllor(),
  );

  AdminStudentUidModel a1 = Get.arguments;

  @override
  Widget build(BuildContext context) {

    print(a1.std);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                controller: adminResultControllor.txtMath,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Ex. 28",
                  label: Text(
                    "Enter Math Mark",
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                controller: adminResultControllor.txtSS,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Ex. 28",
                  label: Text(
                    "Enter S.S. Mark",
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                controller: adminResultControllor.txtEng,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Ex. 28",
                  label: Text(
                    "Enter Eng Mark",
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                controller: adminResultControllor.txtSci,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Ex. 28",
                  label: Text(
                    "Enter Sci Mark",
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              InkWell(
                onTap: () {
                  AdminResultModel r1 = AdminResultModel(
                    uid: a1.uid,
                    english: int.parse(adminResultControllor.txtEng.text),
                    math: int.parse(adminResultControllor.txtMath.text),
                    science: int.parse(adminResultControllor.txtSci.text),
                    socialScience: int.parse(adminResultControllor.txtSS.text),
                    total: int.parse(adminResultControllor.txtEng.text) + int.parse(adminResultControllor.txtMath.text) + int.parse(adminResultControllor.txtSci.text) + int.parse(adminResultControllor.txtSS.text)
                  );
                  // print(r1.total);
                  adminResultControllor.insertHomework(
                    r1: r1,
                  );
                },
                child: allButton(
                  string: "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
