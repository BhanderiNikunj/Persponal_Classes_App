import 'package:classes_app/Admin/AdminResult/Controllor/AdminResultControllor.dart';
import 'package:classes_app/Admin/AdminResult/Model/AdminResultModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
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

  AdminResultModel r1 = Get.arguments;

  @override
  void initState() {
    super.initState();

    if (r1.checkUpdate == 1) {
      adminResultControllor.txtDate =
          TextEditingController(text: "${r1.monthNumber}");
      adminResultControllor.txtEng =
          TextEditingController(text: "${r1.english}");
      adminResultControllor.txtMath = TextEditingController(text: "${r1.math}");
      adminResultControllor.txtSci =
          TextEditingController(text: "${r1.science}");
      adminResultControllor.txtSS =
          TextEditingController(text: "${r1.socialScience}");
    }
  }

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 10.sp),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                controller: adminResultControllor.txtDate,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () async {
                      adminResultControllor.d1 =
                          await DatePicker.showSimpleDatePicker(
                        context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        dateFormat: "dd-MMMM-yyyy",
                        locale: DateTimePickerLocale.en_us,
                      );

                      setState(() {
                        adminResultControllor.txtDate = TextEditingController(
                            text:
                                "${adminResultControllor.d1!.day} / ${adminResultControllor.d1!.month} / ${adminResultControllor.d1!.year}");
                      });
                    },
                    icon: Icon(
                      Icons.date_range,
                    ),
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
                  if (r1.checkUpdate == 1) {
                    int totalOut =
                        int.parse(adminResultControllor.txtEng.text) +
                            int.parse(adminResultControllor.txtMath.text) +
                            int.parse(adminResultControllor.txtSci.text) +
                            int.parse(adminResultControllor.txtSS.text);

                    AdminResultModel a1 = AdminResultModel(
                      english: int.parse(adminResultControllor.txtEng.text),
                      math: int.parse(adminResultControllor.txtMath.text),
                      science: int.parse(adminResultControllor.txtSci.text),
                      socialScience:
                          int.parse(adminResultControllor.txtSS.text),
                      totalOutOf: totalOut,
                      total: 120,
                      monthNumber: adminResultControllor.txtDate.text,
                      std: r1.std,
                      uid: r1.uid,
                      name: r1.name,
                      mobile: r1.mobile,
                      key: r1.key,
                    );

                    adminResultControllor.updateResult(
                      r1: a1,
                    );

                    Get.back();
                  } else {
                    int totalOut =
                        int.parse(adminResultControllor.txtEng.text) +
                            int.parse(adminResultControllor.txtMath.text) +
                            int.parse(adminResultControllor.txtSci.text) +
                            int.parse(adminResultControllor.txtSS.text);

                    AdminResultModel a1 = AdminResultModel(
                      english: int.parse(adminResultControllor.txtEng.text),
                      math: int.parse(adminResultControllor.txtMath.text),
                      science: int.parse(adminResultControllor.txtSci.text),
                      socialScience:
                          int.parse(adminResultControllor.txtSS.text),
                      totalOutOf: totalOut,
                      total: 120,
                      monthNumber: adminResultControllor.txtDate.text,
                      std: r1.std,
                      uid: r1.uid,
                      name: r1.name,
                      mobile: r1.mobile,
                    );

                    adminResultControllor.insertResult(
                      r1: a1,
                    );

                    Get.back();
                  }
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
