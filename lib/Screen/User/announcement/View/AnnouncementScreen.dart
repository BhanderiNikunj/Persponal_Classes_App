import 'dart:math';
import 'package:classes_app/Screen/Notes/Notes/Model/NotesModel.dart';
import 'package:classes_app/Screen/User/announcement/Controllor/AnnouncementControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  AnnouncementControllor announcementControllor = Get.put(
    AnnouncementControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: announcementControllor.readNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                ),
              );
            } else if (snapshot.hasData) {
              announcementControllor.notesList.clear();
              for (var x in snapshot.data!.docs) {
                NotesModel n1 = NotesModel(
                  key: x.id,
                  date: x['date'],
                  notes: x['notes'],
                );

                announcementControllor.notesList.add(n1);
              }



              return ListView.builder(
                itemCount: announcementControllor.notesList.length,
                itemBuilder: (context, index) {
                  print("${announcementControllor.notesList[index].notes}",);
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
                                    "Events :- ${announcementControllor.notesList[index].notes}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8.sp),
                                  Text(
                                    "Date     :- ${announcementControllor.notesList[index].date}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
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
              );
              // return Text("Work");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
