import 'package:classes_app/Admin/AdminHomeWork/AddAdminHomeWork/Controllor/AddHomeWorkControllor.dart';
import 'package:classes_app/Admin/AdminHomeWork/ShowHomeWork/Model/HomeWorkModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminAddHomeWorkScreen extends StatefulWidget {
  const AdminAddHomeWorkScreen({super.key});

  @override
  State<AdminAddHomeWorkScreen> createState() => _AdminAddHomeWorkScreenState();
}

class _AdminAddHomeWorkScreenState extends State<AdminAddHomeWorkScreen> {
  AddAdminHomeWorkControllor addHomeWorkControllor = Get.put(
    AddAdminHomeWorkControllor(),
  );

  HomeWorkModel h1 = Get.arguments;

  @override
  void initState() {
    super.initState();

    if (h1.check == 1) {
      addHomeWorkControllor.std.value = h1.std!;
      addHomeWorkControllor.subject.value = h1.subject!;
      addHomeWorkControllor.txtDueData =
          TextEditingController(text: "${h1.dueDate}");
      addHomeWorkControllor.txtTitle =
          TextEditingController(text: "${h1.title}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                "Assets/Images/bright_op.png",
                height: 200.sp,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 50.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.sp),
                          bottomRight: Radius.circular(20.sp)),
                      gradient: LinearGradient(
                        transform: GradientRotation(100),
                        colors: [
                          Color(0xff2ED0FF),
                          Color(0xff50AFFF),
                          Color(0xff6E92FF),
                          Color(0xff7E82FF),
                        ],
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 40.sp,
                            width: 40.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xff272cff),
                            ),
                          ),
                        ),
                        SizedBox(width: 65.sp),
                        Center(
                          child: Text(
                            "Add Home Work",
                            style: GoogleFonts.archivo(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.sp),
                        Text(
                          "Enter HomeWork Title",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(height: 5.sp),
                        TextField(
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                          controller: addHomeWorkControllor.txtTitle,
                          decoration: InputDecoration(
                            hintText: "Ex. abcd",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Text(
                          "Enter HomeWork Due Date",
                          style: GoogleFonts.archivo(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(height: 5.sp),
                        TextField(
                          style:
                              GoogleFonts.archivo(fontWeight: FontWeight.bold),
                          controller: addHomeWorkControllor.txtDueData,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () async {
                                DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(3000),
                                );

                                setState(() {
                                  addHomeWorkControllor.txtDueData =
                                      TextEditingController(
                                    text:
                                        "${date!.day} / ${date.month} / ${date.year}",
                                  );
                                });
                              },
                              icon: Icon(Icons.calendar_month),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Obx(
                          () => DropdownButton(
                            isExpanded: true,
                            enableFeedback: true,
                            value: addHomeWorkControllor.subject.value,
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  "Maths",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: "math",
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Social Science",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: "social_science",
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Science",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: "science",
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "English",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: "english",
                              ),
                            ],
                            onChanged: (value) {
                              addHomeWorkControllor.subject.value = value!;
                            },
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Obx(
                          () => DropdownButton(
                            isExpanded: true,
                            value: addHomeWorkControllor.std.value,
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  "Std 1",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 2",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 3",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 4",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: 4,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 5",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: 5,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 6",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: 6,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 7",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: 7,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 8",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: 8,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 9",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: 9,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 10",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: 10,
                              ),
                            ],
                            onChanged: (value) {
                              addHomeWorkControllor.std.value = value!;
                            },
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              if (h1.check == 1) {
                                HomeWorkModel homeWork = HomeWorkModel(
                                  dueDate:
                                      addHomeWorkControllor.txtDueData.text,
                                  subject: addHomeWorkControllor.subject.value,
                                  title: addHomeWorkControllor.txtTitle.text,
                                  std: addHomeWorkControllor.std.value,
                                  key: h1.key,
                                );
                                String msg =
                                    await addHomeWorkControllor.updateHomeWork(
                                  h1: homeWork,
                                );

                                if (msg == "success") {
                                  Get.back();
                                  Get.snackbar(
                                    "$msg",
                                    "",
                                  );
                                }
                              } else {
                                HomeWorkModel homeWork = HomeWorkModel(
                                  dueDate:
                                      addHomeWorkControllor.txtDueData.text,
                                  subject: addHomeWorkControllor.subject.value,
                                  title: addHomeWorkControllor.txtTitle.text,
                                  std: addHomeWorkControllor.std.value,
                                );

                                String msg =
                                    await addHomeWorkControllor.insertHomeWork(
                                  h1: homeWork,
                                );

                                if (msg == "success") {
                                  Get.back();
                                  Get.snackbar(
                                    "$msg",
                                    "",
                                  );
                                }
                              }
                            },
                            child: h1.check == 1
                                ? allButton(string: "Update")
                                : allButton(
                                    string: "Submit",
                                  ),
                          ),
                        ),
                      ],
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
