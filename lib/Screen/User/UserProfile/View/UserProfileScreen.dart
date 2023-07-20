import 'package:classes_app/Screen/Profile/Model/ProfileModel.dart';
import 'package:classes_app/Screen/User/UserProfile/Controllor/UserProfileControllor.dart';
import 'package:classes_app/Screen/User/UserProfile/Model/UserProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserProfileControllor userProfileControllor = Get.put(
    UserProfileControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                                    userProfileControllor.UserData[0].surname,
                                name: userProfileControllor.UserData[0].name,
                                mobile:
                                    userProfileControllor.UserData[0].mobile,
                                email: userProfileControllor.UserData[0].email,
                                adminUser:
                                    userProfileControllor.UserData[0].adminUser,
                                image: userProfileControllor.UserData[0].image,
                                key: userProfileControllor.UserData[0].key,
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
                StreamBuilder(
                  stream: userProfileControllor.readUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "${snapshot.error}",
                        ),
                      );
                    } else if (snapshot.hasData) {
                      userProfileControllor.UserData.clear();
                      for (var x in snapshot.data!.docs) {
                        UserProfileModel userProfileModel = UserProfileModel(
                          key: x.id,
                          image: x['image'],
                          adminUser: x['adminUser'],
                          email: x['email'],
                          mobile: x['mobile'],
                          name: x['name'],
                          surname: x['surname'],
                        );

                        userProfileControllor.UserData.add(userProfileModel);
                      }
                      return Padding(
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
                                children: [
                                  SizedBox(height: 10.sp),
                                  CircleAvatar(
                                    radius: 40.sp,
                                    backgroundImage: MemoryImage(
                                      Uint8List.fromList(
                                        userProfileControllor
                                            .UserData[0].image!.codeUnits,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.sp),
                                  Text(
                                    userProfileControllor.UserData.isNotEmpty
                                        ? "${userProfileControllor.UserData[0].name} ${userProfileControllor.UserData[0].surname}"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10.sp),
                                  Text(
                                    userProfileControllor.UserData.isNotEmpty
                                        ? "Std :- 10"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                    ),
                                  ),
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
                                      "${userProfileControllor.UserData[0].mobile}",
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
                                      "${userProfileControllor.UserData[0].email}",
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
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}