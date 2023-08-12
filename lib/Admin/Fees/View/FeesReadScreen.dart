import 'package:classes_app/Controllors/FeesControllor.dart';
import 'package:classes_app/Models/FeesModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FeesReadScreen extends StatefulWidget {
  const  FeesReadScreen({super.key});

  @override
  State<FeesReadScreen> createState() => _FeesReadScreenState();
}

class _FeesReadScreenState extends State<FeesReadScreen> {
  FeesControllor feesControllor = Get.put(
    FeesControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Student Fees",
                ),
                Container(
                  height: 50.sp,
                  child: Row(
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
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    feesControllor.std = "1";
                    listOfFees(
                      std: "1",
                    );
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                ),
                DropdownButton(
                  value: feesControllor.std,
                  items: [
                    DropdownMenuItem(
                      value: "1",
                      child: Text(
                        "Std 1",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text(
                        "Std 2",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "3",
                      child: Text(
                        "Std 3",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "4",
                      child: Text(
                        "Std 4",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "5",
                      child: Text(
                        "Std 5",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "6",
                      child: Text(
                        "Std 6",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "7",
                      child: Text(
                        "Std 7",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "8",
                      child: Text(
                        "Std 8",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "9",
                      child: Text(
                        "Std 9",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "10",
                      child: Text(
                        "Std 10",
                        style: GoogleFonts.archivo(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    feesControllor.std = value!;
                    setState(() {});
                  },
                ),
              ],
            ),
            listOfFees(std: feesControllor.std),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FeesModel f1 = FeesModel(
              check: 0,
            );
            Get.toNamed(
              '/feesAdd',
              arguments: f1,
            );
          },
          backgroundColor: Color(0xff5055C4),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(17.sp),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget listOfFees({std}) {
    return Expanded(
      child: FutureBuilder(
        future: feesControllor.readFees(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              "${snapshot.error}",
            );
          }
          else if (snapshot.hasData) {
            feesControllor.feesList = snapshot.data!;
            return ListView.builder(
              itemCount: feesControllor.feesList.length,
              itemBuilder: (context, index) {
                if (std!.compareTo("1") == 0) {
                  return feesControllor.feesList[index].std.compareTo("$std") !=
                          0
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black12,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                  spreadRadius: 7,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name :- ${feesControllor.feesList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${feesControllor.feesList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 20.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          FeesModel f1 = FeesModel(
                                            firstName: feesControllor
                                                .feesList[index].firstName,
                                            std: feesControllor
                                                .feesList[index].std,
                                            totalFees: feesControllor
                                                .feesList[index].totalFees,
                                            paidFees: feesControllor
                                                .feesList[index].paidFees,
                                            uid: feesControllor
                                                .feesList[index].uid,
                                            id: feesControllor
                                                .feesList[index].id,
                                            lessFees: feesControllor
                                                .feesList[index].lessFees,
                                            check: 1,
                                          );
                                          Get.toNamed(
                                            '/feesAdd',
                                            arguments: f1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          FeesModel f1 = FeesModel(
                                            id: feesControllor
                                                .feesList[index].id,
                                          );

                                          bool check =
                                              await feesControllor.deleteFees(
                                            f1: f1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );

                                            listOfFees(
                                              std: "1",
                                            );
                                          } else {
                                            Get.snackbar(
                                              "Un Success Fully Delete",
                                              "",
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                else if (std!.compareTo("2") == 0) {
                  return feesControllor.feesList[index].std.compareTo("$std") !=
                          0
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black12,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                  spreadRadius: 7,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name :- ${feesControllor.feesList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${feesControllor.feesList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 20.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          FeesModel f1 = FeesModel(
                                            firstName: feesControllor
                                                .feesList[index].firstName,
                                            std: feesControllor
                                                .feesList[index].std,
                                            totalFees: feesControllor
                                                .feesList[index].totalFees,
                                            paidFees: feesControllor
                                                .feesList[index].paidFees,
                                            uid: feesControllor
                                                .feesList[index].uid,
                                            id: feesControllor
                                                .feesList[index].id,
                                            lessFees: feesControllor
                                                .feesList[index].lessFees,
                                            check: 1,
                                          );
                                          Get.toNamed(
                                            '/feesAdd',
                                            arguments: f1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          FeesModel f1 = FeesModel(
                                            id: feesControllor
                                                .feesList[index].id,
                                          );

                                          bool check =
                                              await feesControllor.deleteFees(
                                            f1: f1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );

                                            listOfFees(
                                              std: "2",
                                            );
                                          } else {
                                            Get.snackbar(
                                              "Un Success Fully Delete",
                                              "",
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                else if (std!.compareTo("3") == 0) {
                  return feesControllor.feesList[index].std.compareTo("$std") !=
                          0
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black12,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                  spreadRadius: 7,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name :- ${feesControllor.feesList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${feesControllor.feesList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 20.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          FeesModel f1 = FeesModel(
                                            firstName: feesControllor
                                                .feesList[index].firstName,
                                            std: feesControllor
                                                .feesList[index].std,
                                            totalFees: feesControllor
                                                .feesList[index].totalFees,
                                            paidFees: feesControllor
                                                .feesList[index].paidFees,
                                            uid: feesControllor
                                                .feesList[index].uid,
                                            id: feesControllor
                                                .feesList[index].id,
                                            lessFees: feesControllor
                                                .feesList[index].lessFees,
                                            check: 1,
                                          );
                                          Get.toNamed(
                                            '/feesAdd',
                                            arguments: f1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          FeesModel f1 = FeesModel(
                                            id: feesControllor
                                                .feesList[index].id,
                                          );

                                          bool check =
                                              await feesControllor.deleteFees(
                                            f1: f1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );

                                            listOfFees(
                                              std: "3",
                                            );
                                          } else {
                                            Get.snackbar(
                                              "Un Success Fully Delete",
                                              "",
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                else if (std!.compareTo("4") == 0) {
                  return feesControllor.feesList[index].std.compareTo("$std") !=
                          0
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black12,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                  spreadRadius: 7,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name :- ${feesControllor.feesList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${feesControllor.feesList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 20.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          FeesModel f1 = FeesModel(
                                            firstName: feesControllor
                                                .feesList[index].firstName,
                                            std: feesControllor
                                                .feesList[index].std,
                                            totalFees: feesControllor
                                                .feesList[index].totalFees,
                                            paidFees: feesControllor
                                                .feesList[index].paidFees,
                                            uid: feesControllor
                                                .feesList[index].uid,
                                            id: feesControllor
                                                .feesList[index].id,
                                            lessFees: feesControllor
                                                .feesList[index].lessFees,
                                            check: 1,
                                          );
                                          Get.toNamed(
                                            '/feesAdd',
                                            arguments: f1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          FeesModel f1 = FeesModel(
                                            id: feesControllor
                                                .feesList[index].id,
                                          );

                                          bool check =
                                              await feesControllor.deleteFees(
                                            f1: f1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );

                                            listOfFees(
                                              std: "4",
                                            );
                                          } else {
                                            Get.snackbar(
                                              "Un Success Fully Delete",
                                              "",
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                else if (std!.compareTo("5") == 0) {
                  return feesControllor.feesList[index].std.compareTo("$std") !=
                          0
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black12,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                  spreadRadius: 7,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name :- ${feesControllor.feesList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${feesControllor.feesList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 20.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          FeesModel f1 = FeesModel(
                                            firstName: feesControllor
                                                .feesList[index].firstName,
                                            std: feesControllor
                                                .feesList[index].std,
                                            totalFees: feesControllor
                                                .feesList[index].totalFees,
                                            paidFees: feesControllor
                                                .feesList[index].paidFees,
                                            uid: feesControllor
                                                .feesList[index].uid,
                                            id: feesControllor
                                                .feesList[index].id,
                                            lessFees: feesControllor
                                                .feesList[index].lessFees,
                                            check: 1,
                                          );
                                          Get.toNamed(
                                            '/feesAdd',
                                            arguments: f1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          FeesModel f1 = FeesModel(
                                            id: feesControllor
                                                .feesList[index].id,
                                          );

                                          bool check =
                                              await feesControllor.deleteFees(
                                            f1: f1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );

                                            listOfFees(
                                              std: "5",
                                            );
                                          } else {
                                            Get.snackbar(
                                              "Un Success Fully Delete",
                                              "",
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                else if (std!.compareTo("6") == 0) {
                  return feesControllor.feesList[index].std.compareTo("$std") !=
                          0
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black12,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                  spreadRadius: 7,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name :- ${feesControllor.feesList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${feesControllor.feesList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 20.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          FeesModel f1 = FeesModel(
                                            firstName: feesControllor
                                                .feesList[index].firstName,
                                            std: feesControllor
                                                .feesList[index].std,
                                            totalFees: feesControllor
                                                .feesList[index].totalFees,
                                            paidFees: feesControllor
                                                .feesList[index].paidFees,
                                            uid: feesControllor
                                                .feesList[index].uid,
                                            id: feesControllor
                                                .feesList[index].id,
                                            lessFees: feesControllor
                                                .feesList[index].lessFees,
                                            check: 1,
                                          );
                                          Get.toNamed(
                                            '/feesAdd',
                                            arguments: f1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          FeesModel f1 = FeesModel(
                                            id: feesControllor
                                                .feesList[index].id,
                                          );

                                          bool check =
                                              await feesControllor.deleteFees(
                                            f1: f1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );

                                            listOfFees(
                                              std: "6",
                                            );
                                          } else {
                                            Get.snackbar(
                                              "Un Success Fully Delete",
                                              "",
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                else if (std!.compareTo("7") == 0) {
                  return feesControllor.feesList[index].std.compareTo("$std") !=
                          0
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black12,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                  spreadRadius: 7,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name :- ${feesControllor.feesList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${feesControllor.feesList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 20.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          FeesModel f1 = FeesModel(
                                            firstName: feesControllor
                                                .feesList[index].firstName,
                                            std: feesControllor
                                                .feesList[index].std,
                                            totalFees: feesControllor
                                                .feesList[index].totalFees,
                                            paidFees: feesControllor
                                                .feesList[index].paidFees,
                                            uid: feesControllor
                                                .feesList[index].uid,
                                            id: feesControllor
                                                .feesList[index].id,
                                            lessFees: feesControllor
                                                .feesList[index].lessFees,
                                            check: 1,
                                          );
                                          Get.toNamed(
                                            '/feesAdd',
                                            arguments: f1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          FeesModel f1 = FeesModel(
                                            id: feesControllor
                                                .feesList[index].id,
                                          );

                                          bool check =
                                              await feesControllor.deleteFees(
                                            f1: f1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );

                                            listOfFees(
                                              std: "7",
                                            );
                                          } else {
                                            Get.snackbar(
                                              "Un Success Fully Delete",
                                              "",
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                else if (std!.compareTo("8") == 0) {
                  return feesControllor.feesList[index].std.compareTo("$std") !=
                          0
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black12,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                  spreadRadius: 7,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name :- ${feesControllor.feesList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${feesControllor.feesList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 20.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          FeesModel f1 = FeesModel(
                                            firstName: feesControllor
                                                .feesList[index].firstName,
                                            std: feesControllor
                                                .feesList[index].std,
                                            totalFees: feesControllor
                                                .feesList[index].totalFees,
                                            paidFees: feesControllor
                                                .feesList[index].paidFees,
                                            uid: feesControllor
                                                .feesList[index].uid,
                                            id: feesControllor
                                                .feesList[index].id,
                                            lessFees: feesControllor
                                                .feesList[index].lessFees,
                                            check: 1,
                                          );
                                          Get.toNamed(
                                            '/feesAdd',
                                            arguments: f1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          FeesModel f1 = FeesModel(
                                            id: feesControllor
                                                .feesList[index].id,
                                          );

                                          bool check =
                                              await feesControllor.deleteFees(
                                            f1: f1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );

                                            listOfFees(
                                              std: "8",
                                            );
                                          } else {
                                            Get.snackbar(
                                              "Un Success Fully Delete",
                                              "",
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                else if (std!.compareTo("9") == 0) {
                  return feesControllor.feesList[index].std.compareTo("$std") !=
                          0
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black12,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                  spreadRadius: 7,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name :- ${feesControllor.feesList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${feesControllor.feesList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 20.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          FeesModel f1 = FeesModel(
                                            firstName: feesControllor
                                                .feesList[index].firstName,
                                            std: feesControllor
                                                .feesList[index].std,
                                            totalFees: feesControllor
                                                .feesList[index].totalFees,
                                            paidFees: feesControllor
                                                .feesList[index].paidFees,
                                            uid: feesControllor
                                                .feesList[index].uid,
                                            id: feesControllor
                                                .feesList[index].id,
                                            lessFees: feesControllor
                                                .feesList[index].lessFees,
                                            check: 1,
                                          );
                                          Get.toNamed(
                                            '/feesAdd',
                                            arguments: f1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          FeesModel f1 = FeesModel(
                                            id: feesControllor
                                                .feesList[index].id,
                                          );

                                          bool check =
                                              await feesControllor.deleteFees(
                                            f1: f1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );

                                            listOfFees(
                                              std: "9",
                                            );
                                          } else {
                                            Get.snackbar(
                                              "Un Success Fully Delete",
                                              "",
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                } 
                else if (std!.compareTo("10") == 0) {
                  return feesControllor.feesList[index].std.compareTo("$std") !=
                          0
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Container(
                            height: 120.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black12,
                                  offset: Offset(
                                    0,
                                    0,
                                  ),
                                  spreadRadius: 7,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 200.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Name :- ${feesControllor.feesList[index].firstName}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Std :- ${feesControllor.feesList[index].std}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Total Fees :- ${feesControllor.feesList[index].totalFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Paid Fees :- ${feesControllor.feesList[index].paidFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Less Fees :- ${feesControllor.feesList[index].lessFees}",
                                        style: GoogleFonts.archivo(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Container(
                                  width: 20.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          FeesModel f1 = FeesModel(
                                            firstName: feesControllor
                                                .feesList[index].firstName,
                                            std: feesControllor
                                                .feesList[index].std,
                                            totalFees: feesControllor
                                                .feesList[index].totalFees,
                                            paidFees: feesControllor
                                                .feesList[index].paidFees,
                                            uid: feesControllor
                                                .feesList[index].uid,
                                            id: feesControllor
                                                .feesList[index].id,
                                            lessFees: feesControllor
                                                .feesList[index].lessFees,
                                            check: 1,
                                          );
                                          Get.toNamed(
                                            '/feesAdd',
                                            arguments: f1,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          FeesModel f1 = FeesModel(
                                            id: feesControllor
                                                .feesList[index].id,
                                          );

                                          bool check =
                                              await feesControllor.deleteFees(
                                            f1: f1,
                                          );

                                          if (check) {
                                            Get.snackbar(
                                              "Success Fully Delete",
                                              "",
                                            );

                                            listOfFees(
                                              std: "10",
                                            );
                                          } else {
                                            Get.snackbar(
                                              "Un Success Fully Delete",
                                              "",
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                else {
                  return Text(
                    "Bad Choice",
                  );
                }
              },
            );
          }
          return Center(
            child: Text(
              "Work In Process",
              style: GoogleFonts.archivo(),
            ),
          );
        },
      ),
    );
  }
}
