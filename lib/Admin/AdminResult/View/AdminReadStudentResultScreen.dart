import 'package:classes_app/Admin/AdminResult/Controllor/AdminResultControllor.dart';
import 'package:classes_app/Admin/AdminResult/Model/AdminResultModel.dart';
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
  AdminResultModel r1 = Get.arguments;

  AdminResultControllor adminResultControllor = Get.put(
    AdminResultControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Container(
                height: 120.sp,
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name :- ${r1.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            "Std :- ${r1.std}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AdminResultModel a1 = AdminResultModel(
                  checkUpdate: 0,
                  uid: r1.uid,
                  name: r1.name,
                  mobile: r1.mobile,
                  std: r1.std,
                );
                Get.toNamed(
                  '/addResult',
                  arguments: a1,
                );
              },
              child: allButton(
                string: "Add",
              ),
            ),
            Container(
              width: 100.w,
              height: 300.sp,
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
                        english: x['english'],
                        key: x.id,
                        science: x['science'],
                        socialScience: x['socialScience'],
                        totalOutOf: x['totalOutOf'],
                        math: x['math'],
                        monthNumber: x['monthNumber'],
                        checkUpdate: 0,
                        name: x['name'],
                        std: x['std'],
                        mobile: x['mobile'],
                      );

                      adminResultControllor.resultList.add(a1);
                    }
                    return Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 60.sp,
                              width: 90.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.black),
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Subject",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 90.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Maths",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 90.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Social Science",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 90.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Science",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 90.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "English",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 90.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Total",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 90.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Edit",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 90.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Delete",
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 30.sp,
                              width: 55.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.black),
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                "Total",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 55.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                "Mark",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 55.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                "30",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 55.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                "30",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 55.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                "30",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 55.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                "30",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 55.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                "120",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 55.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "",
                              ),
                            ),
                            Container(
                              height: 30.sp,
                              width: 55.sp,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                ),
                                color: Colors.black12,
                              ),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "",
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: adminResultControllor.resultList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return adminResultControllor
                                          .resultList[index].uid !=
                                      r1.uid
                                  ? Container()
                                  : Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 30.sp,
                                              width: 80.sp,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(
                                                      color: Colors.black),
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                color: Colors.black12,
                                              ),
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${adminResultControllor.resultList[index].monthNumber}",
                                              ),
                                            ),
                                            Container(
                                              height: 30.sp,
                                              width: 80.sp,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                color: Colors.black12,
                                              ),
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Mark",
                                              ),
                                            ),
                                            Container(
                                              height: 30.sp,
                                              width: 80.sp,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                color: Colors.black12,
                                              ),
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${adminResultControllor.resultList[index].math}",
                                              ),
                                            ),
                                            Container(
                                              height: 30.sp,
                                              width: 80.sp,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                color: Colors.black12,
                                              ),
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${adminResultControllor.resultList[index].socialScience}",
                                              ),
                                            ),
                                            Container(
                                              height: 30.sp,
                                              width: 80.sp,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                color: Colors.black12,
                                              ),
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${adminResultControllor.resultList[index].science}",
                                              ),
                                            ),
                                            Container(
                                              height: 30.sp,
                                              width: 80.sp,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                color: Colors.black12,
                                              ),
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${adminResultControllor.resultList[index].english}",
                                              ),
                                            ),
                                            Container(
                                              height: 30.sp,
                                              width: 80.sp,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                color: Colors.black12,
                                              ),
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${adminResultControllor.resultList[index].totalOutOf}",
                                              ),
                                            ),
                                            Container(
                                              height: 30.sp,
                                              width: 80.sp,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                color: Colors.black12,
                                              ),
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              child: IconButton(
                                                onPressed: () {
                                                  AdminResultModel a1 =
                                                      AdminResultModel(
                                                    monthNumber:
                                                        adminResultControllor
                                                            .resultList[index]
                                                            .monthNumber,
                                                    science:
                                                        adminResultControllor
                                                            .resultList[index]
                                                            .science,
                                                    math: adminResultControllor
                                                        .resultList[index].math,
                                                    socialScience:
                                                        adminResultControllor
                                                            .resultList[index]
                                                            .socialScience,
                                                    english:
                                                        adminResultControllor
                                                            .resultList[index]
                                                            .english,
                                                    totalOutOf:
                                                        adminResultControllor
                                                            .resultList[index]
                                                            .totalOutOf,
                                                    total: adminResultControllor
                                                        .resultList[index]
                                                        .total,
                                                    checkUpdate: 1,
                                                    name: adminResultControllor
                                                        .resultList[index].name,
                                                    mobile:
                                                        adminResultControllor
                                                            .resultList[index]
                                                            .mobile,
                                                    std: adminResultControllor
                                                        .resultList[index].std,
                                                    uid: adminResultControllor
                                                        .resultList[index].uid,
                                                    key: adminResultControllor
                                                        .resultList[index].key,
                                                  );

                                                  Get.toNamed(
                                                    '/addResult',
                                                    arguments: a1,
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 30.sp,
                                              width: 80.sp,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                color: Colors.black12,
                                              ),
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              child: IconButton(
                                                onPressed: () {
                                                  AdminResultModel a1 =
                                                      AdminResultModel(
                                                    key: adminResultControllor
                                                        .resultList[index].key,
                                                  );
                                                  adminResultControllor
                                                      .deleteResult(
                                                    r1: a1,
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                ),
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
    );
  }
}
