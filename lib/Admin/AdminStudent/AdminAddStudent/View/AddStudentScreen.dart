import 'dart:io';
import 'package:classes_app/Admin/AdminStudent/AdminAddStudent/Controllor/AdminAddStudentControllor.dart';
import 'package:classes_app/Admin/AdminStudent/AdminAddStudent/Model/AdminStudentModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AdminAddStudentScreen extends StatefulWidget {
  const AdminAddStudentScreen({Key? key}) : super(key: key);

  @override
  State<AdminAddStudentScreen> createState() => _AdminAddStudentScreenState();
}

class _AdminAddStudentScreenState extends State<AdminAddStudentScreen> {
  AdminAddStudentControllor addStudentControllor = Get.put(
    AdminAddStudentControllor(),
  );

  AdminStudentModel s1 = Get.arguments;

  @override
  void initState() {
    super.initState();
    if (s1.isCheck == 1) {
      addStudentControllor.txtf_name =
          TextEditingController(text: "${s1.f_name}");
      addStudentControllor.txtl_name =
          TextEditingController(text: "${s1.l_name}");
      addStudentControllor.txtemail_id =
          TextEditingController(text: "${s1.email_id}");
      addStudentControllor.txtmobile_no =
          TextEditingController(text: "${s1.mobile_no}");
      addStudentControllor.txtpaid_fees =
          TextEditingController(text: "${s1.paid_fees}");
      addStudentControllor.txtAddress =
          TextEditingController(text: "${s1.address}");
      addStudentControllor.txttotal_fees =
          TextEditingController(text: "${s1.total_fees}");
      addStudentControllor.ipath.value = s1.image!;
      addStudentControllor.std.value = s1.std!;
      addStudentControllor.txtfatherName =
          TextEditingController(text: "${s1.father_name}");
      addStudentControllor.key = s1.key!;

      print(addStudentControllor.ipath.value);
      print(s1.image);
    } else {
      print(addStudentControllor.ipath.value);
      print(s1.image);
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
                            s1.isCheck == 1 ? "Update Detail" : "Add Detail",
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
                        Center(
                          child: Obx(
                            () => InkWell(
                              onTap: () async {
                                print(addStudentControllor.ipath.value);
                                ImagePicker imagePicker = ImagePicker();
                                XFile? xfile = await imagePicker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                File file = File(xfile!.path);

                                await file.readAsBytes().then((value) {
                                  addStudentControllor.imageBytes = value;
                                });

                                addStudentControllor.ipath.value =
                                    String.fromCharCodes(
                                  addStudentControllor.imageBytes!,
                                );
                                print(addStudentControllor.ipath.value);
                              },
                              child: CircleAvatar(
                                backgroundImage: addStudentControllor
                                        .ipath.value.isEmpty
                                    ? null
                                    : MemoryImage(
                                        Uint8List.fromList(
                                          addStudentControllor.ipath.codeUnits,
                                        ),
                                      ),
                                radius: 40.sp,
                                backgroundColor: Color(0xff2ED0FF),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Enter First Name",
                        ),
                        SizedBox(height: 5.sp),
                        TextField(
                          controller: addStudentControllor.txtf_name,
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
                          "Enter Last Name",
                        ),
                        SizedBox(height: 5.sp),
                        TextField(
                          controller: addStudentControllor.txtl_name,
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
                          "Enter Father Name",
                        ),
                        SizedBox(height: 5.sp),
                        TextField(
                          controller: addStudentControllor.txtfatherName,
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
                          "Select Student Std",
                        ),
                        SizedBox(height: 5.sp),
                        Obx(
                          () => DropdownButton(
                            isExpanded: true,
                            value: addStudentControllor.std.value,
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
                              addStudentControllor.std.value = value!;
                            },
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Text(
                          "Enter Mobile No.",
                        ),
                        SizedBox(height: 5.sp),
                        TextField(
                          controller: addStudentControllor.txtmobile_no,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Ex. 9988776655",
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
                          "Enter Total Fees",
                        ),
                        SizedBox(height: 5.sp),
                        TextField(
                          controller: addStudentControllor.txttotal_fees,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Ex. 10000",
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
                          "Enter Paid Fees",
                        ),
                        SizedBox(height: 5.sp),
                        TextField(
                          controller: addStudentControllor.txtpaid_fees,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Ex. 5000",
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
                        SizedBox(height: 20.sp),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              if (s1.isCheck == 1) {
                                AdminStudentModel studentModel = AdminStudentModel(
                                  std: addStudentControllor.std.value,
                                  father_name:
                                      addStudentControllor.txtfatherName.text,
                                  image: addStudentControllor.ipath.value,
                                  email_id: "-",
                                  f_name: addStudentControllor.txtf_name.text,
                                  l_name: addStudentControllor.txtl_name.text,
                                  mobile_no:
                                      addStudentControllor.txtmobile_no.text,
                                  address: "-",
                                  paid_fees: int.parse(
                                      "${addStudentControllor.txtpaid_fees.text}"),
                                  total_fees: int.parse(
                                      "${addStudentControllor.txttotal_fees.text}"),
                                  key: s1.key,
                                );

                                print(s1.key);
                                addStudentControllor.updateData(
                                  s1: studentModel,
                                );
                              } else {
                                print(
                                  "${addStudentControllor.ipath}",
                                );
                                AdminStudentModel studentModel = AdminStudentModel(
                                  std: addStudentControllor.std.value,
                                  father_name:
                                      addStudentControllor.txtfatherName.text,
                                  image: addStudentControllor.ipath.value,
                                  email_id: "-",
                                  f_name: addStudentControllor.txtf_name.text,
                                  l_name: addStudentControllor.txtl_name.text,
                                  mobile_no:
                                      addStudentControllor.txtmobile_no.text,
                                  paid_fees: int.parse(
                                      "${addStudentControllor.txtpaid_fees.text}"),
                                  total_fees: int.parse(
                                      "${addStudentControllor.txttotal_fees.text}"),
                                  key: s1.key,
                                  address: "-",
                                );
                                addStudentControllor.insertData(
                                  s1: studentModel,
                                );
                              }
                              Get.back();
                            },
                            child: s1.isCheck != 1
                                ? allButton(
                                    string: "Submit",
                                  )
                                : allButton(string: "Update"),
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
