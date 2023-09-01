import 'package:classes_app/Controllors/ResultControllor.dart';
import 'package:classes_app/Models/ResultModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ResultAddScreen extends StatefulWidget {
  const ResultAddScreen({super.key});

  @override
  State<ResultAddScreen> createState() => _ResultAddScreenState();
}

class _ResultAddScreenState extends State<ResultAddScreen> {
  ResultModel resultModel = Get.arguments;

  ResultControllor resultControllor = Get.put(
    ResultControllor(),
  );

  @override
  void initState() {
    super.initState();

    if (resultModel.check == 1) {
      resultControllor.txtTotal =
          TextEditingController(text: "${resultModel.total}");
      resultControllor.txtEnglish =
          TextEditingController(text: "${resultModel.english}");
      resultControllor.txtSanskrit =
          TextEditingController(text: "${resultModel.sanskrit}");
      resultControllor.txtGujarati =
          TextEditingController(text: "${resultModel.gujarati}");
      resultControllor.txtHindi =
          TextEditingController(text: "${resultModel.hindi}");
      resultControllor.txtMath =
          TextEditingController(text: "${resultModel.math}");
      resultControllor.txtScience =
          TextEditingController(text: "${resultModel.science}");
      resultControllor.txtSocialScience =
          TextEditingController(text: "${resultModel.socialScience}");
    } else {
      resultControllor.txtName =
          TextEditingController(text: "${resultModel.firstName}");
      resultControllor.txtStd =
          TextEditingController(text: "${resultModel.std}");
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
                    text:
                        resultModel.check == 1 ? "Result Update" : "Result Add",
                  ),
                  Container(
                    height: 50.sp,
                    alignment: Alignment.centerLeft,
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
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  children: [
                    TextField(
                      controller: resultControllor.txtName,
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
                      controller: resultControllor.txtStd,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. Std",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Student Std",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: resultControllor.txtMath,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. Math's Mark",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Enter Math's Mark",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: resultControllor.txtSocialScience,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. S.S. Mark",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Enter S.S. Mark",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: resultControllor.txtScience,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. Science Mark",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Enter Science Mark",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: resultControllor.txtEnglish,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. English Mark",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Enter English Mark",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: resultControllor.txtGujarati,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. Gujarati Mark",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Enter Gujarati Mark",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: resultControllor.txtHindi,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. Hindi Mark",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Enter Hindi Mark",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: resultControllor.txtSanskrit,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. Sanskrit Mark",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Enter Sanskrit Mark",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: resultControllor.txtTotal,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. Total Mark",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Enter Total Mark",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    InkWell(
                      onTap: () async {
                        if (resultModel.check == 1) {
                          ResultModel r1 = ResultModel();
                          bool check = await resultControllor.updateResult(
                            r1: r1,
                          );

                          if (check) {
                            Get.snackbar(
                              "Update Success Fully",
                              "",
                            );
                            Get.back();
                          } else {
                            Get.snackbar(
                              "Update Un Success Fully",
                              "",
                            );
                          }
                        } else {
                          ResultModel r1 = ResultModel(
                            total: resultControllor.txtTotal.text,
                            math: resultControllor.txtMath.text,
                            english: resultControllor.txtEnglish.text,
                            gujarati: resultControllor.txtGujarati.text,
                            sanskrit: resultControllor.txtSanskrit.text,
                            hindi: resultControllor.txtHindi.text,
                            science: resultControllor.txtScience.text,
                            socialScience:
                                resultControllor.txtSocialScience.text,
                            std: resultControllor.txtStd.text,
                            firstName: resultControllor.txtName.text,
                            uid: resultModel.uid,
                          );
                          bool check = await resultControllor.insertResult(
                            r1: r1,
                          );

                          if (check) {
                            Get.snackbar(
                              "Insert Success Fully",
                              "",
                            );
                            resultControllor.txtTotal.clear();
                            resultControllor.txtMath.clear();
                            resultControllor.txtEnglish.clear();
                            resultControllor.txtGujarati.clear();
                            resultControllor.txtSanskrit.clear();
                            resultControllor.txtHindi.clear();
                            resultControllor.txtScience.clear();
                            resultControllor.txtSocialScience.clear();
                            resultControllor.txtStd.clear();
                            resultControllor.txtName.clear();
                            Get.back();
                          } else {
                            Get.snackbar(
                              "Insert Un Success Fully",
                              "",
                            );
                          }
                        }
                      },
                      child: allButton(
                        string: resultModel.check == 1 ? "Update" : "Add",
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
