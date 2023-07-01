import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Are You Sure To sign Out",
                            content: Column(
                              children: [
                                SizedBox(width: 50.sp),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        height: 30.sp,
                                        width: 60.sp,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
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
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        homeControllor.signOut();
                                      },
                                      child: Container(
                                        height: 30.sp,
                                        width: 60.sp,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
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
                                        alignment: Alignment.center,
                                        child: Text(
                                          "signOut",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CarouselSlider.builder(
                itemCount: homeControllor.imageList.length,
                disableGesture: true,
                carouselController: homeControllor.buttonCarouselController,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    width: double.infinity,
                    height: 150.sp,
                    margin: EdgeInsets.all(10),
                    // color: Colors.black12,
                    alignment: Alignment.center,
                    child: Image.asset("${homeControllor.imageList[index]}"),
                  );
                },
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  height: 200.sp,
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
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.toNamed('/courses');
                            Get.toNamed('/notes');
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
                                  child: Container(
                                    color: Colors.black,
                                    child: Image.asset(
                                        "${homeControllor.Types[2].image}"),
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
              // Padding(
              //   padding: EdgeInsets.all(8.sp),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           InkWell(
              //             onTap: () {
              //               // Get.toNamed('/courses');
              //               Get.toNamed('/showStudent');
              //             },
              //             child: Container(
              //               height: 135.sp,
              //               width: 125.sp,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10.sp),
              //                 boxShadow: [
              //                   BoxShadow(
              //                     offset: Offset(4, 1),
              //                     spreadRadius: 5,
              //                     blurRadius: 5,
              //                     color: Color(0xffb0b5f8),
              //                   ),
              //                 ],
              //               ),
              //               margin: EdgeInsets.all(10),
              //               child: Column(
              //                 children: [
              //                   Container(
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.only(
              //                         topRight: Radius.circular(10.sp),
              //                         topLeft: Radius.circular(10.sp),
              //                       ),
              //                       gradient: LinearGradient(
              //                         transform: GradientRotation(pi / 2),
              //                         colors: [
              //                           Color(0xff2ED0FF),
              //                           Color(0xff50AFFF),
              //                           Color(0xff6E92FF),
              //                           Color(0xff7E82FF),
              //                         ],
              //                       ),
              //                     ),
              //                     height: 15.h,
              //                     alignment: Alignment.center,
              //                     child: Image.asset(
              //                         "${homeControllor.Types[0].image}"),
              //                   ),
              //                   Container(
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.only(
              //                         bottomLeft: Radius.circular(10.sp),
              //                         bottomRight: Radius.circular(10.sp),
              //                       ),
              //                       color: Color(0xffffffff),
              //                     ),
              //                     alignment: Alignment.center,
              //                     child: Text(
              //                       "${homeControllor.Types[0].name}",
              //                       style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 15.sp,
              //                         color: Color(0xff4754ff),
              //                       ),
              //                     ),
              //                     height: 35.sp,
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //           InkWell(
              //             onTap: () {
              //               Get.toNamed('/homeWork');
              //             },
              //             child: Container(
              //               height: 135.sp,
              //               width: 125.sp,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10.sp),
              //                 boxShadow: [
              //                   BoxShadow(
              //                     offset: Offset(4, 1),
              //                     spreadRadius: 5,
              //                     blurRadius: 5,
              //                     color: Color(0xffb0b5f8),
              //                   ),
              //                 ],
              //               ),
              //               margin: EdgeInsets.all(10),
              //               child: Column(
              //                 children: [
              //                   Container(
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.only(
              //                         topRight: Radius.circular(10.sp),
              //                         topLeft: Radius.circular(10.sp),
              //                       ),
              //                       gradient: LinearGradient(
              //                         transform: GradientRotation(pi / 2),
              //                         colors: [
              //                           Color(0xff2ED0FF),
              //                           Color(0xff50AFFF),
              //                           Color(0xff6E92FF),
              //                           Color(0xff7E82FF),
              //                         ],
              //                       ),
              //                     ),
              //                     height: 15.h,
              //                     alignment: Alignment.center,
              //                     child: Image.asset(
              //                         "${homeControllor.Types[1].image}"),
              //                   ),
              //                   Container(
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.only(
              //                         bottomLeft: Radius.circular(10.sp),
              //                         bottomRight: Radius.circular(10.sp),
              //                       ),
              //                       color: Color(0xffffffff),
              //                     ),
              //                     alignment: Alignment.center,
              //                     child: Text(
              //                       "${homeControllor.Types[1].name}",
              //                       style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 15.sp,
              //                         color: Color(0xff4754ff),
              //                       ),
              //                     ),
              //                     height: 35.sp,
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
