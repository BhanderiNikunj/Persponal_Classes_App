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
  void initState() {
    super.initState();

    homeWorkControllor.std = "1";

    if (homeWorkModel.check == 1) {
      homeWorkControllor.subject = homeWorkModel.subject!;
      homeWorkControllor.txtDueDate =
          TextEditingController(text: "${homeWorkModel.dueDate}");
      homeWorkControllor.txtTitle =
          TextEditingController(text: "${homeWorkModel.homeWork}");
      homeWorkControllor.std = homeWorkModel.std!;
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
                      labelStyle: GoogleFonts.archivo(),
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
                        value: "English",
                        child: Text(
                          "English",
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
                        value: "Hindi",
                        child: Text(
                          "Hindi",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Gujarati",
                        child: Text(
                          "Gujarati",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Sanskrit",
                        child: Text(
                          "Sanskrit",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      homeWorkControllor.subject = value!;
                      setState(() {});
                    },
                  ),
                  DropdownButton(
                    isExpanded: true,
                    value: homeWorkControllor.std,
                    items: [
                      DropdownMenuItem(
                        value: "1",
                        child: Text(
                          "Std 1",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text(
                          "Std 2",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text(
                          "Std 3",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Text(
                          "Std 4",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "5",
                        child: Text(
                          "Std 5",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "6",
                        child: Text(
                          "Std 6",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "7",
                        child: Text(
                          "Std 7",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "8",
                        child: Text(
                          "Std 8",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "9",
                        child: Text(
                          "Std 9",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "10",
                        child: Text(
                          "Std 10",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      homeWorkControllor.std = value!;
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
                          std: homeWorkControllor.std,
                        );

                        bool check = await homeWorkControllor.updateHomeWork(
                          h1: h1,
                        );

                        if (check) {
                          Get.back();

                          Get.snackbar(
                            "Update Success",
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
                          std: homeWorkControllor.std,
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
