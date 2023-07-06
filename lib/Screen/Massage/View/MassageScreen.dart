import 'package:classes_app/Screen/Massage/Controllor/MassageControllor.dart';
import 'package:classes_app/Screen/Massage/Model/MassageModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MassageScreen extends StatefulWidget {
  const MassageScreen({super.key});

  @override
  State<MassageScreen> createState() => _MassageScreenState();
}

class _MassageScreenState extends State<MassageScreen> {
  MassageControllor massageControllor = Get.put(
    MassageControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                        MassageModel m1 = MassageModel(
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
                                      topRight: Radius.circular(10.sp),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        "${massageControllor.massageList[index].msg}",
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30.sp,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.sp),
                                      bottomRight: Radius.circular(10.sp),
                                    ),
                                    color: Colors.black12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              TextEditingController txtMsg =
                                                  TextEditingController(
                                                text:
                                                    "${massageControllor.massageList[index].msg}",
                                              );
                                              Get.defaultDialog(
                                                title: "Update Massage",
                                                content: Column(
                                                  children: [
                                                    TextField(
                                                      controller: txtMsg,
                                                      decoration:
                                                          InputDecoration(
                                                        prefixIcon:
                                                            Icon(Icons.message),
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
                                                    SizedBox(height: 10.sp),
                                                    InkWell(
                                                      onTap: () {
                                                        MassageModel m1 =
                                                            MassageModel(
                                                          key: massageControllor
                                                              .massageList[
                                                                  index]
                                                              .key,
                                                          date: "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
                                                          time: "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute}",
                                                          msg: txtMsg.text,
                                                        );
                                                        massageControllor
                                                            .updateMassage(
                                                          m1: m1,
                                                        );
                                                        Get.back();
                                                      },
                                                      child: allButton(
                                                        string: "Submit",
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
                                              MassageModel m1 = MassageModel(
                                                key: massageControllor
                                                    .massageList[index].key,
                                              );
                                              massageControllor.deleteMassage(
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
                                          ),
                                          Text(
                                            "  ",
                                          ),
                                          Text(
                                            "${massageControllor.massageList[index].time}   ",
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
                        itemCount: massageControllor.massageList.length,
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
                          MassageModel m1 = MassageModel(
                            msg: massageControllor.txtMsg.text,
                            date:
                                "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
                            time:
                                "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute}",
                          );
                          String msg = await massageControllor.insertMassage(
                            m1: m1,
                          );

                          Get.snackbar(
                            "$msg",
                            "",
                          );

                          setState(() {
                            massageControllor.txtMsg = TextEditingController();
                          });
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
    );
  }
}
