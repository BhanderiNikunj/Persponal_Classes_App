import 'package:classes_app/Controllors/HomeWorkControllor.dart';
import 'package:classes_app/Controllors/ProfileControllor.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UserHomeWorkScreen extends StatefulWidget {
  const UserHomeWorkScreen({super.key});

  @override
  State<UserHomeWorkScreen> createState() => _UserHomeWorkScreenState();
}

class _UserHomeWorkScreenState extends State<UserHomeWorkScreen> {
  HomeWorkControllor homeWorkControllor = Get.put(
    HomeWorkControllor(),
  );

  ProfileControllor profileControllor = Get.put(
    ProfileControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Home Work",
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
            Expanded(
              child: FutureBuilder(
                future: homeWorkControllor.readHomeWork(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: Text(
                        "${snapshot.error}",
                        style: GoogleFonts.archivo(),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    homeWorkControllor.homeWorkList = snapshot.data!;

                    return FutureBuilder(
                      future: profileControllor.readUserDetail(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                            "${snapshot.error}",
                          );
                        } else if (snapshot.hasData) {
                          List l1 = snapshot.data!;
                          return ListView.builder(
                            itemCount: homeWorkControllor.homeWorkList.length,
                            itemBuilder: (context, index) {
                              return homeWorkControllor.homeWorkList[index].std
                                          .compareTo("${l1[0].std}") !=
                                      0
                                  ? Container()
                                  : Padding(
                                      padding: EdgeInsets.all(8.sp),
                                      child: Container(
                                        height: 100.sp,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          color: Colors.white70,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              color: Colors.black12,
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
                                                  Text(
                                                    "Home Work :- ${homeWorkControllor.homeWorkList[index].homeWork}",
                                                    style: GoogleFonts.archivo(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Subject :- ${homeWorkControllor.homeWorkList[index].subject}",
                                                    style: GoogleFonts.archivo(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Due Date :- ${homeWorkControllor.homeWorkList[index].dueDate}",
                                                    style: GoogleFonts.archivo(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Std :- ${homeWorkControllor.homeWorkList[index].std}",
                                                    style: GoogleFonts.archivo(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                          child: CircularProgressIndicator(),
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
}
