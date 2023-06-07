import 'package:classes_app/Screen/AddStudent/Model/StudentModel.dart';
import 'package:classes_app/Screen/readStudent/Controllo/readStudentControllor.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class readStudentScreen extends StatefulWidget {
  const readStudentScreen({Key? key}) : super(key: key);

  @override
  State<readStudentScreen> createState() => _readStudentScreenState();
}

class _readStudentScreenState extends State<readStudentScreen> {

  ReadStudentControllor readStudentControllor = Get.put(
    ReadStudentControllor(),);

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
            } else if (snapshot.hasData) {
              var snapData = snapshot.data as QuerySnapshot;

              readStudentControllor.StudentDataList.clear();

              for (var Data in snapData.docs) {
                StudentModel s1 = StudentModel(
                  total_fees: int.parse("${Data['total_fees']}"),
                  paid_fees: int.parse("${Data['paid_fees']}"),
                  email_id: Data['email_id'],
                  mobile_no: Data['mobile_no'],
                  l_name: Data['l_name'],
                  f_name: Data['f_name'],
                );

                readStudentControllor.StudentDataList.add(s1);
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.black,
                    height: 80.sp,
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
