import 'package:classes_app/Controllors/AddDetailContorllor.dart';
import 'package:classes_app/Models/CheckUserModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({Key? key}) : super(key: key);

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  AddDetailContorllor addDetailContorllor = Get.put(
    AddDetailContorllor(),
  );

  String email = Get.arguments;

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
                    text: "Add Your Detail",
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  children: [
                    TextField(
                      controller: addDetailContorllor.txtFName,
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
                          "Your First Name",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: addDetailContorllor.txtLName,
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
                          "Student Last Name",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: addDetailContorllor.txtFaName,
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
                          "Student Father Name",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: addDetailContorllor.txtStd,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. 10",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Student Std",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    InkWell(
                      onTap: () async {
                        CheckUserModel c1 = CheckUserModel(
                          chechAdmin: "0",
                          fatherName: addDetailContorllor.txtFaName.text,
                          firstName: addDetailContorllor.txtFName.text,
                          std: addDetailContorllor.txtStd.text,
                          lastName: addDetailContorllor.txtLName.text,
                          emailId: email,
                        );
                        bool check = await addDetailContorllor.insertUserDetail(
                          c1: c1,
                        );
                        if (check) {
                          Get.offAndToNamed('/userHome');
                          Get.snackbar(
                            "Data Add Success Fully",
                            "",
                          );
                        }
                      },
                      child: allButton(
                        string: "Add",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
