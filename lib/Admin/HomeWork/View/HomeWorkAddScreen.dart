import 'package:classes_app/Controllors/HomeWorkControllor.dart';
import 'package:classes_app/Models/HomeWorkModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeWorkAddScreen extends StatefulWidget {
  const HomeWorkAddScreen({Key? key}) : super(key: key);

  @override
  State<HomeWorkAddScreen> createState() => _HomeWorkAddScreenState();
}

class _HomeWorkAddScreenState extends State<HomeWorkAddScreen> {
  HomeWorkControllor homeWorkControllor = Get.put(
    HomeWorkControllor(),
  );

  HomeWorkModel homeWorkModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Home Work Add",
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
                    controller: homeWorkControllor.txtTitle,
                    style: GoogleFonts.archivo(),
                    cursorColor: Color(0xffe85720),
                    cursorWidth: 1,
                    cursorRadius: Radius.circular(50),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0x27e85720),
                      hintText: "Ex. Title",
                      hintStyle: GoogleFonts.archivo(),
                      label: Text(
                        "Enter Title",
                        style: GoogleFonts.archivo(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: homeWorkControllor.txtDueDate,
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

                          homeWorkControllor.txtDueDate = TextEditingController(
                              text: "${d1!.day} / ${d1.month} / ${d1.year}");
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.date_range,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0x27e85720),
                      hintText: "Ex. Title",
                      hintStyle: GoogleFonts.archivo(),
                      label: Text(
                        "Enter Title",
                        style: GoogleFonts.archivo(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  DropdownButton(
                    isExpanded: true,
                    value: homeWorkControllor.subject,
                    items: [
                      DropdownMenuItem(
                        value: "Math",
                        child: Text(
                          "Math's",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Science",
                        child: Text(
                          "Science",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "English",
                        child: Text(
                          "English",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Social Science",
                        child: Text(
                          "Social Science",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Hindi",
                        child: Text(
                          "Hindi",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Gujarati",
                        child: Text(
                          "Gujarati",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Sanskrit",
                        child: Text(
                          "Sanskrit",
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      homeWorkControllor.subject = value!;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 20.sp),
                  InkWell(
                    onTap: () async {
                      if (homeWorkModel.check == 1) {
                        HomeWorkModel h1 = HomeWorkModel(
                          id: homeWorkModel.id,
                          subject: homeWorkControllor.subject,
                          homeWork: homeWorkControllor.txtTitle.text,
                          dueDate: homeWorkControllor.txtDueDate.text,
                        );

                        bool check = await homeWorkControllor.updateHomeWork(
                          h1: h1,
                        );

                        if (check) {
                          Get.back();

                          Get.snackbar(
                            "Add Success",
                            "",
                          );
                          homeWorkControllor.txtTitle.clear();
                        } else {
                          Get.snackbar(
                            "Add Un Success",
                            "",
                          );
                        }
                      } else {
                        HomeWorkModel h1 = HomeWorkModel(
                          subject: homeWorkControllor.subject,
                          homeWork: homeWorkControllor.txtTitle.text,
                          dueDate: homeWorkControllor.txtDueDate.text,
                        );

                        print(h1.dueDate);
                        bool check = await homeWorkControllor.insertHomeWork(
                          h1: h1,
                        );

                        print(check);

                        if (check) {
                          Get.back();

                          Get.snackbar(
                            "Add Success",
                            "",
                          );
                          homeWorkControllor.txtTitle.clear();
                        } else {
                          Get.snackbar(
                            "Add Un Success",
                            "",
                          );
                        }
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
