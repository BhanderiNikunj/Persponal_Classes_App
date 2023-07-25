import 'dart:math';
import 'package:classes_app/Admin/AdminStudent/AdminAddStudent/Model/AdminStudentModel.dart';
import 'package:classes_app/Admin/AdminStudent/readStudent/Controllor/readStudentControllor.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdminReadStudentScreen extends StatefulWidget {
  const AdminReadStudentScreen({Key? key}) : super(key: key);

  @override
  State<AdminReadStudentScreen> createState() => _AdminReadStudentScreenState();
}

class _AdminReadStudentScreenState extends State<AdminReadStudentScreen>
    with SingleTickerProviderStateMixin {
  AdminReadStudentControllor readStudentControllor = Get.put(
    AdminReadStudentControllor(),
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
            }
            else if (snapshot.hasData) {
              var snapData = snapshot.data as QuerySnapshot;

              readStudentControllor.StudentDataList.clear();

              for (var Data in snapData.docs) {
                AdminStudentModel s1 = AdminStudentModel(
                  total_fees: int.parse("${Data['total_fees']}"),
                  paid_fees: int.parse("${Data['paid_fees']}"),
                  email_id: Data['email_id'],
                  mobile_no: Data['mobile_no'],
                  l_name: Data['l_name'],
                  f_name: Data['f_name'],
                  image: Data['image'],
                  father_name: Data['father'],
                  key: Data.id,
                  address: Data['address'],
                  std: Data['std'],
                );

                readStudentControllor.StudentDataList.add(s1);
              }
              return Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "Assets/Images/bright_op.png",
                      height: 200.sp,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 50.sp,
                          decoration: BoxDecoration(
                            color: Color(0xffE85720),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25.sp),
                              bottomLeft: Radius.circular(25.sp),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 60.sp,
                              ),
                              Text(
                                "Student Detail",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 150,
                              child: Obx(
                                () => DropdownButton(
                                  isExpanded: true,
                                  value: readStudentControllor.checkStd.value,
                                  items: [
                                    DropdownMenuItem(
                                      value: 0,
                                      child: Text(
                                        "All",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 1,
                                      child: Text(
                                        "Std 1",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 2,
                                      child: Text(
                                        "Std 2",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 3,
                                      child: Text(
                                        "Std 3",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 4,
                                      child: Text(
                                        "Std 4",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 5,
                                      child: Text(
                                        "Std 5",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 6,
                                      child: Text(
                                        "Std 6",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 7,
                                      child: Text(
                                        "Std 7",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 8,
                                      child: Text(
                                        "Std 8",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 9,
                                      child: Text(
                                        "Std 9",
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 10,
                                      child: Text(
                                        "Std 10",
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    readStudentControllor.checkStd.value =
                                        value!;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Obx(
                          () => std(
                            readStudentControllor.checkStd.value,
                          ),
                        ),
                      ],
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff01957f),
          onPressed: () {
            AdminStudentModel s1 = AdminStudentModel(
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

  Widget std(
    int std,
  ) {
    if (std == 1) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return readStudentControllor.StudentDataList[index].std != 1
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
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
                                    AdminStudentModel s1 = AdminStudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      address: readStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: readStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: readStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: readStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
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
                                    AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
    else if (std == 2) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return readStudentControllor.StudentDataList[index].std != 2
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
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
                                    AdminStudentModel s1 = AdminStudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      address: readStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: readStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: readStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: readStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
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
                                    AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
    else if (std == 3) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return readStudentControllor.StudentDataList[index].std != 3
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
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
                                    AdminStudentModel s1 = AdminStudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      address: readStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: readStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: readStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: readStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
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
                                    AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
    else if (std == 4) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return readStudentControllor.StudentDataList[index].std != 4
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
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
                                    AdminStudentModel s1 = AdminStudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      address: readStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: readStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: readStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: readStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
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
                                    AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
    else if (std == 5) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return readStudentControllor.StudentDataList[index].std != 5
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
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
                                    AdminStudentModel s1 = AdminStudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      address: readStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: readStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: readStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: readStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
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
                                    AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
    else if (std == 6) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return readStudentControllor.StudentDataList[index].std != 6
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
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
                                    AdminStudentModel s1 = AdminStudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      address: readStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: readStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: readStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: readStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
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
                                    AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
    else if (std == 7) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return readStudentControllor.StudentDataList[index].std != 7
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
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
                                    AdminStudentModel s1 = AdminStudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      address: readStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: readStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: readStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: readStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
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
                                    AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
    else if (std == 8) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return readStudentControllor.StudentDataList[index].std != 8
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
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
                                    AdminStudentModel s1 = AdminStudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      address: readStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: readStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: readStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: readStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
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
                                    AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
    else if (std == 9) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return readStudentControllor.StudentDataList[index].std != 9
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
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
                                    AdminStudentModel s1 = AdminStudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      address: readStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: readStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: readStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: readStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
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
                                    AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
    else if (std == 10) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return readStudentControllor.StudentDataList[index].std != 10
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
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
                                    AdminStudentModel s1 = AdminStudentModel(
                                      key: readStudentControllor
                                          .StudentDataList[index].key,
                                      image: readStudentControllor
                                          .StudentDataList[index].image,
                                      address: readStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: readStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: readStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: readStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: readStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: readStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: readStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: readStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: readStudentControllor
                                          .StudentDataList[index].total_fees,
                                      isCheck: 1,
                                    );
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
                                    AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
    else {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10.sp),
              child: InkWell(
                onTap: () {
                  AdminStudentModel s1 = AdminStudentModel(
                    image: readStudentControllor.StudentDataList[index].image,
                    key: readStudentControllor.StudentDataList[index].key,
                    email_id:
                        readStudentControllor.StudentDataList[index].email_id,
                    f_name: readStudentControllor.StudentDataList[index].f_name,
                    l_name: readStudentControllor.StudentDataList[index].l_name,
                    mobile_no:
                        readStudentControllor.StudentDataList[index].mobile_no,
                    paid_fees:
                        readStudentControllor.StudentDataList[index].paid_fees,
                    total_fees:
                        readStudentControllor.StudentDataList[index].total_fees,
                    address:
                        readStudentControllor.StudentDataList[index].address,
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
                              AdminStudentModel s1 = AdminStudentModel(
                                key: readStudentControllor
                                    .StudentDataList[index].key,
                                image: readStudentControllor
                                    .StudentDataList[index].image,
                                address: readStudentControllor
                                    .StudentDataList[index].address,
                                father_name: readStudentControllor
                                    .StudentDataList[index].father_name,
                                std: readStudentControllor
                                    .StudentDataList[index].std,
                                l_name: readStudentControllor
                                    .StudentDataList[index].l_name,
                                mobile_no: readStudentControllor
                                    .StudentDataList[index].mobile_no,
                                f_name: readStudentControllor
                                    .StudentDataList[index].f_name,
                                email_id: readStudentControllor
                                    .StudentDataList[index].email_id,
                                paid_fees: readStudentControllor
                                    .StudentDataList[index].paid_fees,
                                total_fees: readStudentControllor
                                    .StudentDataList[index].total_fees,
                                isCheck: 1,
                              );
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
                              AdminStudentModel s1 = AdminStudentModel(
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
        ),
      );
    }
  }
}