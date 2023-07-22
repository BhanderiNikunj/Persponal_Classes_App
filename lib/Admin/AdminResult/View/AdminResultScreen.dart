import 'package:classes_app/Admin/AdminResult/Controllor/AdminResultControllor.dart';
import 'package:classes_app/Admin/AdminResult/Model/AdminStudentUidModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdminResultScreen extends StatefulWidget {
  const AdminResultScreen({super.key});

  @override
  State<AdminResultScreen> createState() => _AdminResultScreenState();
}

class _AdminResultScreenState extends State<AdminResultScreen> {
  AdminResultControllor adminResultControllor = Get.put(
    AdminResultControllor(),
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
            // ListView.builder(
            //   itemCount: 10,
            //   itemBuilder: (context, index) {
            //     return Padding(
            //       padding: EdgeInsets.all(10.sp),
            //       child: Container(
            //         height: 50.sp,
            //         width: double.infinity,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10.sp),
            //           color: Colors.black26,
            //           border: Border.all(
            //             color: Colors.black,
            //           ),
            //         ),
            //         alignment: Alignment.center,
            //         child: Text(
            //           "Std ${index + 1}",
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
            Column(
              children: [
                Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    value: adminResultControllor.checkStd.value,
                    items: [
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "Std 1",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "Std 2",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text(
                          "Std 3",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 4,
                        child: Text(
                          "Std 4",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 5,
                        child: Text(
                          "Std 5",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 6,
                        child: Text(
                          "Std 6",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 7,
                        child: Text(
                          "Std 7",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 8,
                        child: Text(
                          "Std 8",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 9,
                        child: Text(
                          "Std 9",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 10,
                        child: Text(
                          "Std 10",
                        ),
                      ),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        adminResultControllor.checkStd.value = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: studentList(
                    std: adminResultControllor.checkStd.value,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget studentList({
    required std,
  }) {
    if (std == 1) {
      return ListView.builder(
        itemCount: adminResultControllor.std1List.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${adminResultControllor.std1List[index].name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    } else if (std == 2) {
      return ListView.builder(
        itemCount: adminResultControllor.std2List.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${adminResultControllor.std2List[index].name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    } else if (std == 3) {
      return ListView.builder(
        itemCount: adminResultControllor.std3List.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${adminResultControllor.std3List[index].name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    } else if (std == 4) {
      return ListView.builder(
        itemCount: adminResultControllor.std4List.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${adminResultControllor.std4List[index].name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    } else if (std == 5) {
      return ListView.builder(
        itemCount: adminResultControllor.std5List.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${adminResultControllor.std5List[index].name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    } else if (std == 6) {
      return ListView.builder(
        itemCount: adminResultControllor.std6List.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${adminResultControllor.std6List[index].name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    } else if (std == 7) {
      return ListView.builder(
        itemCount: adminResultControllor.std7List.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${adminResultControllor.std7List[index].name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    } else if (std == 8) {
      return ListView.builder(
        itemCount: adminResultControllor.std8List.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${adminResultControllor.std8List[index].name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    } else if (std == 9) {
      return ListView.builder(
        itemCount: adminResultControllor.std9List.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${adminResultControllor.std9List[index].name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    } else if (std == 10) {
      return ListView.builder(
        itemCount: adminResultControllor.std10List.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              AdminStudentUidModel r1 = AdminStudentUidModel(
                uid: adminResultControllor.std10List[index].uid,
                name: adminResultControllor.std10List[index].name,
                std: adminResultControllor.std10List[index].std,
                mobile: adminResultControllor.std10List[index].mobile,
              );
              Get.toNamed(
                '/readResult',
                arguments: r1,
              );
            },
            child: ListTile(
              title: Text(
                "${adminResultControllor.std10List[index].name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Text("${adminResultControllor.std10List[index].std}"),
            ),
          );
        },
      );
    } else {
      return Text(
        "Bad Choice",
      );
    }
  }
}
