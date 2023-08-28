import 'package:classes_app/Controllors/ProfileControllor.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  return InkWell(
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
                    child: Text(
                      "${profileControllor.userDetail[0].firstName} ${profileControllor.userDetail[0].lastName}",
                      style: GoogleFonts.archivo(),
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
