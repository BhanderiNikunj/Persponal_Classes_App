import 'dart:math';
import 'package:classes_app/Admin/AdminProfile/Model/AdminProfileModel.dart';
import 'package:classes_app/User/UserHomeWork/Controllor/HomeWorkControllor.dart';
import 'package:classes_app/User/UserHomeWork/Model/UserHomeWorkModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserHomeWorkScreen extends StatefulWidget {
  const UserHomeWorkScreen({super.key});

  @override
  State<UserHomeWorkScreen> createState() => _UserHomeWorkScreenState();
}

class _UserHomeWorkScreenState extends State<UserHomeWorkScreen> {
  UserHomeWorkControllor userHomeWorkControllor = Get.put(
    UserHomeWorkControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              userHomeWorkControllor.homeWorkList.clear();
              for (var x in snapshot.data!.docs) {
                UserHomeWorkModel user = UserHomeWorkModel(
                  title: x['title'],
                  key: x.id,
                  std: x['std'],
                  dueDate: x['dueDate'],
                  subject: x['subject'],
                );

                userHomeWorkControllor.homeWorkList.add(user);
              }

              if (userHomeWorkControllor.homeWorkList.isEmpty) {
                return Container(
                  child: Text("HomeWork Nothing"),
                );
              } else {
                return StreamBuilder(
                  stream: userHomeWorkControllor.readUserDetail(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "${snapshot.error}",
                        ),
                      );
                    } else if (snapshot.hasData) {
                      userHomeWorkControllor.detailList.clear();
                      for (var x in snapshot.data!.docs) {
                        AdminProfileModel a1 = AdminProfileModel(
                          std: x['std'],
                          uid: x['uid'],
                          adminUser: x['adminUser'],
                          key: x.id,
                          name: x['name'],
                          mobile: x['mobile'],
                          email: x['email'],
                          surname: x['surname'],
                          image: x['image'],
                        );

                        userHomeWorkControllor.detailList.add(a1);
                      }
                      return Column(
                        children: [
                          homeWork(
                            std: userHomeWorkControllor.detailList[0].std,
                          ),
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  },
                );
              }
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
          stream: userHomeWorkControllor.readHomeWork(),
        ),
      ),
    );
  }

  Widget homeWork({
    required std,
  }) {

    print("=-===============================================================$std");
    if (std == 1) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return userHomeWorkControllor.homeWorkList[index].std != 1
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      right: 10.sp,
                      top: 10.sp,
                    ),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    } else if (std == 2) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return userHomeWorkControllor.homeWorkList[index].std != 2
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      right: 10.sp,
                      top: 10.sp,
                    ),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    } else if (std == 3) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return userHomeWorkControllor.homeWorkList[index].std != 3
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      right: 10.sp,
                      top: 10.sp,
                    ),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    } else if (std == 4) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return userHomeWorkControllor.homeWorkList[index].std != 4
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      right: 10.sp,
                      top: 10.sp,
                    ),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    } else if (std == 5) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return userHomeWorkControllor.homeWorkList[index].std != 5
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      right: 10.sp,
                      top: 10.sp,
                    ),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    } else if (std == 6) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return userHomeWorkControllor.homeWorkList[index].std != 6
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      right: 10.sp,
                      top: 10.sp,
                    ),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    } else if (std == 7) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return userHomeWorkControllor.homeWorkList[index].std != 7
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      right: 10.sp,
                      top: 10.sp,
                    ),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    } else if (std == 8) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return userHomeWorkControllor.homeWorkList[index].std != 8
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      right: 10.sp,
                      top: 10.sp,
                    ),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    } else if (std == 9) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return userHomeWorkControllor.homeWorkList[index].std != 9
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      right: 10.sp,
                      top: 10.sp,
                    ),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    } else if (std == 10) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return userHomeWorkControllor.homeWorkList[index].std != 10
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 10.sp,
                      right: 10.sp,
                      top: 10.sp,
                    ),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(pi / 4),
                          colors: [
                            Color(0xff2ED0FF),
                            Color(0xff50AFFF),
                            Color(0xff6E92FF),
                            Color(0xff7E82FF),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${userHomeWorkControllor.homeWorkList[index].title}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: 10.sp,
                right: 10.sp,
                top: 10.sp,
              ),
              child: Container(
                height: 80.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                  gradient: LinearGradient(
                    transform: GradientRotation(pi / 4),
                    colors: [
                      Color(0xff2ED0FF),
                      Color(0xff50AFFF),
                      Color(0xff6E92FF),
                      Color(0xff7E82FF),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: userHomeWorkControllor.homeWorkList.length,
        ),
      );
    }
  }
}
