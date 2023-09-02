import 'package:classes_app/Controllors/MassageControllor.dart';
import 'package:classes_app/Models/MassageModel.dart';
import 'package:classes_app/Utiles/AdsHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class MassageAddScreen extends StatefulWidget {
  const MassageAddScreen({super.key});

  @override
  State<MassageAddScreen> createState() => _MassageAddScreenState();
}

class _MassageAddScreenState extends State<MassageAddScreen> {
  MassageControllor massageControllor = Get.put(
    MassageControllor(),
  );

  MassageModel massageModel = Get.arguments;

  @override
  void initState() {
    super.initState();

    AdsHelper.adsHelper.loadBannerAd();

    if (massageModel.check == 1) {
      massageControllor.txtTime =
          TextEditingController(text: "${massageModel.time}");
      massageControllor.txtDate =
          TextEditingController(text: "${massageModel.date}");
      massageControllor.txtMassage =
          TextEditingController(text: "${massageModel.massage}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Student Fees Add",
                ),
                Container(
                  height: 50.sp,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  TextField(
                    controller: massageControllor.txtMassage,
                    style: GoogleFonts.archivo(),
                    cursorColor: Color(0xffe85720),
                    cursorWidth: 1,
                    cursorRadius: Radius.circular(50),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0x27e85720),
                      hintText: "Ex. hello",
                      hintStyle: GoogleFonts.archivo(),
                      label: Text(
                        "Massage",
                        style: GoogleFonts.archivo(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: massageControllor.txtDate,
                    style: GoogleFonts.archivo(),
                    cursorColor: Color(0xffe85720),
                    cursorWidth: 1,
                    cursorRadius: Radius.circular(50),
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () async {
                          DateTime? d1 = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                          );

                          massageControllor.txtDate = TextEditingController(
                              text: "${d1!.day} / ${d1.month} / ${d1.year}");
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.date_range,
                        ),
                      ),
                      hintText: "Ex. 20 / 12 / 2023",
                      hintStyle: GoogleFonts.archivo(),
                      filled: true,
                      fillColor: Color(0x27e85720),
                      label: Text(
                        "Date",
                        style: GoogleFonts.archivo(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: massageControllor.txtTime,
                    style: GoogleFonts.archivo(),
                    cursorColor: Color(0xffe85720),
                    cursorWidth: 1,
                    cursorRadius: Radius.circular(50),
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? t1 = await showTimePicker(
                            context: context,
                            anchorPoint: Offset(0, 0),
                            initialTime: TimeOfDay.now(),
                          );

                          massageControllor.txtTime = TextEditingController(
                              text: "${t1!.hour} : ${t1.minute}");
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.timelapse,
                        ),
                      ),
                      hintText: "Ex. 10 : 20",
                      hintStyle: GoogleFonts.archivo(),
                      filled: true,
                      fillColor: Color(0x27e85720),
                      label: Text(
                        "Time",
                        style: GoogleFonts.archivo(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  InkWell(
                    onTap: () async {
                      if (massageModel.check == 1) {
                        MassageModel m1 = MassageModel(
                          massage: massageControllor.txtMassage.text,
                          date: massageControllor.txtDate.text,
                          time: massageControllor.txtTime.text,
                          id: massageModel.id,
                        );

                        bool check = await massageControllor.updateMassage(
                          m1: m1,
                        );

                        if (check) {
                          Get.back();
                          Get.snackbar(
                            "Add Success Fully",
                            "",
                          );
                          massageControllor.txtMassage.clear();
                          massageControllor.txtDate.clear();
                          massageControllor.txtTime.clear();
                        } else {
                          Get.snackbar(
                            "Add Un Success Fully",
                            "",
                          );
                        }
                      } else {
                        MassageModel m1 = MassageModel(
                          massage: massageControllor.txtMassage.text,
                          date: massageControllor.txtDate.text,
                          time: massageControllor.txtTime.text,
                        );

                        bool check = await massageControllor.insertMassage(
                          m1: m1,
                        );

                        if (check) {
                          Get.back();
                          Get.snackbar(
                            "Add Success Fully",
                            "",
                          );
                          massageControllor.txtMassage.clear();
                          massageControllor.txtDate.clear();
                          massageControllor.txtTime.clear();
                        } else {
                          Get.snackbar(
                            "Add Un Success Fully",
                            "",
                          );
                        }
                      }
                    },
                    child: allButton(
                      string: massageModel.check == 1 ? "Update" : "Add",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 50.sp,
          child: AdWidget(
            ad: AdsHelper.adsHelper.bannerAd!,
          ),
        ),
      ),
    );
  }
}
