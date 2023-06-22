import 'dart:math';

import 'package:classes_app/Screen/HomeWork/AddHomeWork/Controllor/AddHomeWorkControllor.dart';
import 'package:classes_app/Screen/HomeWork/ShowHomeWork/Model/HomeWorkModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ShowHomeWorkScreen extends StatefulWidget {
  const ShowHomeWorkScreen({super.key});

  @override
  State<ShowHomeWorkScreen> createState() => _ShowHomeWorkScreenState();
}

class _ShowHomeWorkScreenState extends State<ShowHomeWorkScreen> {
  AddHomeWorkControllor addHomeWorkControllor = Get.put(
    AddHomeWorkControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: addHomeWorkControllor.readHomeWork(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                ),
              );
            } else if (snapshot.hasData) {
              addHomeWorkControllor.homeWorkList.clear();
              QuerySnapshot? snapData = snapshot.data;

              for (var x in snapData!.docs) {
                HomeWorkModel h1 = HomeWorkModel(
                    key: x.id,
                    subject: x['subject'],
                    dueDate: x['dueDate'],
                    title: x['title'],
                    std: x['std']);

                addHomeWorkControllor.homeWorkList.add(h1);
              }
              return ListView.builder(
                itemCount: addHomeWorkControllor.homeWorkList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Container(
                      height: 80.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
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
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Home Work :- ${addHomeWorkControllor.homeWorkList[index].title}",
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Due Date :- ${addHomeWorkControllor.homeWorkList[index].dueDate}",
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Container(
                                width: 150.sp,
                                child: Text(
                                  "Subject :- ${addHomeWorkControllor.homeWorkList[index].subject}",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.sp,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    std: addHomeWorkControllor
                                        .homeWorkList[index].std,
                                    title: addHomeWorkControllor
                                        .homeWorkList[index].title,
                                    dueDate: addHomeWorkControllor
                                        .homeWorkList[index].dueDate,
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                    subject: addHomeWorkControllor
                                        .homeWorkList[index].subject,
                                    check: 1,
                                  );

                                  print(h1.std);
                                  Get.toNamed(
                                    '/addHomeWork',
                                    arguments: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  HomeWorkModel h1 = HomeWorkModel(
                                    key: addHomeWorkControllor
                                        .homeWorkList[index].key,
                                  );
                                  addHomeWorkControllor.deleteHomeWork(
                                    h1: h1,
                                  );
                                },
                                icon: Icon(
                                  Icons.delete,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
          onPressed: () {
            HomeWorkModel h1 = HomeWorkModel(
              check: 0,
            );
            Get.toNamed(
              '/addHomeWork',
              arguments: h1,
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
