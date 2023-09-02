import 'package:classes_app/Controllors/LeaveControllor.dart';
import 'package:classes_app/Models/LeaveModel.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class LeaveAddScreen extends StatefulWidget {
  const LeaveAddScreen({super.key});

  @override
  State<LeaveAddScreen> createState() => _LeaveAddScreenState();
}

class _LeaveAddScreenState extends State<LeaveAddScreen> {
  LeaveControllor leaveControllor = Get.put(
    LeaveControllor(),
  );

  LeaveModel leaveModel = Get.arguments;

  @override
  void initState() {
    super.initState();

    AdsHelper.adsHelper.loadBannerAd();

    if (leaveModel.check == 1) {
      leaveControllor.txtName =
          TextEditingController(text: "${leaveModel.firstName}");
      leaveControllor.txtStd = TextEditingController(text: "${leaveModel.std}");
      leaveControllor.txtResion =
          TextEditingController(text: "${leaveModel.resion}");
      leaveControllor.txtDateFrom =
          TextEditingController(text: "${leaveModel.dateForm}");
      leaveControllor.txtDateTo =
          TextEditingController(text: "${leaveModel.dateTo}");
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
                    text: "Leave Add",
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
                      controller: leaveControllor.txtName,
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
                      controller: leaveControllor.txtStd,
                      keyboardType: TextInputType.number,
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
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: leaveControllor.txtResion,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. example",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Leave Resion",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: leaveControllor.txtDateFrom,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () async {
                            DateTime? d1 = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                            );
                          },
                          icon: Icon(
                            Icons.date_range,
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. 20 / 12 / 2023",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Leave date Form",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: leaveControllor.txtDateTo,
                      style: GoogleFonts.archivo(),
                      cursorColor: Color(0xffe85720),
                      cursorWidth: 1,
                      cursorRadius: Radius.circular(50),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () async {
                            DateTime? d1 = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                            );
                          },
                          icon: Icon(
                            Icons.date_range,
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0x27e85720),
                        hintText: "Ex. 20 / 12 / 2023",
                        hintStyle: GoogleFonts.archivo(),
                        label: Text(
                          "Leave date To",
                          style: GoogleFonts.archivo(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    InkWell(
                      onTap: () async {
                        if (leaveModel.check == 1) {
                          LeaveModel l1 = LeaveModel(
                            id: leaveModel.id,
                            firstName: leaveControllor.txtName.text,
                            std: leaveControllor.txtStd.text,
                            resion: leaveControllor.txtResion.text,
                            dateTo: leaveControllor.txtDateTo.text,
                            dateForm: leaveControllor.txtDateFrom.text,
                          );
                          bool check = await leaveControllor.updateLeave(
                            l1: l1,
                          );

                          if (check) {
                            Get.back();
                            Get.snackbar(
                              "Add Success Fully",
                              "",
                            );
                            leaveControllor.txtResion.clear();
                            leaveControllor.txtStd.clear();
                            leaveControllor.txtName.clear();
                          } else {
                            Get.snackbar(
                              "Add Un Success",
                              "",
                            );
                          }
                        } else {
                          LeaveModel l1 = LeaveModel(
                            firstName: leaveControllor.txtName.text,
                            std: leaveControllor.txtStd.text,
                            resion: leaveControllor.txtResion.text,
                            dateTo: leaveControllor.txtDateTo.text,
                            dateForm: leaveControllor.txtDateFrom.text,
                          );
                          bool check = await leaveControllor.insertLeave(
                            l1: l1,
                          );

                          if (check) {
                            Get.back();
                            Get.snackbar(
                              "Add Success Fully",
                              "",
                            );
                            leaveControllor.txtResion.clear();
                            leaveControllor.txtStd.clear();
                            leaveControllor.txtName.clear();
                          } else {
                            Get.snackbar(
                              "Add Un Success",
                              "",
                            );
                          }
                        }
                      },
                      child: allButton(
                        string: leaveModel.check == 1 ? "Update" : "Add",
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
