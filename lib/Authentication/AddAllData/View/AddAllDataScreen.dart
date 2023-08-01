import 'package:classes_app/Authentication/AddAllData/Controller/AddAllDetailController.dart';
import 'package:classes_app/Models/AddAllDetailModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AddAllDetailScreen extends StatefulWidget {
  const AddAllDetailScreen({super.key});

  @override
  State<AddAllDetailScreen> createState() => _AddAllDetailScreenState();
}

class _AddAllDetailScreenState extends State<AddAllDetailScreen> {
  AddAllDetailController addAllDetailController = Get.put(
    AddAllDetailController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: addAllDetailController.txtFName,
              style: GoogleFonts.archivo(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Ex. user",
                hintStyle: GoogleFonts.archivo(),
                label: Text("First Name"),
                labelStyle: GoogleFonts.archivo(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            TextField(
              controller: addAllDetailController.txtLName,
              style: GoogleFonts.archivo(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Ex. user",
                hintStyle: GoogleFonts.archivo(),
                label: Text("Last Name"),
                labelStyle: GoogleFonts.archivo(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            TextField(
              controller: addAllDetailController.txtMobileNo,
              style: GoogleFonts.archivo(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Ex. 9638527410",
                hintStyle: GoogleFonts.archivo(),
                label: Text("Mobile Number"),
                labelStyle: GoogleFonts.archivo(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            DropdownButton(
              value: addAllDetailController.isCheck.value,
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  value: 0,
                  child: Text(
                    "User",
                  ),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text(
                    "Admin",
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  addAllDetailController.isCheck.value = value!;
                });
              },
            ),
            SizedBox(height: 10.sp),
            addAllDetailController.isCheck.value != 0
                ? Container()
                : DropdownButton(
                    value: addAllDetailController.std.value,
                    isExpanded: true,
                    items: [
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
                      setState(() {
                        addAllDetailController.std.value = value!;
                      });
                    },
                  ),
            SizedBox(height: 10.sp),
            InkWell(
              onTap: () {
                AddAllDetailModel a1 = AddAllDetailModel(
                  f_name: addAllDetailController.txtFName.text,
                  l_name: addAllDetailController.txtLName.text,
                  mobile: addAllDetailController.txtMobileNo.text,
                  adminUser: addAllDetailController.isCheck.value,
                  std: addAllDetailController.std.value,
                );

                addAllDetailController.insertDetail(
                  addAllDetailModel: a1,
                );

                Get.offAndToNamed('/home');
              },
              child: allButton(
                string: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
