import 'package:classes_app/Controllors/ProfileControllor.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileControllor profileControllor = Get.put(
    ProfileControllor(),
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
                  text: "Your Profile",
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
            FutureBuilder(
              future: profileControllor.readUserDetail(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    "${snapshot.error}",
                    style: GoogleFonts.archivo(),
                  );
                } else if (snapshot.hasData) {
                  profileControllor.userDetail = snapshot.data!;
                  return Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Personal Information",
                              style: GoogleFonts.archivo(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.sp),
                        Container(
                          height: 180.sp,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 10.sp),
                                  Container(
                                    height: 30.sp,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Name :- ${profileControllor.userDetail[0].firstName} ${profileControllor.userDetail[0].lastName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10.sp),
                                  Container(
                                    height: 30.sp,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Father Name :- ${profileControllor.userDetail[0].fatherName}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10.sp),
                                  Container(
                                    height: 30.sp,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Std :- ${profileControllor.userDetail[0].std}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10.sp),
                                  Container(
                                    height: 30.sp,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Email :- ${profileControllor.userDetail[0].emailId}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 10.sp),
                                  Container(
                                    height: 30.sp,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      profileControllor.userDetail[0].chechAdmin
                                                  .compareTo("1") ==
                                              0
                                          ? "Status :- Admin"
                                          : "Status :- User",
                                      style: GoogleFonts.archivo(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        InkWell(
                          onTap: () {
                            Get.defaultDialog(
                              title: "Are You Sur For Log Out",
                              titleStyle: GoogleFonts.archivo(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              content: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: allButton(
                                          string: "No",
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FirebaseHelper.firebaseHelper.signOut();
                                          Get.offAndToNamed('/logIn');
                                        },
                                        child: allButton(
                                          string: "Yes",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Center(
                            child: allButton(
                              string: "Log Out",
                            ),
                          ),
                        ),
                      ],
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
        bottomNavigationBar: SizedBox(
          height: 50.sp,
          child: AdWidget(
            ad: AdsHelper.adsHelper.bannerAd!,
          ),
        ),
      ),
    );
  }
}
