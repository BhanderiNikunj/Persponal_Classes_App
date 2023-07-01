import 'package:classes_app/Screen/Notes/Controllor/NotesControllor.dart';
import 'package:classes_app/Screen/Notes/Model/NotesModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  NotesControllor notesControllor = Get.put(
    NotesControllor(),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: notesControllor.readNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                "${snapshot.error}",
              );
            } else if (snapshot.hasData) {
              QuerySnapshot? snapData = snapshot.data;
              notesControllor.notesList.clear();
              for (var x in snapData!.docs) {
                NotesModel n1 = NotesModel(
                  key: x.id,
                  date: x['date'],
                  notes: x['notes'],
                );

                notesControllor.notesList.add(n1);
              }
              return Column(
                children: [
                  Container(
                    height: 50.sp,
                    decoration: BoxDecoration(
                      color: Color(0xffE85720),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25.sp),
                        bottomLeft: Radius.circular(25.sp),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 40.sp,),
                        Text(
                          "Student Homework",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: notesControllor.notesList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Colors.green.shade300,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Column(
                              children: [
                                Text(
                                  "${notesControllor.notesList[index].notes}",
                                ),
                                Text(
                                  "${notesControllor.notesList[index].date}",
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
              // return Text("data");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
