import 'dart:io';
import 'dart:typed_data';
import 'package:classes_app/Screen/Login/AddUserDetail/Controllor/AddUserDetailControllor.dart';
import 'package:classes_app/Screen/Login/AddUserDetail/Model/AddUserDetailModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AddUserDetailScreen extends StatefulWidget {
  const AddUserDetailScreen({Key? key}) : super(key: key);

  @override
  State<AddUserDetailScreen> createState() => _AddUserDetailScreenState();
}

class _AddUserDetailScreenState extends State<AddUserDetailScreen> {
  AddUserDetailControllor addUserDetailControllor = Get.put(
    AddUserDetailControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: InkWell(
                    onTap: () async {
                      ImagePicker imagePicker = ImagePicker();
                      XFile? xfile = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      print(xfile!.path);
                      File file = File(xfile.path);

                      await file.readAsBytes().then((value) {
                        addUserDetailControllor.imageBytes = value;
                      });

                      setState(() {
                        addUserDetailControllor.iPath.value = String.fromCharCodes(
                          addUserDetailControllor.imageBytes!,
                        );
                      });

                      print(addUserDetailControllor.iPath.value);
                    },
                    child: CircleAvatar(
                      radius: 50.sp,
                      backgroundColor: Color(0xffE85720),
                      backgroundImage: MemoryImage(
                              Uint8List.fromList(
                                addUserDetailControllor.iPath.value.codeUnits,
                              ),
                            ),
                    ),
                  ),
                ),
                Text(
                  "Enter Your Name",
                ),
                SizedBox(height: 5.sp),
                TextField(
                  controller: addUserDetailControllor.txtName,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    enabled: true,
                    hintText: "Ex. abcd",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                Text(
                  "Enter Your Surname",
                ),
                SizedBox(height: 5.sp),
                TextField(
                  controller: addUserDetailControllor.txtSurname,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    enabled: true,
                    hintText: "Ex. abcd",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                Text(
                  "Enter Your Mobile No.",
                ),
                SizedBox(height: 5.sp),
                TextField(
                  controller: addUserDetailControllor.txtMobileNo,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    enabled: true,
                    hintText: "Ex. 9988776655",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                Text(
                  "Enter Your Email Id",
                ),
                SizedBox(height: 5.sp),
                TextField(
                  controller: addUserDetailControllor.txtEmail,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    enabled: true,
                    hintText: "Ex. user@gmail.com",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                Text(
                  "Select Admin / User",
                ),
                SizedBox(height: 5.sp),
                Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    value: addUserDetailControllor.checkAdmin.value,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Admin",
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "User",
                        ),
                        value: 0,
                      ),
                    ],
                    onChanged: (value) {
                      addUserDetailControllor.checkAdmin.value = value!;
                    },
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      AddUserDetailModel a1 = AddUserDetailModel(
                        name: addUserDetailControllor.txtName.text,
                        image: addUserDetailControllor.iPath.value,
                        emailId: addUserDetailControllor.txtEmail.text,
                        surname: addUserDetailControllor.txtSurname.text,
                        checkAdmin: addUserDetailControllor.checkAdmin.value,
                        mobileNo: addUserDetailControllor.txtMobileNo.text,
                      );

                      String msg = await addUserDetailControllor.insertUserDetail(
                        a1: a1,
                      );

                      if (addUserDetailControllor.checkAdmin.value == 1) {
                        if (msg == "success") {
                          Get.offAndToNamed('/home');
                        }
                        print(msg);
                        Get.snackbar(
                          "$msg",
                          "",
                        );
                      } else {
                        if (msg == "success") {
                          Get.offAndToNamed('/userHome');
                        }
                        print(msg);
                        Get.snackbar(
                          "$msg",
                          "",
                        );
                      }
                    },
                    child: Container(
                      height: 30.sp,
                      width: 60.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Color(0xff950DB7),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
