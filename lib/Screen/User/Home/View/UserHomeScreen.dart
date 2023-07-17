import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:classes_app/Screen/User/Home/Controllor/UserHomeControllor.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  UserHomeControllor userHomeControllor = Get.put(
    UserHomeControllor(),
  );

  final _advancedDrawerController =
      AdvancedDrawerController(AdvancedDrawerValue(visible: true));

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
        controller: _advancedDrawerController,
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
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'Assets/Images/bright.jpg',
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _handleMenuButtonPressed();
                    },
                    leading: Image.asset(
                      "Assets/Images/home.png",
                      height: 30.sp,
                    ),
                    title: Text("Home"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/userMassage');
                    },
                    leading: Image.asset(
                      "Assets/Images/announcement.png",
                      height: 30.sp,
                    ),
                    title: Text("Announcement"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('Profile'),
                  ),
                  ListTile(
                    onTap: () {
                      // Get.snackbar("title", "message");
                    },
                    leading: Icon(Icons.favorite),
                    title: Text('Favourites'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                  Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Scaffold(
          body: Column(
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
                    IconButton(
                      onPressed: () {
                        _handleMenuButtonPressed();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
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
                                      child: allButton(string: "Cancel"),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        FirebaseHelper.firebaseHelper.signOut();
                                      },
                                      child: allButton(string: "sign Out"),
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
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wel-come Back",
                      style: GoogleFonts.satisfy(
                        fontSize: 25.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    CarouselSlider.builder(
                      itemCount: userHomeControllor.imageList.length,
                      itemBuilder: (context, index, realIndex) {
                        return Image.asset(
                            "${userHomeControllor.imageList[index]}");
                      },
                      options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        height: 175.sp,
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
                    //               Get.toNamed('/userMassage');
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
                    //                       // "${homeControllor.Types[0].image}",
                    //                       "Assets/Images/announcement.png",
                    //                       height: 60.sp,
                    //                     ),
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
                    //                       "Announcement",
                    //                       // "${homeControllor.Types[0].name}",
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
                    //           // InkWell(
                    //           //   onTap: () {
                    //           //     Get.toNamed('/homeWork');
                    //           //   },
                    //           //   child: Container(
                    //           //     height: 135.sp,
                    //           //     width: 125.sp,
                    //           //     decoration: BoxDecoration(
                    //           //       borderRadius: BorderRadius.circular(10.sp),
                    //           //       boxShadow: [
                    //           //         BoxShadow(
                    //           //           offset: Offset(4, 1),
                    //           //           spreadRadius: 5,
                    //           //           blurRadius: 5,
                    //           //           color: Color(0xffb0b5f8),
                    //           //         ),
                    //           //       ],
                    //           //     ),
                    //           //     margin: EdgeInsets.all(10),
                    //           //     child: Column(
                    //           //       children: [
                    //           //         Container(
                    //           //           decoration: BoxDecoration(
                    //           //             borderRadius: BorderRadius.only(
                    //           //               topRight: Radius.circular(10.sp),
                    //           //               topLeft: Radius.circular(10.sp),
                    //           //             ),
                    //           //             gradient: LinearGradient(
                    //           //               transform: GradientRotation(pi / 2),
                    //           //               colors: [
                    //           //                 Color(0xff2ED0FF),
                    //           //                 Color(0xff50AFFF),
                    //           //                 Color(0xff6E92FF),
                    //           //                 Color(0xff7E82FF),
                    //           //               ],
                    //           //             ),
                    //           //           ),
                    //           //           height: 15.h,
                    //           //           alignment: Alignment.center,
                    //           //           child: Image.asset(
                    //           //               "${homeControllor.Types[1].image}"),
                    //           //         ),
                    //           //         Container(
                    //           //           decoration: BoxDecoration(
                    //           //             borderRadius: BorderRadius.only(
                    //           //               bottomLeft: Radius.circular(10.sp),
                    //           //               bottomRight: Radius.circular(10.sp),
                    //           //             ),
                    //           //             color: Color(0xffffffff),
                    //           //           ),
                    //           //           alignment: Alignment.center,
                    //           //           child: Text(
                    //           //             "${homeControllor.Types[1].name}",
                    //           //             style: TextStyle(
                    //           //               fontWeight: FontWeight.bold,
                    //           //               fontSize: 15.sp,
                    //           //               color: Color(0xff4754ff),
                    //           //             ),
                    //           //           ),
                    //           //           height: 35.sp,
                    //           //         ),
                    //           //       ],
                    //           //     ),
                    //           //   ),
                    //           // ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
