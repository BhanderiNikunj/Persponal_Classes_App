import 'package:classes_app/Controllors/StudentControllor.dart';
import 'package:classes_app/Models/StudentModel.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class StudentReadScreen extends StatefulWidget {
  const StudentReadScreen({super.key});

  @override
  State<StudentReadScreen> createState() => _StudentReadScreenState();
}

class _StudentReadScreenState extends State<StudentReadScreen> {
  StudentControllor studentControllor = Get.put(
    StudentControllor(),
  );

  @override
  void initState() {
    super.initState();

    AdsHelper.adsHelper.loadBannerAd();
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
                  text: "Student List",
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
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                ),
                DropdownButton(
                  value: studentControllor.std,
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
                    studentControllor.std = value!;
                    setState(() {});
                  },
                ),
                DropdownButton(
                  value: studentControllor.language,
                  items: [
                    DropdownMenuItem(
                      value: "gujarati",
                      child: Text(
                        "Gujarati",
                      ),
                    ),
                    DropdownMenuItem(
                      value: "english",
                      child: Text(
                        "English",
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(height: 10.sp),
            Expanded(
              child: FutureBuilder(
                future: studentControllor.readStudent(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "${snapshot.error}",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    studentControllor.studentList = snapshot.data!;
                    return ListView.builder(
                      itemCount: studentControllor.studentList.length,
                      itemBuilder: (context, index) {
                        return studentControllor.studentList[index].std
                                    .compareTo(studentControllor.std) !=
                                0
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: Container(
                                  height: 120.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black26,
                                        offset: Offset(
                                          0,
                                          0,
                                        ),
                                        spreadRadius: 7,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10.sp,
                                      ),
                                      Container(
                                        width: 200.sp,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 20.sp,
                                              width: 200.sp,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                "Name :- ${studentControllor.studentList[index].firstName} ${studentControllor.studentList[index].lastName}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 25.sp,
                                              width: 200.sp,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                "Father Name :- ${studentControllor.studentList[index].fatherName}",
                                                style: GoogleFonts.archivo(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Mobile No :- ${studentControllor.studentList[index].mobileNumber}",
                                              style: GoogleFonts.archivo(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Std :- ${studentControllor.studentList[index].std}",
                                              style: GoogleFonts.archivo(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.sp,
                                      ),
                                      Container(
                                        width: 20.sp,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                StudentModel s1 = StudentModel(
                                                  id: studentControllor
                                                      .studentList[index].id,
                                                  check: 1,
                                                  firstName: studentControllor
                                                      .studentList[index]
                                                      .firstName,
                                                  lastName: studentControllor
                                                      .studentList[index]
                                                      .lastName,
                                                  fatherName: studentControllor
                                                      .studentList[index]
                                                      .fatherName,
                                                  std: studentControllor
                                                      .studentList[index].std,
                                                  mobileNumber:
                                                      studentControllor
                                                          .studentList[index]
                                                          .mobileNumber,
                                                );

                                                Get.toNamed(
                                                  '/studentAdd',
                                                  arguments: s1,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                StudentModel s1 = StudentModel(
                                                  id: studentControllor
                                                      .studentList[index].id,
                                                );

                                                bool check =
                                                    await studentControllor
                                                        .deleteStudent(
                                                  s1: s1,
                                                );

                                                if (check) {
                                                  Get.snackbar(
                                                    "Success Fully Delete",
                                                    "",
                                                  );

                                                  studentControllor
                                                          .studentList =
                                                      await studentControllor
                                                          .readStudent();
                                                  setState(() {});
                                                } else {
                                                  Get.snackbar(
                                                    "Un Success Fully Delete",
                                                    "",
                                                  );
                                                }
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    );
                  }
                  return Center(
                    child: Text(
                      "Work In Process",
                      style: GoogleFonts.archivo(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 50.sp,
          child: AdWidget(
            ad: AdsHelper.adsHelper.bannerAd!,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            StudentModel s1 = StudentModel(
              check: 0,
            );
            Get.toNamed(
              '/studentAdd',
              arguments: s1,
            );
          },
          backgroundColor: Color(0xff5055C4),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(17.sp),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
