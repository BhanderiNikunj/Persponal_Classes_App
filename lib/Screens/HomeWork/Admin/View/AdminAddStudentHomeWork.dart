import 'package:classes_app/Models/HomeWorkModel.dart';
import 'package:classes_app/Screens/HomeWork/Controller/StudentHomeWorkController.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminAddStudentHomeWork extends StatefulWidget {
  const AdminAddStudentHomeWork({super.key});

  @override
  State<AdminAddStudentHomeWork> createState() =>
      _AdminAddStudentHomeWorkState();
}

class _AdminAddStudentHomeWorkState extends State<AdminAddStudentHomeWork> {
  StudentHomeWorkController studentHomeWorkController = Get.put(
    StudentHomeWorkController(),
  );

  HomeWorkModel homeWorkModel = Get.arguments;

  @override
  void initState() {
    super.initState();

    if (homeWorkModel.check == 1) {
      studentHomeWorkController.txtTitle =
          TextEditingController(text: "${homeWorkModel.title}");
      studentHomeWorkController.txtDueDate =
          TextEditingController(text: "${homeWorkModel.dueDate}");
      studentHomeWorkController.subject = "${homeWorkModel.subject}";
      studentHomeWorkController.std.value = homeWorkModel.std!;
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
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  SizedBox(height: 20.sp),
                  TextField(
                    controller: studentHomeWorkController.txtTitle,
                    style: GoogleFonts.archivo(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Ex. HomeWork",
                      hintStyle: GoogleFonts.archivo(
                        fontWeight: FontWeight.bold,
                      ),
                      labelText: "Enter HomeWork Title",
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
                    controller: studentHomeWorkController.txtDueDate,
                    style: GoogleFonts.archivo(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () async {
                          DateTime? dateTime =
                              await DatePicker.showSimpleDatePicker(
                            context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            dateFormat: "dd-MMMM-yyyy",
                            locale: DateTimePickerLocale.en_us,
                            looping: false,
                          );

                          setState(() {
                            studentHomeWorkController.txtDueDate =
                                TextEditingController(
                              text:
                                  "${dateTime!.day} / ${dateTime.month} / ${dateTime.year}",
                            );
                          });
                        },
                        icon: Icon(
                          Icons.date_range,
                        ),
                      ),
                      hintText: "Ex. 20 / 5 / 2023",
                      hintStyle: GoogleFonts.archivo(
                        fontWeight: FontWeight.bold,
                      ),
                      labelText: "Enter HomeWork Due Date",
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
                    isExpanded: true,
                    value: studentHomeWorkController.subject,
                    items: [
                      DropdownMenuItem(
                        value: "Math's",
                        child: Text(
                          "Math's",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Science",
                        child: Text(
                          "Science",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Social Science",
                        child: Text(
                          "Social Science",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "English",
                        child: Text(
                          "English",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      studentHomeWorkController.subject = value!;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 10.sp),
                  DropdownButton(
                    isExpanded: true,
                    value: studentHomeWorkController.std.value,
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
                      studentHomeWorkController.std.value = value!;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 20.sp),
                  InkWell(
                    onTap: () {
                      if (homeWorkModel.check == 1) {
                        HomeWorkModel h1 = HomeWorkModel(
                          subject: studentHomeWorkController.subject,
                          dueDate: studentHomeWorkController.txtDueDate.text,
                          title: studentHomeWorkController.txtTitle.text,
                          std: studentHomeWorkController.std.value,
                          key: homeWorkModel.key,
                        );
                        studentHomeWorkController.updateStudentHomeWork(
                          h1: h1,
                        );
                        studentHomeWorkController.std.value = 0;
                        studentHomeWorkController.subject = "Math's";
                        studentHomeWorkController.txtDueDate =
                            TextEditingController(
                          text:
                              "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
                        );
                        studentHomeWorkController.txtTitle.clear();
                        Get.back();
                      } else {
                        HomeWorkModel h1 = HomeWorkModel(
                          subject: studentHomeWorkController.subject,
                          dueDate: studentHomeWorkController.txtDueDate.text,
                          title: studentHomeWorkController.txtTitle.text,
                          std: studentHomeWorkController.std.value,
                        );
                        studentHomeWorkController.insertStudentHomeWork(
                          h1: h1,
                        );
                        studentHomeWorkController.std.value = 0;
                        studentHomeWorkController.subject = "Math's";
                        studentHomeWorkController.txtDueDate =
                            TextEditingController(
                          text:
                              "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
                        );
                        studentHomeWorkController.txtTitle.clear();
                        Get.back();
                      }
                    },
                    child: allButton(
                      string: homeWorkModel.check == 1 ? "Update" : "Add",
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
