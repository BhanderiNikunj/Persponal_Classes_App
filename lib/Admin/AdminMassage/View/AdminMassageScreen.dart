import 'package:classes_app/Admin/AdminMassage/Controllor/AdminMassageControllor.dart';
import 'package:classes_app/Admin/AdminMassage/Model/AdminMassageModel.dart';
import 'package:classes_app/Utiles/notification.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminMassageScreen extends StatefulWidget {
  const AdminMassageScreen({super.key});

  @override
  State<AdminMassageScreen> createState() => _AdminMassageScreenState();
}

class _AdminMassageScreenState extends State<AdminMassageScreen>
    with SingleTickerProviderStateMixin {
  AdminMassageControllor massageControllor = Get.put(
    AdminMassageControllor(),
  );

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
            Column(
              children: [
                Container(
                  height: 50.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.sp),
                        bottomRight: Radius.circular(20.sp)),
                    color: Color(0xffE85720),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.offAndToNamed('/home');
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bright Education Classes",
                              style: GoogleFonts.archivo(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      children: [
                        Expanded(
                          child: StreamBuilder(
                            stream: massageControllor.readMassage(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text(
                                  "${snapshot.error}",
                                );
                              } else if (snapshot.hasData) {
                                massageControllor.massageList.clear();

                                for (var x in snapshot.data!.docs) {
                                  AdminMassageModel m1 = AdminMassageModel(
                                    date: x['date'],
                                    msg: x['msg'],
                                    key: x.id,
                                    time: x['time'],
                                  );

                                  massageControllor.massageList.add(m1);
                                }

                                return ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 120.sp,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.sp),
                                                topRight:
                                                    Radius.circular(10.sp),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: SingleChildScrollView(
                                                child: Text(
                                                  "${massageControllor.massageList[index].msg}",
                                                  style: GoogleFonts.archivo(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 30.sp,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(10.sp),
                                                bottomRight:
                                                    Radius.circular(10.sp),
                                              ),
                                              color: Colors.black12,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        TextEditingController
                                                            txtMsg =
                                                            TextEditingController(
                                                          text:
                                                              "${massageControllor.massageList[index].msg}",
                                                        );
                                                        Get.defaultDialog(
                                                          title:
                                                              "Update Massage",
                                                          content: Column(
                                                            children: [
                                                              TextField(
                                                                controller:
                                                                    txtMsg,
                                                                decoration:
                                                                    InputDecoration(
                                                                  prefixIcon:
                                                                      Icon(Icons
                                                                          .message),
                                                                  hintText:
                                                                      "Enter A Message For Students",
                                                                  disabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      10.sp,
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      10.sp,
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      10.sp,
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      10.sp,
                                                                    ),
                                                                  ),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      10.sp,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height:
                                                                      10.sp),
                                                              InkWell(
                                                                onTap: () {
                                                                  AdminMassageModel
                                                                      m1 =
                                                                      AdminMassageModel(
                                                                    key: massageControllor
                                                                        .massageList[
                                                                            index]
                                                                        .key,
                                                                    date:
                                                                        "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
                                                                    time:
                                                                        "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute}",
                                                                    msg: txtMsg
                                                                        .text,
                                                                  );
                                                                  massageControllor
                                                                      .updateMassage(
                                                                    m1: m1,
                                                                  );
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    allButton(
                                                                  string:
                                                                      "Submit",
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.edit,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        AdminMassageModel m1 =
                                                            AdminMassageModel(
                                                          key: massageControllor
                                                              .massageList[
                                                                  index]
                                                              .key,
                                                        );
                                                        massageControllor
                                                            .deleteMassage(
                                                          m1: m1,
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.delete,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${massageControllor.massageList[index].date}",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "  ",
                                                    ),
                                                    Text(
                                                      "${massageControllor.massageList[index].time}   ",
                                                      style:
                                                          GoogleFonts.archivo(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount:
                                      massageControllor.massageList.length,
                                );
                                // return Center(
                                //   child: Text(
                                //     "Work In Process",
                                //   ),
                                // );
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                        Column(
                          children: [
                            TextField(
                              controller: massageControllor.txtMsg,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () async {
                                    AdminMassageModel m1 = AdminMassageModel(
                                      msg: massageControllor.txtMsg.text,
                                      date:
                                          "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
                                      time:
                                          "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute}",
                                    );
                                    await massageControllor.insertMassage(
                                      m1: m1,
                                    );

                                    setState(() {
                                      massageControllor.txtMsg =
                                          TextEditingController();
                                    });

                                    NotificationHelper.helper
                                        .showSoundNotification();
                                  },
                                  icon: Icon(Icons.send_outlined),
                                ),
                                prefixIcon: Icon(Icons.message),
                                hintText: "Enter A Message For Students",
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
