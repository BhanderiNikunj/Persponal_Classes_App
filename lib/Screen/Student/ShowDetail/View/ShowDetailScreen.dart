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
        body: Container(
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.sp),
                    bottomLeft: Radius.circular(25.sp),
                  ),
                ),
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 80.sp,
                  backgroundImage: MemoryImage(
                    Uint8List.fromList(
                      s1.image!.codeUnits,
                    ),
                  ),
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
                        "Name           :-    ${s1.f_name}",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Surname            :-    ${s1.l_name}",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Father Name     :-    ${s1.father_name}",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      // SizedBox(height: 10.sp),
                      // Text(
                      //   "Surname            :-    ${s1.l_name}",
                      //   style: TextStyle(
                      //     fontSize: 12.sp,
                      //   ),
                      // ),
                      SizedBox(height: 10.sp),
                      Container(
                        width: 275.sp,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "Email Id              :-    ${s1.email_id}",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Mobile No          :-    ${s1.mobile_no}",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Address             :-    ${s1.address}",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Total Fees         :-    ${s1.total_fees}",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Paid Fees          :-    ${s1.paid_fees}",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Less Fees          :-    ${s1.total_fees! - s1.paid_fees!}",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
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
