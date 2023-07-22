import 'dart:math';
import 'package:classes_app/Admin/AdminMassage/Model/AdminMassageModel.dart';
import 'package:classes_app/User/UserMassage/Controllor/UserMassageControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserMassageScreen extends StatefulWidget {
  const UserMassageScreen({super.key});

  @override
  State<UserMassageScreen> createState() => _UserMassageScreenState();
}

class _UserMassageScreenState extends State<UserMassageScreen> {
  UserMassageControllor massageControllor = Get.put(
    UserMassageControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40.sp,
                      width: 40.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff272cff),
                      ),
                    ),
                  ),
                  SizedBox(width: 65.sp),
                  Center(
                    child: Text(
                      "Read Massage",
                      style: TextStyle(
                        fontSize: 15.sp,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: massageControllor.readMassage(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "${snapshot.error}",
                    );
                  } else if (snapshot.hasData) {
                    massageControllor.massageList.clear();

                    for (var x in snapshot.data!.docs) {
                      AdminMassageModel m1 = AdminMassageModel(
                        date: x['date'],
                        msg: x['msg'],
                        key: x.id,
                        time: x['time'],
                      );

                      massageControllor.massageList.add(m1);
                    }

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.sp),
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
                            child: Column(
                              children: [
                                Container(
                                  height: 110.sp,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.sp),
                                      topRight: Radius.circular(10.sp),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        "${massageControllor.massageList[index].msg}",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30.sp,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.sp),
                                      bottomRight: Radius.circular(10.sp),
                                    ),
                                    color: Colors.black12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(),
                                      Row(
                                        children: [
                                          Text(
                                            "${massageControllor.massageList[index].date}",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "  ",
                                          ),
                                          Text(
                                            "${massageControllor.massageList[index].time}   ",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: massageControllor.massageList.length,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
