import 'dart:math';
import 'package:classes_app/Screen/Student/AddStudent/Model/StudentModel.dart';
import 'package:classes_app/Screen/Student/readStudent/Controllo/readStudentControllor.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class readStudentScreen extends StatefulWidget {
  const readStudentScreen({Key? key}) : super(key: key);

  @override
  State<readStudentScreen> createState() => _readStudentScreenState();
}

class _readStudentScreenState extends State<readStudentScreen> {
  ReadStudentControllor readStudentControllor = Get.put(
    ReadStudentControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseHelper.firebaseHelper.readStudentDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                "${snapshot.error}",
              );
            } else if (snapshot.hasData) {
              var snapData = snapshot.data as QuerySnapshot;

              readStudentControllor.StudentDataList.clear();

              for (var Data in snapData.docs) {
                StudentModel s1 = StudentModel(
                  total_fees: int.parse("${Data['total_fees']}"),
                  //
                  paid_fees: int.parse("${Data['paid_fees']}"),
                  //
                  email_id: Data['email_id'],
                  //
                  mobile_no: Data['mobile_no'],
                  //
                  l_name: Data['l_name'],
                  //
                  f_name: Data['f_name'],
                  //
                  image: Data['image'],
                  //
                  father_name: Data['father'],
                  //
                  key: Data.id,
                  //
                  address: Data['address'],
                  //
                  std: Data['std'],
                );

                readStudentControllor.StudentDataList.add(s1);
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        StudentModel s1 = StudentModel(
                          image: readStudentControllor
                              .StudentDataList[index].image,
                          key: readStudentControllor.StudentDataList[index].key,
                          email_id: readStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: readStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: readStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: readStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: readStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: readStudentControllor
                              .StudentDataList[index].total_fees,
                          address: readStudentControllor
                              .StudentDataList[index].address,
                          std: readStudentControllor.StudentDataList[index].std,
                          father_name: readStudentControllor
                              .StudentDataList[index].father_name,
                        );
                        Get.toNamed(
                          '/showDetail',
                          arguments: s1,
                        );
                      },
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
                        child: Row(
                          children: [
                            SizedBox(width: 10.sp),
                            CircleAvatar(
                              backgroundImage: MemoryImage(
                                Uint8List.fromList(
                                  readStudentControllor
                                      .StudentDataList[index].image!.codeUnits,
                                ),
                              ),
                              radius: 25.sp,
                            ),
                            SizedBox(
                              width: 10.sp,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    "Name :- ${readStudentControllor.StudentDataList[index].f_name} ${readStudentControllor.StudentDataList[index].l_name}",
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${readStudentControllor.StudentDataList[index].mobile_no}",
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${readStudentControllor.StudentDataList[index].email_id}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15.sp,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    StudentModel s1 = StudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: "nikunj",
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
                                    // readStudentControllor.updateStudentDetail(
                                    //   s1: s1,
                                    // );
                                    print(s1.isCheck);
                                    Get.toNamed(
                                      '/addStudent',
                                      arguments: s1,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    StudentModel s1 = StudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    readStudentControllor.deleteDetail(
                                      s1: s1,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: readStudentControllor.StudentDataList.length,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            StudentModel s1 = StudentModel(
              isCheck: 0,
            );

            Get.toNamed(
              '/addStudent',
              arguments: s1,
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
