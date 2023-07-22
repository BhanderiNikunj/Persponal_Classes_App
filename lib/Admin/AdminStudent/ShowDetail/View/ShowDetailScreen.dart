import 'dart:typed_data';
import 'package:classes_app/Admin/AdminStudent/AdminAddStudent/Model/AdminStudentModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminShowDetailScreen extends StatefulWidget {
  const AdminShowDetailScreen({super.key});

  @override
  State<AdminShowDetailScreen> createState() => _AdminShowDetailScreenState();
}

class _AdminShowDetailScreenState extends State<AdminShowDetailScreen> with SingleTickerProviderStateMixin {
  AdminStudentModel s1 = Get.arguments;

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
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        // fontWeight: FontWeight.bold,
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
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "Assets/Images/bright.png",
                      height: 200.sp,
                      opacity: AnimationController(
                        vsync: this,
                        value: 0.2,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mobile No          :-    ${s1.mobile_no}",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  Uri launchUri = Uri(
                                    scheme: "tel",
                                    path: s1.mobile_no,
                                  );
                                  await launchUrl(launchUri);
                                },
                                child: Icon(
                                  Icons.call,
                                ),
                              ),
                            ],
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
            ],
          ),
        ),
      ),
    );
  }

  Widget call(String call) {
    return InkWell(
      onTap: () async {
        Uri lanchUri = Uri(
          scheme: "tel",
          path: call,
        );
        await launchUrl(lanchUri);
      },
      child: Container(
        height: 50,
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Text(
          "Call",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
