import 'dart:math';
import 'package:classes_app/Screen/Main/Home/Controllor/HomeControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeControllor homeControllor = Get.put(
    HomeControllor(),
  );

  int a = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Get.toNamed('/courses');
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
                                  "${homeControllor.Types[0].image}"),
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
                              child: Image.asset(
                                  "${homeControllor.Types[1].image}"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
