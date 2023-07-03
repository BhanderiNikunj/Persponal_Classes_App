import 'package:classes_app/Screen/Notes/AddNotes/Controllor/AddNotesControllor.dart';
import 'package:classes_app/Screen/Notes/Notes/Model/NotesModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  AddNotesControllor addNotesControllor = Get.put(
    AddNotesControllor(),
  );

  NotesModel n1 = Get.arguments;

  @override
  void initState() {
    super.initState();

    if (n1.check == 1) {
      addNotesControllor.txtTask = TextEditingController(text: "${n1.notes}");
      addNotesControllor.txtDate = TextEditingController(text: "${n1.date}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50.sp,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp)),
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
              alignment: Alignment.centerLeft,
              child: Row(
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
                        Icons.arrow_back,
                        color: Color(0xff272cff),
                      ),
                    ),
                  ),
                  SizedBox(width: 55.sp),
                  Center(
                    child: Text(
                      "Add Announcement",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.sp),
                  Text(
                    "Enter Task Title",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 5.sp),
                  TextField(
                    controller: addNotesControllor.txtTask,
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
                    "Select Date",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 5.sp),
                  TextField(
                    controller: addNotesControllor.txtDate,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () async {
                          // addNotesControllor.dateTime = await showDatePicker(
                          //   context: context,
                          //   initialDate: DateTime.now(),
                          //   firstDate: DateTime(2000),
                          //   lastDate: DateTime(3000),
                          // );
                          addNotesControllor.dateTime =
                              await DatePicker.showSimpleDatePicker(
                            context,
                            initialDate: addNotesControllor.dateTime,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                            dateFormat: "dd-MMMM-yyyy",
                            locale: DateTimePickerLocale.en_us,
                            looping: false,
                          );
                          setState(() {
                            addNotesControllor.txtDate = TextEditingController(
                              text:
                                  "${addNotesControllor.dateTime!.day} / ${addNotesControllor.dateTime!.month} / ${addNotesControllor.dateTime!.year}",
                            );
                          });
                        },
                        icon: Icon(
                          Icons.date_range,
                        ),
                      ),
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
                  SizedBox(height: 20.sp),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        NotesModel notesModel = NotesModel(
                          notes: addNotesControllor.txtTask.text,
                          date: addNotesControllor.txtDate.text,
                          key: n1.key,
                        );

                        if (n1.check == 1) {
                          String msg = await addNotesControllor.updateNotes(
                            n1: notesModel,
                          );

                          if (msg == "success") {
                            Get.back();
                          }

                          Get.snackbar(
                            "$msg",
                            "",
                          );
                        } else {
                          String msg = await addNotesControllor.InsertNotes(
                            n1: notesModel,
                          );

                          print(msg);
                          if (msg == "success") {
                            Get.back();
                          }

                          Get.snackbar(
                            "$msg",
                            "",
                          );
                        }
                      },
                      child: n1.check == 1
                          ? allButton(string: "Update")
                          : allButton(string: "Submit"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
