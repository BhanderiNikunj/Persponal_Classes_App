import 'dart:io';
import 'dart:typed_data';
import 'package:classes_app/Admin/AdminProfile/Model/AdminProfileModel.dart';
import 'package:classes_app/Login/AddUserDetail/Controllor/AddUserDetailControllor.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:classes_app/main.dart';
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
  AdminProfileModel p1 = Get.arguments;

  @override
  void initState() {
    super.initState();

    if (p1.checkUpdate == 1) {
      addUserDetailControllor.txtName = TextEditingController(
        text: "${p1.name}",
      );
      addUserDetailControllor.txtEmail = TextEditingController(
        text: "${p1.email}",
      );
      addUserDetailControllor.txtMobileNo = TextEditingController(
        text: "${p1.mobile}",
      );
      addUserDetailControllor.txtSurname = TextEditingController(
        text: "${p1.surname}",
      );
      addUserDetailControllor.iPath.value = p1.image!;
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
                            addUserDetailControllor.iPath.value =
                                String.fromCharCodes(
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
                      p1.checkUpdate == 1 ? "" : "Select Admin / User",
                    ),
                    SizedBox(height: 5.sp),
                    p1.checkUpdate == 1
                        ? Container()
                        : Obx(
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
                                // setState(() {
                                  addUserDetailControllor.checkAdmin.value =
                                      value!;
                                // });
                              },
                            ),
                          ),
                    addUserDetailControllor.checkAdmin == 1
                        ? Container()
                        : Obx(
                            () => DropdownButton(
                              isExpanded: true,
                              value: addUserDetailControllor.checkStd.value,
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
                                // setState(() {
                                  addUserDetailControllor.checkStd.value =
                                      value!;
                                // });
                              },
                            ),
                          ),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          if (addUserDetailControllor.checkAdmin.value == 1) {
                            if (p1.checkUpdate == 1) {
                              AdminProfileModel a1 = AdminProfileModel(
                                name: addUserDetailControllor.txtName.text,
                                image: addUserDetailControllor.iPath.value,
                                email: addUserDetailControllor.txtEmail.text,
                                surname:
                                    addUserDetailControllor.txtSurname.text,
                                adminUser: 1,
                                mobile:
                                    addUserDetailControllor.txtMobileNo.text,
                                key: p1.key,
                              );
                              String msg = await addUserDetailControllor
                                  .updateAdminDetail(
                                a1: a1,
                              );

                              Get.back();
                              Get.snackbar(
                                "$msg",
                                "",
                              );
                            }

                            else {
                              AdminProfileModel a1 = AdminProfileModel(
                                name: addUserDetailControllor.txtName.text,
                                image: addUserDetailControllor.iPath.value,
                                email: addUserDetailControllor.txtEmail.text,
                                surname:
                                    addUserDetailControllor.txtSurname.text,
                                adminUser: 1,
                                mobile:
                                    addUserDetailControllor.txtMobileNo.text,
                              );

                              String msg = await addUserDetailControllor
                                  .insertAdminDetail(
                                a1: a1,
                              );

                              Get.offAndToNamed('/bottom');

                              Get.snackbar(
                                "$msg",
                                "",
                              );
                            }
                          }

                          else {
                            if (p1.checkUpdate == 1) {
                              AdminProfileModel a1 = AdminProfileModel(
                                std: addUserDetailControllor.checkStd.value,
                                name: addUserDetailControllor.txtName.text,
                                image: addUserDetailControllor.iPath.value,
                                email: addUserDetailControllor.txtEmail.text,
                                surname:
                                    addUserDetailControllor.txtSurname.text,
                                adminUser: 0,
                                mobile:
                                    addUserDetailControllor.txtMobileNo.text,
                                key: p1.key,
                              );
                              await addUserDetailControllor
                                  .updateAdminDetail(
                                a1: a1,
                              );

                              Get.back();
                            }

                            else {
                              AdminProfileModel adminProfileModel = AdminProfileModel(
                                std: addUserDetailControllor.checkStd.value,
                                name: addUserDetailControllor.txtName.text,
                                image: addUserDetailControllor.iPath.value,
                                email: addUserDetailControllor.txtEmail.text,
                                surname:
                                    addUserDetailControllor.txtSurname.text,
                                adminUser:
                                    0,
                                mobile:
                                    addUserDetailControllor.txtMobileNo.text,
                                uid: FirebaseHelper.firebaseHelper.FindUid(),
                              );

                              String msg = await addUserDetailControllor
                                  .insertAdminDetail(
                                a1: adminProfileModel,
                              );

                              Get.offAndToNamed('/userHome');

                              Get.snackbar(
                                "$msg",
                                "",
                              );
                            }
                          }
                        },
                        child: p1.checkUpdate == 1
                            ? allButton(string: "Update")
                            : allButton(string: "Submit"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
