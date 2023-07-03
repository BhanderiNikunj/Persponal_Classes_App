import 'dart:math';

import 'package:classes_app/Screen/Notes/Notes/Controllor/NotesControllor.dart';
import 'package:classes_app/Screen/Notes/Notes/Model/NotesModel.dart';
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
                        SizedBox(
                          width: 80.sp,
                        ),
                        Text(
                          "Events List",
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
                    child: ListView.builder(
                      itemCount: notesControllor.notesList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 90.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              gradient: LinearGradient(
                                transform: GradientRotation(pi / 4),
                                colors: [
                                  Color(0xff2ED0FF),
                                  Color(0xff50AFFF),
                                  Color(0xff6E92FF),
                                  Color(0xff7E82FF),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0.sp),
                              child: Row(
                                children: [
                                  Container(
                                    width: 200.sp,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Events :- ${notesControllor.notesList[index].notes}",
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 8.sp),
                                        Text(
                                          "Date     :- ${notesControllor.notesList[index].date}",
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 60.sp,
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            NotesModel n1 = NotesModel(
                                              date: notesControllor
                                                  .notesList[index].date,
                                              key: notesControllor
                                                  .notesList[index].key,
                                              notes: notesControllor
                                                  .notesList[index].notes,
                                              check: 1,
                                            );
                                            Get.toNamed(
                                              '/addNotes',
                                              arguments: n1,
                                            );
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            NotesModel n1 = NotesModel(
                                              key: notesControllor
                                                  .notesList[index].key,
                                            );
                                            notesControllor.deleteNotes(
                                              n1: n1,
                                            );
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff01957f),
          onPressed: () {
            NotesModel n1 = NotesModel(
              check: 0,
            );
            Get.toNamed(
              '/addNotes',
              arguments: n1,
            );
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
