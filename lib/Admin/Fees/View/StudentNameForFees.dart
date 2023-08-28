import 'package:classes_app/Controllors/FeesControllor.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class StudentNameForFeesScreen extends StatefulWidget {
  const StudentNameForFeesScreen({super.key});

  @override
  State<StudentNameForFeesScreen> createState() =>
      _StudentNameForFeesScreenState();
}

class _StudentNameForFeesScreenState extends State<StudentNameForFeesScreen> {
  FeesControllor feesControllor = Get.put(
    FeesControllor(),
  );

  @override
  void initState() {
    super.initState();
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
                  text: "Student Fees",
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
            Container(
              width: 200.sp,
              height: 50.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: feesControllor.std,
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
                      feesControllor.std = value!;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: feesControllor.readStudentUid(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "${snapshot.error}",
                      style: GoogleFonts.archivo(),
                    );
                  } else if (snapshot.hasData) {
                    feesControllor.studentUidList = snapshot.data!;
                    return ListView.builder(
                      itemCount: feesControllor.studentUidList.length,
                      itemBuilder: (context, index) {
                        return feesControllor.studentUidList[index].std
                                    .compareTo(feesControllor.std) !=
                                0
                            ? Text(
                                "",
                                style: GoogleFonts.archivo(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    '/feesRead',
                                    arguments:
                                        feesControllor.studentUidList[index],
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    "${feesControllor.studentUidList[index].firstName}",
                                    style: GoogleFonts.archivo(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  leading: Text(
                                    "${feesControllor.studentUidList[index].std}",
                                    style: GoogleFonts.archivo(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lisOfStudent({
    String? std,
  }) {
    return FutureBuilder(
      future: feesControllor.readStudentUid(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "${snapshot.error}",
            style: GoogleFonts.archivo(),
          );
        } else if (snapshot.hasData) {
          feesControllor.studentUidList = snapshot.data!;
          return ListView.builder(
            itemCount: feesControllor.studentUidList.length,
            itemBuilder: (context, index) {
              return feesControllor.studentUidList[index].std
                          .compareTo("$std") !=
                      0
                  ? Text(
                      "",
                      style: GoogleFonts.archivo(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Get.toNamed(
                          '/feesRead',
                          arguments: feesControllor.studentUidList[index],
                        );
                      },
                      child: ListTile(
                        title: Text(
                          "${feesControllor.studentUidList[index].firstName}",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Text(
                          "${feesControllor.studentUidList[index].std}",
                          style: GoogleFonts.archivo(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
