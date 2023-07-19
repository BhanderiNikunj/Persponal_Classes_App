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
                  key: x.id,
                );

                profileControllor.detailList.add(p1);
              }

              // return Column(
              //   children: [
              //     Container(
              //       height: 250.sp,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           transform: GradientRotation(100),
              //           colors: [
              //             Color(0xff2ED0FF),
              //             Color(0xff50AFFF),
              //             Color(0xff6E92FF),
              //             Color(0xff7E82FF),
              //             Color(0xff7E82FF),
              //           ],
              //         ),
              //         borderRadius: BorderRadius.only(
              //           bottomRight: Radius.circular(30.sp),
              //           bottomLeft: Radius.circular(30.sp),
              //         ),
              //       ),
              //       child: Column(
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               IconButton(
              //                 onPressed: () {
              //                   print(profileControllor.detailList[0].key);
              //                   ProfileModel p1 = ProfileModel(
              //                     image: profileControllor.detailList[0].image,
              //                     adminUser:
              //                         profileControllor.detailList[0].adminUser,
              //                     email: profileControllor.detailList[0].email,
              //                     mobile:
              //                         profileControllor.detailList[0].mobile,
              //                     name: profileControllor.detailList[0].name,
              //                     key: profileControllor.detailList[0].key,
              //                     surname:
              //                         profileControllor.detailList[0].surname,
              //                     checkUpdate: 1,
              //                   );
              //                   Get.toNamed(
              //                     '/addUserDetail',
              //                     arguments: p1,
              //                   );
              //                 },
              //                 icon: Icon(
              //                   Icons.edit,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 15.sp),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               CircleAvatar(
              //                 backgroundImage: MemoryImage(
              //                   Uint8List.fromList(
              //                     profileControllor
              //                         .detailList[0].image!.codeUnits,
              //                   ),
              //                 ),
              //                 radius: 50.sp,
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 15.sp),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Column(
              //                 children: [
              //                   Text(
              //                     "${profileControllor.detailList[0].name}",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 20.sp,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                   SizedBox(height: 10.sp),
              //                   Text(
              //                     "${profileControllor.detailList[0].surname}",
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                   SizedBox(height: 10.sp),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       height: 250.sp,
              //       width: double.infinity,
              //       decoration: BoxDecoration(),
              //       child: Padding(
              //         padding: EdgeInsets.all(15.sp),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Divider(
              //               color: Colors.black45,
              //               height: 3.sp,
              //             ),
              //             SizedBox(height: 10.sp),
              //             InkWell(
              //               onTap: () {
              //                 profileControllor.signOut();
              //               },
              //               child: Row(
              //                 children: [
              //                   Icon(
              //                     Icons.logout,
              //                   ),
              //                   SizedBox(width: 10.sp),
              //                   Container(
              //                     alignment: Alignment.centerLeft,
              //                     height: 30.sp,
              //                     child: Text(
              //                       "Log Out",
              //                       style: TextStyle(
              //                         color: Colors.black,
              //                         fontSize: 15.sp,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             SizedBox(height: 10.sp),
              //             Divider(
              //               color: Colors.black45,
              //               height: 3.sp,
              //             ),
              //             SizedBox(height: 10.sp),
              //             InkWell(
              //               onTap: () {
              //                 Get.toNamed('/image');
              //               },
              //               child: Row(
              //                 children: [
              //                   Icon(
              //                     Icons.image,
              //                   ),
              //                   SizedBox(width: 10.sp),
              //                   Container(
              //                     alignment: Alignment.centerLeft,
              //                     height: 30.sp,
              //                     child: Text(
              //                       "Add Image",
              //                       style: TextStyle(
              //                         color: Colors.black,
              //                         fontSize: 15.sp,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // );

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
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back,
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
                                      surname:
                                      profileControllor.detailList[0].surname,
                                      name: profileControllor.detailList[0].name,
                                      mobile:
                                      profileControllor.detailList[0].mobile,
                                      email: profileControllor.detailList[0].email,
                                      adminUser:
                                      profileControllor.detailList[0].adminUser,
                                      image: profileControllor.detailList[0].image,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            SizedBox(
                              height: 15.sp,
                            ),
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
