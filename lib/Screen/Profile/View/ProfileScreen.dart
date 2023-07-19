import 'dart:typed_data';

import 'package:classes_app/Screen/Profile/Controllor/ProfileControllor.dart';
import 'package:classes_app/Screen/Profile/Model/ProfileModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

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
        body: StreamBuilder(
          stream: profileControllor.readUserDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                ),
              );
            } else if (snapshot.hasData) {
              profileControllor.detailList.clear();
              for (var x in snapshot.data!.docs) {
                ProfileModel p1 = ProfileModel(
                  image: x['image'],
                  adminUser: x['adminUser'],
                  email: x['email'],
                  mobile: x['mobile'],
                  name: x['name'],
                  surname: x['surname'],
                  key: x.id,
                );

                profileControllor.detailList.add(p1);
              }

              return Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "Assets/Images/bright_op.png",
                      height: 200.sp,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50.sp,
                        decoration: BoxDecoration(
                          color: Color(0xffE85720),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25.sp),
                            bottomLeft: Radius.circular(25.sp),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.verified_user,
                                size: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Profile Page",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    ProfileModel p1 = ProfileModel(
                                      surname: profileControllor
                                          .detailList[0].surname,
                                      name:
                                          profileControllor.detailList[0].name,
                                      mobile: profileControllor
                                          .detailList[0].mobile,
                                      email:
                                          profileControllor.detailList[0].email,
                                      adminUser: 1,
                                      image:
                                          profileControllor.detailList[0].image,
                                      key: profileControllor.detailList[0].key,
                                      checkUpdate: 1,
                                    );

                                    Get.toNamed(
                                      '/addUserDetail',
                                      arguments: p1,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Column(
                          children: [
                            Container(
                              height: 150.sp,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: Colors.black12,
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 10.sp),
                                  CircleAvatar(
                                    radius: 40.sp,
                                    backgroundImage: MemoryImage(
                                      Uint8List.fromList(
                                        profileControllor
                                            .detailList[0].image!.codeUnits,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.sp),
                                  Text(
                                    profileControllor.detailList.isNotEmpty
                                        ? "${profileControllor.detailList[0].name} ${profileControllor.detailList[0].surname}"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10.sp),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.sp),
                            Container(
                              height: 50.sp,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: Colors.black12,
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                    ),
                                    SizedBox(width: 15.sp),
                                    Text(
                                      "${profileControllor.detailList[0].mobile}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15.sp),
                            Container(
                              height: 50.sp,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: Colors.black12,
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                    ),
                                    SizedBox(width: 15.sp),
                                    Text(
                                      "${profileControllor.detailList[0].email}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15.sp),
                            Container(
                              height: 50.sp,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: Colors.black12,
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                    ),
                                    SizedBox(width: 15.sp),
                                    Text(
                                      "${profileControllor.detailList[0].email}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15.sp),
                            InkWell(
                              onTap: () {
                                FirebaseHelper.firebaseHelper.signOut();
                              },
                              child: Container(
                                height: 50.sp,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Colors.black12,
                                ),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.all(10.sp),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.logout_outlined,
                                      ),
                                      SizedBox(width: 15.sp),
                                      Text(
                                        "Log Out",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
