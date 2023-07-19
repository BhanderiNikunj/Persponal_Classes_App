import 'package:carousel_slider/carousel_slider.dart';
import 'package:classes_app/Screen/ImageSet/Model/ImageSetModel.dart';
import 'package:classes_app/Screen/User/Home/Controllor/UserHomeControllor.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
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

  final _advancedDrawerController = AdvancedDrawerController();

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
                      // color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'Assets/Images/bright.png',
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      // _handleMenuButtonPressed();
                    },
                    leading: Image.asset(
                      "Assets/Images/home.png",
                      height: 20.sp,
                    ),
                    title: Text("Home"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(
                        '/userMassage',
                      );
                    },
                    leading: Image.asset(
                      "Assets/Images/announcement.png",
                      height: 20.sp,
                    ),
                    title: Text("Announcement"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(
                        '/userHomeWork',
                      );
                    },
                    leading: Image.asset(
                      "Assets/Images/homeWork.png",
                      height: 20.sp,
                    ),
                    title: Text("Home Work"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(
                        '/userProfile',
                      );
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
                    Row(
                      children: [
                        Center(
                          child: IconButton(
                            onPressed: () {
                              _handleMenuButtonPressed();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     "Wel-come Back",
                    //     style: GoogleFonts.satisfy(
                    //       fontSize: 15.sp,
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20.sp),
                    StreamBuilder(
                      stream: userHomeControllor.readImages(),
                      builder: (context, snapShot) {
                        if (snapShot.hasError) {
                          return Text("${snapShot.error}");
                        } else if (snapShot.hasData) {
                          userHomeControllor.imageList.clear();
                          for (var x in snapShot.data!.docs) {
                            ImageSetModel i1 = ImageSetModel(
                              image: x['image'],
                              key: x.id,
                            );
                            userHomeControllor.imageList.add(i1);
                          }
                          return CarouselSlider.builder(
                            itemCount: userHomeControllor.imageList.length,
                            itemBuilder: (context, index, realIndex) {
                              return Image.memory(
                                Uint8List.fromList(
                                  userHomeControllor
                                      .imageList[index].image!.codeUnits,
                                ),
                              );
                            },
                            options: CarouselOptions(
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              height: 175.sp,
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
