import 'package:classes_app/Screen/AddStudent/Controllor/AddStudentControllor.dart';
import 'package:classes_app/Screen/AddStudent/Model/StudentModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({Key? key}) : super(key: key);

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  AddStudentControllor addStudentControllor = Get.put(
    AddStudentControllor(),
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
                      Icons.arrow_back_ios_new,
                      color: Color(0xff2ED0FF),
                    ),
                  ),
                ),
                SizedBox(height: 20.sp),
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
                  "Enter Email Id",
                ),
                SizedBox(height: 5.sp),
                TextField(
                  controller: addStudentControllor.txtemail_id,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Ex. user@gmail.com",
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
                    onTap: () {
                      StudentModel s1 = StudentModel(
                        email_id: addStudentControllor.txtemail_id.text,
                        f_name: addStudentControllor.txtf_name.text,
                        l_name: addStudentControllor.txtl_name.text,
                        mobile_no: addStudentControllor.txtmobile_no.text,
                        paid_fees:
                            int.parse("${addStudentControllor.txtpaid_fees.text}"),
                        total_fees:
                            int.parse("${addStudentControllor.txttotal_fees.text}"),
                      );

                      addStudentControllor.InsertData(
                        s1: s1,
                      );

                      Get.back();
                    },
                    child: Container(
                      height: 40.sp,
                      width: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
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
                      alignment: Alignment.center,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
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
