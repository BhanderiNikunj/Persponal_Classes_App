import 'package:classes_app/Models/LeaveModel.dart';
import 'package:classes_app/Screens/Leave/Controllor/AdminUserLeaveControllor.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminUserLeaveAddScreen extends StatefulWidget {
  const AdminUserLeaveAddScreen({super.key});

  @override
  State<AdminUserLeaveAddScreen> createState() =>
      _AdminUserLeaveAddScreenState();
}

class _AdminUserLeaveAddScreenState extends State<AdminUserLeaveAddScreen> {
  AdminUserLeaveControllor adminUserLeaveControllor = Get.put(
    AdminUserLeaveControllor(),
  );

  LeaveModel leaveModel = Get.arguments;

  @override
  void initState() {
    super.initState();

    if (leaveModel.check == 1) {
      adminUserLeaveControllor.txtDateTo =
          TextEditingController(text: "${leaveModel.date_to}");
      adminUserLeaveControllor.txtDateFrom =
          TextEditingController(text: "${leaveModel.date_form}");
      adminUserLeaveControllor.txtName =
          TextEditingController(text: "${leaveModel.name}");
      adminUserLeaveControllor.txtResion =
          TextEditingController(text: "${leaveModel.detail}");
      adminUserLeaveControllor.std = leaveModel.std;
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
                    text: "Student Detail",
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
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  children: [
                    SizedBox(height: 20.sp),
                    TextField(
                      controller: adminUserLeaveControllor.txtName,
                      style: GoogleFonts.archivo(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "Ex.  user user",
                        hintStyle: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                        labelText: "Enter Your Name",
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
                      controller: adminUserLeaveControllor.txtResion,
                      style: GoogleFonts.archivo(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "Ex.  goto home...",
                        hintStyle: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                        labelText: "Enter Your Resion",
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
                      controller: adminUserLeaveControllor.txtDateFrom,
                      style: GoogleFonts.archivo(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () async {
                            DateTime? date =
                                await DatePicker.showSimpleDatePicker(
                              context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                              dateFormat: "dd-MMMM-yyyy",
                              locale: DateTimePickerLocale.en_us,
                              looping: false,
                            );

                            adminUserLeaveControllor.txtDateFrom =
                                TextEditingController(
                              text:
                                  "${date!.day} / ${date.month} / ${date.year}",
                            );
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.date_range,
                          ),
                        ),
                        labelText: "Enter Date Form",
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
                      controller: adminUserLeaveControllor.txtDateTo,
                      style: GoogleFonts.archivo(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () async {
                            DateTime? date =
                                await DatePicker.showSimpleDatePicker(
                              context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000),
                              dateFormat: "dd-MMMM-yyyy",
                              locale: DateTimePickerLocale.en_us,
                              looping: false,
                            );

                            adminUserLeaveControllor.txtDateTo =
                                TextEditingController(
                              text:
                                  "${date!.day} / ${date.month} / ${date.year}",
                            );
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.date_range,
                          ),
                        ),
                        labelText: "Enter Date To",
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
                    DropdownButton(
                      value: adminUserLeaveControllor.checkStudent,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text(
                            "Teacher",
                            style: GoogleFonts.archivo(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 0,
                          child: Text(
                            "Student",
                            style: GoogleFonts.archivo(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        adminUserLeaveControllor.checkStudent = value!;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10.sp),
                    adminUserLeaveControllor.checkStudent == 0
                        ? DropdownButton(
                            isExpanded: true,
                            value: adminUserLeaveControllor.std,
                            items: [
                              DropdownMenuItem(
                                value: 1,
                                child: Text(
                                  "Std 1",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text(
                                  "Std 2",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text(
                                  "Std 3",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text(
                                  "Std 4",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 5,
                                child: Text(
                                  "Std 5",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 6,
                                child: Text(
                                  "Std 6",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 7,
                                child: Text(
                                  "Std 7",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 8,
                                child: Text(
                                  "Std 8",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 9,
                                child: Text(
                                  "Std 9",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 10,
                                child: Text(
                                  "Std 10",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              adminUserLeaveControllor.std = value!;
                              setState(() {});
                            },
                          )
                        : Container(),
                    SizedBox(height: 20.sp),
                    InkWell(
                      onTap: () async {
                        if (leaveModel.check == 1) {
                          LeaveModel l1 = LeaveModel(
                            std: adminUserLeaveControllor.checkStudent == 1
                                ? 0
                                : adminUserLeaveControllor.std,
                            name: adminUserLeaveControllor.txtName.text,
                            detail: adminUserLeaveControllor.txtResion.text,
                            date_to: adminUserLeaveControllor.txtDateFrom.text,
                            date_form:
                                adminUserLeaveControllor.txtDateFrom.text,
                            key: leaveModel.key,
                          );
                          adminUserLeaveControllor.updateLeave(
                            l1: l1,
                          );

                          Get.back();
                        } else {
                          LeaveModel l1 = LeaveModel(
                            std: adminUserLeaveControllor.checkStudent == 1
                                ? 0
                                : adminUserLeaveControllor.std,
                            name: adminUserLeaveControllor.txtName.text,
                            detail: adminUserLeaveControllor.txtResion.text,
                            date_to: adminUserLeaveControllor.txtDateFrom.text,
                            date_form:
                                adminUserLeaveControllor.txtDateFrom.text,
                          );
                          adminUserLeaveControllor.insertLeave(
                            l1: l1,
                          );

                          Get.back();
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
      ),
    );
  }
}
