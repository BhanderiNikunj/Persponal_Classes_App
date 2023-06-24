import 'dart:typed_data';

import 'package:classes_app/Screen/Profile/Controllor/ProfileControllor.dart';
import 'package:classes_app/Screen/Profile/Model/ProfileModel.dart';
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
                );

                profileControllor.detailList.add(p1);
              }

              return Column(
                children: [
                  Container(
                    height: 250.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        transform: GradientRotation(100),
                        colors: [
                          Color(0xff2ED0FF),
                          Color(0xff50AFFF),
                          Color(0xff6E92FF),
                          Color(0xff7E82FF),
                          Color(0xff7E82FF),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.sp),
                        bottomLeft: Radius.circular(30.sp),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                ProfileModel p1 = ProfileModel(
                                  image: profileControllor.detailList[0].image,
                                  adminUser:
                                      profileControllor.detailList[0].adminUser,
                                  email: profileControllor.detailList[0].email,
                                  mobile:
                                      profileControllor.detailList[0].mobile,
                                  name: profileControllor.detailList[0].name,
                                  surname:
                                      profileControllor.detailList[0].surname,
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
                        SizedBox(height: 15.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: MemoryImage(
                                Uint8List.fromList(
                                  profileControllor
                                      .detailList[0].image!.codeUnits,
                                ),
                              ),
                              radius: 50.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 15.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "${profileControllor.detailList[0].name}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10.sp),
                                Text(
                                  "${profileControllor.detailList[0].surname}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10.sp),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(),
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
