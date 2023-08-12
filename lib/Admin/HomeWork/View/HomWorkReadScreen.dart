import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomWorkReadScreen extends StatefulWidget {
  const HomWorkReadScreen({super.key});

  @override
  State<HomWorkReadScreen> createState() => _HomWorkReadScreenState();
}

class _HomWorkReadScreenState extends State<HomWorkReadScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Student HomeWork",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // feesControllor.std = "1";
                    // listOfFees(
                    //   std: "1",
                    // );
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                ),
                DropdownButton(
                  // value: feesControllor.std,
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
                    // feesControllor.std = value!;
                    setState(() {});
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
