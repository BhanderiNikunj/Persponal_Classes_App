import 'package:classes_app/Controllors/FeesControllor.dart';
import 'package:classes_app/Models/FeesModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FeesAddScreen extends StatefulWidget {
  const FeesAddScreen({super.key});

  @override
  State<FeesAddScreen> createState() => _FeesAddScreenState();
}

class _FeesAddScreenState extends State<FeesAddScreen> {
  FeesControllor feesControllor = Get.put(
    FeesControllor(),
  );

  FeesModel feesModel = Get.arguments;

  @override
  void initState() {
    super.initState();

    if (feesModel.check == 1) {
      feesControllor.txtStd = TextEditingController(text: "${feesModel.std!}");
      feesControllor.txtName =
          TextEditingController(text: "${feesModel.firstName!}");
      feesControllor.txtTotalFees =
          TextEditingController(text: "${feesModel.totalFees!}");
      feesControllor.txtPaidFees =
          TextEditingController(text: "${feesModel.paidFees!}");
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
                  text: "Student Fees Add",
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
                      if (feesModel.check == 1) {
                        FeesModel f1 = FeesModel(
                          uid: "-",
                          id: feesModel.id,
                          std: feesControllor.txtStd.text,
                          totalFees: feesControllor.txtPaidFees.text,
                          paidFees: feesControllor.txtPaidFees.text,
                          firstName: feesControllor.txtName.text,
                        );

                        bool check = await feesControllor.updateFees(
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
                      } else {
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
                      }
                    },
                    child: allButton(
                      string: feesModel.check == 1 ? "Update" : "Add",
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
