import 'dart:math';

import 'package:classes_app/Admin/AdminStudent/AdminAddStudent/Model/AdminStudentModel.dart';
import 'package:classes_app/Admin/AdminStudent/readStudent/Controllor/readStudentControllor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminReadStudentScreen extends StatefulWidget {
  const AdminReadStudentScreen({super.key});

  @override
  State<AdminReadStudentScreen> createState() => _AdminReadStudentScreenState();
}

class _AdminReadStudentScreenState extends State<AdminReadStudentScreen> {
  AdminReadStudentControllor adminReadStudentControllor = Get.put(
    AdminReadStudentControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                ),
              );
            } else if (snapshot.hasData) {
              adminReadStudentControllor.StudentDataList.clear();
              for (var x in snapshot.data!.docs) {
                AdminStudentModel s1 = AdminStudentModel(
                  total_fees: int.parse("${x['total_fees']}"),
                  paid_fees: int.parse("${x['paid_fees']}"),
                  email_id: x['email_id'],
                  mobile_no: x['mobile_no'],
                  l_name: x['l_name'],
                  f_name: x['f_name'],
                  image: x['image'],
                  father_name: x['father'],
                  key: x.id,
                  address: x['address'],
                  std: x['std'],
                );

                adminReadStudentControllor.StudentDataList.add(
                  s1,
                );
              }

              return Column(
                children: [
                  Container(
                    height: 50.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.sp),
                          bottomRight: Radius.circular(20.sp)),
                      color: Color(0xffE85720),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.offAndToNamed('/home');
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Student List",
                                style: GoogleFonts.archivo(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   height: 50.sp,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(20.sp),
                  //         bottomRight: Radius.circular(20.sp)),
                  //     color: Color(0xffE85720),
                  //   ),
                  //   child: Stack(
                  //     children: [
                  //       Center(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               "Student List",
                  //               style: TextStyle(
                  //                 fontSize: 15.sp,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 150,
                        child: Obx(
                          () => DropdownButton(
                            isExpanded: true,
                            value: adminReadStudentControllor.checkStd.value,
                            items: [
                              DropdownMenuItem(
                                value: 0,
                                child: Text(
                                  "All",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 1,
                                child: Text(
                                  "Std 1",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text(
                                  "Std 2",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text(
                                  "Std 3",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text(
                                  "Std 4",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 5,
                                child: Text(
                                  "Std 5",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 6,
                                child: Text(
                                  "Std 6",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 7,
                                child: Text(
                                  "Std 7",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 8,
                                child: Text(
                                  "Std 8",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 9,
                                child: Text(
                                  "Std 9",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 10,
                                child: Text(
                                  "Std 10",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              adminReadStudentControllor.checkStd.value =
                                  value!;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  stdList(
                    std: adminReadStudentControllor.checkStd.value,
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          stream: adminReadStudentControllor.readStudentDetail(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AdminStudentModel a1 = AdminStudentModel(
              isCheck: 0,
            );
            Get.toNamed(
              '/addStudent',
              arguments: a1,
            );
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }

  Widget stdList({
    required int std,
  }) {
    if (std == 1) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return adminReadStudentControllor.StudentDataList[index].std != 1
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
                          image: adminReadStudentControllor
                              .StudentDataList[index].image,
                          key: adminReadStudentControllor
                              .StudentDataList[index].key,
                          email_id: adminReadStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: adminReadStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: adminReadStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: adminReadStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: adminReadStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: adminReadStudentControllor
                              .StudentDataList[index].total_fees,
                          address: adminReadStudentControllor
                              .StudentDataList[index].address,
                          std: adminReadStudentControllor
                              .StudentDataList[index].std,
                          father_name: adminReadStudentControllor
                              .StudentDataList[index].father_name,
                          isCheck: 1,
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
                                  adminReadStudentControllor
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
                                    "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                                    style: GoogleFonts.archivo(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                                  style: GoogleFonts.archivo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
                                    style: GoogleFonts.archivo(
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                      image: adminReadStudentControllor
                                          .StudentDataList[index].image,
                                      address: adminReadStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: adminReadStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: adminReadStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: adminReadStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: adminReadStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: adminReadStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: adminReadStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: adminReadStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: adminReadStudentControllor
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    } else if (std == 2) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return adminReadStudentControllor.StudentDataList[index].std != 2
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
                          image: adminReadStudentControllor
                              .StudentDataList[index].image,
                          key: adminReadStudentControllor
                              .StudentDataList[index].key,
                          email_id: adminReadStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: adminReadStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: adminReadStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: adminReadStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: adminReadStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: adminReadStudentControllor
                              .StudentDataList[index].total_fees,
                          address: adminReadStudentControllor
                              .StudentDataList[index].address,
                          std: adminReadStudentControllor
                              .StudentDataList[index].std,
                          father_name: adminReadStudentControllor
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
                                  adminReadStudentControllor
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
                                    "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                      image: adminReadStudentControllor
                                          .StudentDataList[index].image,
                                      address: adminReadStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: adminReadStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: adminReadStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: adminReadStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: adminReadStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: adminReadStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: adminReadStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: adminReadStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: adminReadStudentControllor
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    } else if (std == 3) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return adminReadStudentControllor.StudentDataList[index].std != 3
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
                          image: adminReadStudentControllor
                              .StudentDataList[index].image,
                          key: adminReadStudentControllor
                              .StudentDataList[index].key,
                          email_id: adminReadStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: adminReadStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: adminReadStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: adminReadStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: adminReadStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: adminReadStudentControllor
                              .StudentDataList[index].total_fees,
                          address: adminReadStudentControllor
                              .StudentDataList[index].address,
                          std: adminReadStudentControllor
                              .StudentDataList[index].std,
                          father_name: adminReadStudentControllor
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
                                  adminReadStudentControllor
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
                                    "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                      image: adminReadStudentControllor
                                          .StudentDataList[index].image,
                                      address: adminReadStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: adminReadStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: adminReadStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: adminReadStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: adminReadStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: adminReadStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: adminReadStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: adminReadStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: adminReadStudentControllor
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    } else if (std == 4) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return adminReadStudentControllor.StudentDataList[index].std != 4
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
                          image: adminReadStudentControllor
                              .StudentDataList[index].image,
                          key: adminReadStudentControllor
                              .StudentDataList[index].key,
                          email_id: adminReadStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: adminReadStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: adminReadStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: adminReadStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: adminReadStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: adminReadStudentControllor
                              .StudentDataList[index].total_fees,
                          address: adminReadStudentControllor
                              .StudentDataList[index].address,
                          std: adminReadStudentControllor
                              .StudentDataList[index].std,
                          father_name: adminReadStudentControllor
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
                                  adminReadStudentControllor
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
                                    "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                      image: adminReadStudentControllor
                                          .StudentDataList[index].image,
                                      address: adminReadStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: adminReadStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: adminReadStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: adminReadStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: adminReadStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: adminReadStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: adminReadStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: adminReadStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: adminReadStudentControllor
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    } else if (std == 5) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return adminReadStudentControllor.StudentDataList[index].std != 5
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
                          image: adminReadStudentControllor
                              .StudentDataList[index].image,
                          key: adminReadStudentControllor
                              .StudentDataList[index].key,
                          email_id: adminReadStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: adminReadStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: adminReadStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: adminReadStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: adminReadStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: adminReadStudentControllor
                              .StudentDataList[index].total_fees,
                          address: adminReadStudentControllor
                              .StudentDataList[index].address,
                          std: adminReadStudentControllor
                              .StudentDataList[index].std,
                          father_name: adminReadStudentControllor
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
                                  adminReadStudentControllor
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
                                    "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                      image: adminReadStudentControllor
                                          .StudentDataList[index].image,
                                      address: adminReadStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: adminReadStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: adminReadStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: adminReadStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: adminReadStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: adminReadStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: adminReadStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: adminReadStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: adminReadStudentControllor
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    } else if (std == 6) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return adminReadStudentControllor.StudentDataList[index].std != 6
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
                          image: adminReadStudentControllor
                              .StudentDataList[index].image,
                          key: adminReadStudentControllor
                              .StudentDataList[index].key,
                          email_id: adminReadStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: adminReadStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: adminReadStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: adminReadStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: adminReadStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: adminReadStudentControllor
                              .StudentDataList[index].total_fees,
                          address: adminReadStudentControllor
                              .StudentDataList[index].address,
                          std: adminReadStudentControllor
                              .StudentDataList[index].std,
                          father_name: adminReadStudentControllor
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
                                  adminReadStudentControllor
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
                                    "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                      image: adminReadStudentControllor
                                          .StudentDataList[index].image,
                                      address: adminReadStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: adminReadStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: adminReadStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: adminReadStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: adminReadStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: adminReadStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: adminReadStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: adminReadStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: adminReadStudentControllor
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    } else if (std == 7) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return adminReadStudentControllor.StudentDataList[index].std != 7
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
                          image: adminReadStudentControllor
                              .StudentDataList[index].image,
                          key: adminReadStudentControllor
                              .StudentDataList[index].key,
                          email_id: adminReadStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: adminReadStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: adminReadStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: adminReadStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: adminReadStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: adminReadStudentControllor
                              .StudentDataList[index].total_fees,
                          address: adminReadStudentControllor
                              .StudentDataList[index].address,
                          std: adminReadStudentControllor
                              .StudentDataList[index].std,
                          father_name: adminReadStudentControllor
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
                                  adminReadStudentControllor
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
                                    "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                      image: adminReadStudentControllor
                                          .StudentDataList[index].image,
                                      address: adminReadStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: adminReadStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: adminReadStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: adminReadStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: adminReadStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: adminReadStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: adminReadStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: adminReadStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: adminReadStudentControllor
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    } else if (std == 8) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return adminReadStudentControllor.StudentDataList[index].std != 8
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
                          image: adminReadStudentControllor
                              .StudentDataList[index].image,
                          key: adminReadStudentControllor
                              .StudentDataList[index].key,
                          email_id: adminReadStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: adminReadStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: adminReadStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: adminReadStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: adminReadStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: adminReadStudentControllor
                              .StudentDataList[index].total_fees,
                          address: adminReadStudentControllor
                              .StudentDataList[index].address,
                          std: adminReadStudentControllor
                              .StudentDataList[index].std,
                          father_name: adminReadStudentControllor
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
                                  adminReadStudentControllor
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
                                    "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                      image: adminReadStudentControllor
                                          .StudentDataList[index].image,
                                      address: adminReadStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: adminReadStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: adminReadStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: adminReadStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: adminReadStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: adminReadStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: adminReadStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: adminReadStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: adminReadStudentControllor
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    } else if (std == 9) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return adminReadStudentControllor.StudentDataList[index].std != 9
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
                          image: adminReadStudentControllor
                              .StudentDataList[index].image,
                          key: adminReadStudentControllor
                              .StudentDataList[index].key,
                          email_id: adminReadStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: adminReadStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: adminReadStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: adminReadStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: adminReadStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: adminReadStudentControllor
                              .StudentDataList[index].total_fees,
                          address: adminReadStudentControllor
                              .StudentDataList[index].address,
                          std: adminReadStudentControllor
                              .StudentDataList[index].std,
                          father_name: adminReadStudentControllor
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
                                  adminReadStudentControllor
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
                                    "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                      image: adminReadStudentControllor
                                          .StudentDataList[index].image,
                                      address: adminReadStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: adminReadStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: adminReadStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: adminReadStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: adminReadStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: adminReadStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: adminReadStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: adminReadStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: adminReadStudentControllor
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    } else if (std == 10) {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return adminReadStudentControllor.StudentDataList[index].std != 10
                ? Container()
                : Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: InkWell(
                      onTap: () {
                        AdminStudentModel s1 = AdminStudentModel(
                          image: adminReadStudentControllor
                              .StudentDataList[index].image,
                          key: adminReadStudentControllor
                              .StudentDataList[index].key,
                          email_id: adminReadStudentControllor
                              .StudentDataList[index].email_id,
                          f_name: adminReadStudentControllor
                              .StudentDataList[index].f_name,
                          l_name: adminReadStudentControllor
                              .StudentDataList[index].l_name,
                          mobile_no: adminReadStudentControllor
                              .StudentDataList[index].mobile_no,
                          paid_fees: adminReadStudentControllor
                              .StudentDataList[index].paid_fees,
                          total_fees: adminReadStudentControllor
                              .StudentDataList[index].total_fees,
                          address: adminReadStudentControllor
                              .StudentDataList[index].address,
                          std: adminReadStudentControllor
                              .StudentDataList[index].std,
                          father_name: adminReadStudentControllor
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
                                  adminReadStudentControllor
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
                                    "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                Text(
                                  "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                                ),
                                SizedBox(height: 5.sp),
                                Container(
                                  width: 150.sp,
                                  child: Text(
                                    "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                      image: adminReadStudentControllor
                                          .StudentDataList[index].image,
                                      address: adminReadStudentControllor
                                          .StudentDataList[index].address,
                                      father_name: adminReadStudentControllor
                                          .StudentDataList[index].father_name,
                                      std: adminReadStudentControllor
                                          .StudentDataList[index].std,
                                      l_name: adminReadStudentControllor
                                          .StudentDataList[index].l_name,
                                      mobile_no: adminReadStudentControllor
                                          .StudentDataList[index].mobile_no,
                                      f_name: adminReadStudentControllor
                                          .StudentDataList[index].f_name,
                                      email_id: adminReadStudentControllor
                                          .StudentDataList[index].email_id,
                                      paid_fees: adminReadStudentControllor
                                          .StudentDataList[index].paid_fees,
                                      total_fees: adminReadStudentControllor
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
                                      key: adminReadStudentControllor
                                          .StudentDataList[index].key,
                                    );
                                    adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10.sp),
              child: InkWell(
                onTap: () {
                  AdminStudentModel s1 = AdminStudentModel(
                    image:
                        adminReadStudentControllor.StudentDataList[index].image,
                    key: adminReadStudentControllor.StudentDataList[index].key,
                    email_id: adminReadStudentControllor
                        .StudentDataList[index].email_id,
                    f_name: adminReadStudentControllor
                        .StudentDataList[index].f_name,
                    l_name: adminReadStudentControllor
                        .StudentDataList[index].l_name,
                    mobile_no: adminReadStudentControllor
                        .StudentDataList[index].mobile_no,
                    paid_fees: adminReadStudentControllor
                        .StudentDataList[index].paid_fees,
                    total_fees: adminReadStudentControllor
                        .StudentDataList[index].total_fees,
                    address: adminReadStudentControllor
                        .StudentDataList[index].address,
                    std: adminReadStudentControllor.StudentDataList[index].std,
                    father_name: adminReadStudentControllor
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
                            adminReadStudentControllor
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
                              "Name :- ${adminReadStudentControllor.StudentDataList[index].f_name} ${adminReadStudentControllor.StudentDataList[index].l_name}",
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          Text(
                            "Mobile No :- +91 ${adminReadStudentControllor.StudentDataList[index].mobile_no}",
                          ),
                          SizedBox(height: 5.sp),
                          Container(
                            width: 150.sp,
                            child: Text(
                              "Email Id :- ${adminReadStudentControllor.StudentDataList[index].email_id}",
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
                                key: adminReadStudentControllor
                                    .StudentDataList[index].key,
                                image: adminReadStudentControllor
                                    .StudentDataList[index].image,
                                address: adminReadStudentControllor
                                    .StudentDataList[index].address,
                                father_name: adminReadStudentControllor
                                    .StudentDataList[index].father_name,
                                std: adminReadStudentControllor
                                    .StudentDataList[index].std,
                                l_name: adminReadStudentControllor
                                    .StudentDataList[index].l_name,
                                mobile_no: adminReadStudentControllor
                                    .StudentDataList[index].mobile_no,
                                f_name: adminReadStudentControllor
                                    .StudentDataList[index].f_name,
                                email_id: adminReadStudentControllor
                                    .StudentDataList[index].email_id,
                                paid_fees: adminReadStudentControllor
                                    .StudentDataList[index].paid_fees,
                                total_fees: adminReadStudentControllor
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
                                key: adminReadStudentControllor
                                    .StudentDataList[index].key,
                              );
                              adminReadStudentControllor.deleteDetail(
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
          itemCount: adminReadStudentControllor.StudentDataList.length,
        ),
      );
    }
  }
}
