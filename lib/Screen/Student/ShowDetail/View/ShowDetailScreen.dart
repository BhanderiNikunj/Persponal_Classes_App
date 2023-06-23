import 'dart:typed_data';
import 'package:classes_app/Screen/Student/AddStudent/Model/StudentModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ShowDetailScreen extends StatefulWidget {
  const ShowDetailScreen({super.key});

  @override
  State<ShowDetailScreen> createState() => _ShowDetailScreenState();
}

class _ShowDetailScreenState extends State<ShowDetailScreen> {
  StudentModel s1 = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250.sp,
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
                    bottomRight: Radius.circular(25.sp),
                    bottomLeft: Radius.circular(25.sp),
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60.sp,
                      backgroundImage: MemoryImage(
                        Uint8List.fromList(
                          s1.image!.codeUnits,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Text(
                      "${s1.f_name} ${s1.l_name}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 5.sp),
                    Text(
                      "class :- ${s1.std}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.sp),
                    bottomLeft: Radius.circular(25.sp),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Father Name     :-    ${s1.father_name}",
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Divider(
                        color: Colors.black45,
                      ),
                      SizedBox(height: 5.sp),
                      Container(
                        width: 275.sp,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "Email Id              :-    ${s1.email_id}",
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Divider(
                        color: Colors.black45,
                      ),
                      SizedBox(height: 5.sp),
                      // SizedBox(height: 10.sp),
                      Text(
                        "Mobile No          :-    ${s1.mobile_no}",
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Divider(
                        color: Colors.black45,
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        "Address              :-    ${s1.address}",
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(height: 5.sp),

                      Divider(
                        color: Colors.black45,
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        "Total Fees          :-    ${s1.total_fees}",
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Divider(
                        color: Colors.black45,
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        "Paid Fees           :-    ${s1.paid_fees}",
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Divider(
                        color: Colors.black45,
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        "Less Fees           :-    ${s1.total_fees! - s1.paid_fees!}",
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Divider(
                        color: Colors.black45,
                      ),
                      SizedBox(height: 5.sp),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
