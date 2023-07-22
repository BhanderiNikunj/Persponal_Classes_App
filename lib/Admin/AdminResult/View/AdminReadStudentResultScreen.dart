import 'package:classes_app/Admin/AdminResult/Model/AdminStudentUidModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdminReadStudentResultScreen extends StatefulWidget {
  const AdminReadStudentResultScreen({super.key});

  @override
  State<AdminReadStudentResultScreen> createState() =>
      _AdminReadStudentResultScreenState();
}

class _AdminReadStudentResultScreenState
    extends State<AdminReadStudentResultScreen> {
  AdminStudentUidModel r1 = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Container(
                height: 100.sp,
                alignment: Alignment.center,
                // color: Colors.black12,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${r1.name}",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Std :- ${r1.std}",
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    '/addResult',
                    arguments: r1,
                  );
                },
                child: allButton(
                  string: "Result",
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: StreamBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        "${snapshot.error}",
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return CircularProgressIndicator();
                        },
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
      ),
    );
  }
}
