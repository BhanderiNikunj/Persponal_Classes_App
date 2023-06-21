import 'package:classes_app/Screen/HomeWork/AddHomeWork/Controllor/AddHomeWorkControllor.dart';
import 'package:classes_app/Screen/HomeWork/ShowHomeWork/Model/HomeWorkModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddHomeWorkScreen extends StatefulWidget {
  const AddHomeWorkScreen({super.key});

  @override
  State<AddHomeWorkScreen> createState() => _AddHomeWorkScreenState();
}

class _AddHomeWorkScreenState extends State<AddHomeWorkScreen> {
  AddHomeWorkControllor addHomeWorkControllor = Get.put(
    AddHomeWorkControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50.sp,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp)),
                gradient: LinearGradient(
                  transform: GradientRotation(100),
                  colors: [
                    Color(0xff2ED0FF),
                    Color(0xff50AFFF),
                    Color(0xff6E92FF),
                    Color(0xff7E82FF),
                  ],
                ),
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40.sp,
                      width: 40.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff272cff),
                      ),
                    ),
                  ),
                  SizedBox(width: 65.sp),
                  Center(
                    child: Text(
                      // s1.isCheck == 1 ? "Update Detail" : "Add Detail",
                      "Add Home Work",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.sp),
                  Text(
                    "Enter HomeWork Title",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 5.sp),
                  TextField(
                    controller: addHomeWorkControllor.txtTitle,
                    decoration: InputDecoration(
                      hintText: "Ex. abcd",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    "Enter HomeWork Due Date",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 5.sp),
                  TextField(
                    controller: addHomeWorkControllor.txtDueData,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(3000),
                          );

                          setState(() {
                            addHomeWorkControllor.txtDueData =
                                TextEditingController(
                              text:
                                  "${date!.day} / ${date.month} / ${date.year}",
                            );
                          });
                        },
                        icon: Icon(Icons.calendar_month),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Obx(
                    () => DropdownButton(
                      isExpanded: true,
                      enableFeedback: true,
                      value: addHomeWorkControllor.subject.value,
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "Maths",
                          ),
                          value: "math",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Social Science",
                          ),
                          value: "social_science",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Science",
                          ),
                          value: "science",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "English",
                          ),
                          value: "english",
                        ),
                      ],
                      onChanged: (value) {
                        addHomeWorkControllor.subject.value = value!;
                      },
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        HomeWorkModel h1 = HomeWorkModel(
                          dueDate: addHomeWorkControllor.txtDueData.text,
                          subject: addHomeWorkControllor.subject.value,
                          title: addHomeWorkControllor.txtTitle.text,
                        );

                        String msg = await addHomeWorkControllor.insertHomeWork(
                          h1: h1,
                        );

                        Get.snackbar(
                          "$msg",
                          "",
                        );
                        if (msg == "success") {
                          Get.back();
                        }
                      },
                      child: Container(
                        height: 30.sp,
                        width: 60.sp,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            transform: GradientRotation(100),
                            colors: [
                              Color(0xff2ED0FF),
                              Color(0xff50AFFF),
                              Color(0xff6E92FF),
                              Color(0xff7E82FF),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
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
}
