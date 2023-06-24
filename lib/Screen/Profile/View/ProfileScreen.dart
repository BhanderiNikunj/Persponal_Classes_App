import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                  SizedBox(height: 15.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(radius: 50.sp,),
                    ],
                  ),
                  SizedBox(height: 15.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("1",style: TextStyle(color: Colors.white,),),
                          SizedBox(height: 10.sp),
                          Text("1",style: TextStyle(color: Colors.white,),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
