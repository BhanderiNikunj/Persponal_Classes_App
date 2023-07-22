import 'dart:math';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:classes_app/Admin/AdminHome/Controllor/AdminHomeControllor.dart';
import 'package:classes_app/Admin/AdminImageSet/Model/AdminImageSetModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  AdminHomeControllor homeControllor = Get.put(
    AdminHomeControllor(),
  );

  final drawerController =
      AdvancedDrawerController(AdvancedDrawerValue.hidden());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
            ),
          ),
        ),
        controller: drawerController,
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 1000),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      // color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'Assets/Images/bright.png',
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Image.asset(
                      "Assets/Images/home.png",
                      height: 20.sp,
                    ),
                    title: Text("Home"),
                  ),

                  ListTile(
                    onTap: () {
                      Get.toNamed('/showStudent');
                    },
                    leading: Image.asset(
                      "Assets/Images/student.png",
                      height: 15.sp,
                    ),
                    title: Text("Student"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/homeWork');
                    },
                    leading: Image.asset(
                      "Assets/Images/homeWork.png",
                      height: 20.sp,
                    ),
                    title: Text("Home Work"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/message');
                    },
                    leading: Image.asset(
                      "Assets/Images/announcement.png",
                      height: 20.sp,
                    ),
                    title: Text("Announcement"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/profile');
                    },
                    leading: Image.asset(
                      "Assets/Images/profile.png",
                      height: 20.sp,
                    ),
                    title: Text("Profile"),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.sp),
                        bottomRight: Radius.circular(20.sp)),
                    color: Color(0xffE85720),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                showDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bright Education Classes",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200.sp,
                  child: StreamBuilder(
                    stream: homeControllor.readImage(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                          "${snapshot.error}",
                        );
                      } else if (snapshot.hasData) {
                        homeControllor.imageList.clear();
                        for (var x in snapshot.data!.docs) {
                          AdminImageSetModel i1 = AdminImageSetModel(
                            key: x.id,
                            image: x['image'],
                          );

                          homeControllor.imageList.add(i1);
                        }
                        return CarouselSlider.builder(
                          itemCount: homeControllor.imageList.length,
                          disableGesture: true,
                          carouselController:
                              homeControllor.buttonCarouselController,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              width: double.infinity,
                              height: 150.sp,
                              margin: EdgeInsets.all(10),
                              // color: Colors.black12,
                              alignment: Alignment.center,
                              child: Image.memory(
                                Uint8List.fromList(
                                  homeControllor
                                      .imageList[index].image!.codeUnits,
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            height: 200.sp,
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed('/showStudent');
                            },
                            child: Container(
                              height: 135.sp,
                              width: 125.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(4, 1),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    color: Color(0xffb0b5f8),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.sp),
                                        topLeft: Radius.circular(10.sp),
                                      ),
                                      gradient: LinearGradient(
                                        transform: GradientRotation(pi / 2),
                                        colors: [
                                          Color(0xff2ED0FF),
                                          Color(0xff50AFFF),
                                          Color(0xff6E92FF),
                                          Color(0xff7E82FF),
                                        ],
                                      ),
                                    ),
                                    height: 15.h,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      "${homeControllor.Types[0].image}",
                                      height: 60.sp,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.sp),
                                        bottomRight: Radius.circular(10.sp),
                                      ),
                                      color: Color(0xffffffff),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${homeControllor.Types[0].name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp,
                                        color: Color(0xff4754ff),
                                      ),
                                    ),
                                    height: 35.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed('/homeWork');
                            },
                            child: Container(
                              height: 135.sp,
                              width: 125.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(4, 1),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    color: Color(0xffb0b5f8),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.sp),
                                        topLeft: Radius.circular(10.sp),
                                      ),
                                      gradient: LinearGradient(
                                        transform: GradientRotation(pi / 2),
                                        colors: [
                                          Color(0xff2ED0FF),
                                          Color(0xff50AFFF),
                                          Color(0xff6E92FF),
                                          Color(0xff7E82FF),
                                        ],
                                      ),
                                    ),
                                    height: 15.h,
                                    alignment: Alignment.center,
                                    // child: Image.asset(
                                    //   "${homeControllor.Types[1].image}",
                                    //   height: 60.sp,
                                    // ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.sp),
                                        bottomRight: Radius.circular(10.sp),
                                      ),
                                      color: Color(0xffffffff),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${homeControllor.Types[1].name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp,
                                        color: Color(0xff4754ff),
                                      ),
                                    ),
                                    height: 35.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed('/result');
                            },
                            child: Container(
                              height: 135.sp,
                              width: 125.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(4, 1),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    color: Color(0xffb0b5f8),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.sp),
                                        topLeft: Radius.circular(10.sp),
                                      ),
                                      gradient: LinearGradient(
                                        transform: GradientRotation(pi / 2),
                                        colors: [
                                          Color(0xff2ED0FF),
                                          Color(0xff50AFFF),
                                          Color(0xff6E92FF),
                                          Color(0xff7E82FF),
                                        ],
                                      ),
                                    ),
                                    height: 15.h,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      "${homeControllor.Types[2].image}",
                                      height: 80.sp,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.sp),
                                        bottomRight: Radius.circular(10.sp),
                                      ),
                                      color: Color(0xffffffff),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${homeControllor.Types[2].name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp,
                                        color: Color(0xff4754ff),
                                      ),
                                    ),
                                    height: 35.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDrawer() {
    drawerController.showDrawer();
  }
}
