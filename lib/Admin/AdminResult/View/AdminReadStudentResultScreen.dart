import 'package:classes_app/Admin/AdminResult/Controllor/AdminResultControllor.dart';
import 'package:classes_app/Admin/AdminResult/Model/AdminResultModel.dart';
import 'package:classes_app/Admin/AdminResult/Model/AdminStudentUidModel.dart';
import 'package:classes_app/Admin/AdminStudent/readStudent/Controllor/readStudentControllor.dart';
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

  AdminResultControllor adminResultControllor = Get.put(
    AdminResultControllor(),
  );

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
                  stream: adminResultControllor.readResult(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        "${snapshot.error}",
                      );
                    } else if (snapshot.hasData) {
                      adminResultControllor.resultList.clear();
                      for (var x in snapshot.data!.docs) {
                        AdminResultModel a1 = AdminResultModel(
                          total: x['total'],
                          uid: x['uid'],
                          english: x['eng'],
                          key: x.id,
                          science: x['sci'],
                          socialScience: x['ss'],
                          totalOutOf: x['totalOutOf'],
                          math: x['math'],
                        );

                        adminResultControllor.resultList.add(a1);
                      }
                      return Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                decoration: BoxDecoration(),
                                alignment: Alignment.center,
                                child: Text(
                                  "Subject",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "Math",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "SS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "Sci",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "Eng",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "Total",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.sp),
                          Column(
                            children: [
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "Total",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "30",
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "30",
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "30",
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "30",
                                ),
                              ),
                              Container(
                                height: 30.sp,
                                width: 50.sp,
                                alignment: Alignment.center,
                                child: Text(
                                  "120",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.sp),
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  adminResultControllor.resultList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return adminResultControllor
                                            .resultList[index].uid !=
                                        r1.uid
                                    ? Container()
                                    : Row(
                                        children: [
                                          SizedBox(width: 10.sp),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30.sp,
                                                width: 50.sp,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Mark",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 30.sp,
                                                width: 50.sp,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "${adminResultControllor.resultList[index].math}",
                                                ),
                                              ),
                                              Container(
                                                height: 30.sp,
                                                width: 50.sp,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "${adminResultControllor.resultList[index].socialScience}",
                                                ),
                                              ),
                                              Container(
                                                height: 30.sp,
                                                width: 50.sp,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "${adminResultControllor.resultList[index].science}",
                                                ),
                                              ),
                                              Container(
                                                height: 30.sp,
                                                width: 50.sp,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "${adminResultControllor.resultList[index].english}",
                                                ),
                                              ),
                                              Container(
                                                height: 30.sp,
                                                width: 50.sp,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "${adminResultControllor.resultList[index].totalOutOf}",
                                                ),
                                              ),
                                              Container(
                                                height: 30.sp,
                                                width: 50.sp,
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                  onPressed: () {
                                                    AdminResultModel a1 =
                                                        AdminResultModel(
                                                      key: adminResultControllor
                                                          .resultList[index]
                                                          .key,
                                                    );
                                                    adminResultControllor
                                                        .deleteStudent(
                                                      a1: a1,
                                                    );
                                                  },
                                                  icon: Icon(
                                                      Icons.delete_outline),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                              },
                            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
