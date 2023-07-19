import 'package:classes_app/Screen/HomeWork/AddHomeWork/Controllor/AddHomeWorkControllor.dart';
import 'package:classes_app/Screen/HomeWork/ShowHomeWork/Model/HomeWorkModel.dart';
import 'package:classes_app/main.dart';
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

  HomeWorkModel h1 = Get.arguments;

  @override
  void initState() {
    super.initState();

    if (h1.check == 1) {
      addHomeWorkControllor.std.value = h1.std!;
      addHomeWorkControllor.subject.value = h1.subject!;
      addHomeWorkControllor.txtDueData =
          TextEditingController(text: "${h1.dueDate}");
      addHomeWorkControllor.txtTitle =
          TextEditingController(text: "${h1.title}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                "Assets/Images/bright_op.png",
                height: 200.sp,
              ),
            ),
            SingleChildScrollView(
              child: Column(
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
                        SizedBox(height: 10.sp),
                        Obx(
                          () => DropdownButton(
                            isExpanded: true,
                            value: addHomeWorkControllor.std.value,
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  "Std 1",
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 2",
                                ),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 3",
                                ),
                                value: 3,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 4",
                                ),
                                value: 4,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 5",
                                ),
                                value: 5,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 6",
                                ),
                                value: 6,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 7",
                                ),
                                value: 7,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 8",
                                ),
                                value: 8,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 9",
                                ),
                                value: 9,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  "Std 10",
                                ),
                                value: 10,
                              ),
                            ],
                            onChanged: (value) {
                              addHomeWorkControllor.std.value = value!;
                            },
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              if (h1.check == 1) {
                                HomeWorkModel homeWork = HomeWorkModel(
                                  dueDate: addHomeWorkControllor.txtDueData.text,
                                  subject: addHomeWorkControllor.subject.value,
                                  title: addHomeWorkControllor.txtTitle.text,
                                  std: addHomeWorkControllor.std.value,
                                  key: h1.key,
                                );
                                String msg =
                                    await addHomeWorkControllor.updateHomeWork(
                                  h1: homeWork,
                                );

                                if (msg == "success") {
                                  Get.back();
                                  Get.snackbar(
                                    "$msg",
                                    "",
                                  );
                                }
                              }
                              else {
                                HomeWorkModel homeWork = HomeWorkModel(
                                  dueDate: addHomeWorkControllor.txtDueData.text,
                                  subject: addHomeWorkControllor.subject.value,
                                  title: addHomeWorkControllor.txtTitle.text,
                                  std: addHomeWorkControllor.std.value,
                                );

                                String msg =
                                    await addHomeWorkControllor.insertHomeWork(
                                  h1: homeWork,
                                );

                                if (msg == "success") {
                                  Get.back();
                                  Get.snackbar(
                                    "$msg",
                                    "",
                                  );
                                }
                              }
                            },
                            child: h1.check == 1?allButton(string: "Update"):allButton(string: "Submit",),
                          ),
                        ),
                      ],
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
