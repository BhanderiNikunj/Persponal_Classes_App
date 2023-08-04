import 'package:carousel_slider/carousel_slider.dart';
import 'package:classes_app/Models/ImageModel.dart';
import 'package:classes_app/Screens/Home/Controller/HomeControllor.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  HomeControllor homeControllor = Get.put(
    HomeControllor(),
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Container(
          width: 35.h,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 30.sp,
              ),
              Image.asset(
                "Assets/Images/bright.png",
                height: 100.sp,
              ),
              SizedBox(
                height: 40.sp,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    '/adminStudentRead',
                  );
                },
                child: ListTile(
                  leading: Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "Assets/Images/student.png",
                    ),
                  ),
                  title: Text(
                    "Student",
                    style: GoogleFonts.archivo(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    '/adminStudentHomeWorkRead',
                  );
                },
                child: ListTile(
                  leading: Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "Assets/Images/homeWork.png",
                      height: 35.sp,
                    ),
                  ),
                  title: Text(
                    "Home Work",
                    style: GoogleFonts.archivo(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    '/leaveRead',
                  );
                },
                child: ListTile(
                  leading: Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "Assets/Images/leave.png",
                      height: 30.sp,
                    ),
                  ),
                  title: Text(
                    "Leave",
                    style: GoogleFonts.archivo(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    '/adminMessageRead',
                  );
                },
                child: ListTile(
                  leading: Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "Assets/Images/announcement.png",
                      height: 35.sp,
                    ),
                  ),
                  title: Text(
                    "Announcement",
                    style: GoogleFonts.archivo(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    '/adminImageRead',
                  );
                },
                child: ListTile(
                  leading: Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "Assets/Images/image.png",
                      height: 30.sp,
                    ),
                  ),
                  title: Text(
                    "Image Add",
                    style: GoogleFonts.archivo(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    '/adminFeesRead',
                  );
                },
                child: ListTile(
                  leading: Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "Assets/Images/fees.png",
                      height: 35.sp,
                    ),
                  ),
                  title: Text(
                    "Fees",
                    style: GoogleFonts.archivo(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  homeControllor.signOut();
                },
                child: ListTile(
                  leading: Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "Assets/Images/logOut.png",
                      height: 40.sp,
                    ),
                  ),
                  title: Text(
                    "Log Out",
                    style: GoogleFonts.archivo(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Bright Education Classes",
                ),
                Container(
                  height: 50.sp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.sp),
            StreamBuilder(
              stream: homeControllor.readImage(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    "${snapshot.error}",
                  );
                } else if (snapshot.hasData) {
                  homeControllor.imageList.clear();

                  for (var x in snapshot.data!.docs) {
                    ImageModel i1 = ImageModel(
                      image: x['image'],
                    );

                    homeControllor.imageList.add(i1);
                  }
                  return Container(
                    height: 200.sp,
                    child: CarouselSlider.builder(
                      itemCount: homeControllor.imageList.length,
                      itemBuilder: (context, index, realIndex) {
                        return Image.memory(
                          Uint8List.fromList(
                            homeControllor.imageList[index].image!.codeUnits,
                          ),
                        );
                      },
                      disableGesture: true,
                      carouselController:
                          homeControllor.buttonCarouselController,
                      options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        height: 200.sp,
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
