import 'dart:io';

import 'package:classes_app/Models/ImageModel.dart';
import 'package:classes_app/Screens/Image/Controllor/AdminImageControllor.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AdminImageReadScreen extends StatefulWidget {
  const AdminImageReadScreen({super.key});

  @override
  State<AdminImageReadScreen> createState() => _AdminImageReadScreenState();
}

class _AdminImageReadScreenState extends State<AdminImageReadScreen> {
  AdminImageControllor adminImageControllor = Get.put(
    AdminImageControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Bright Education Classes",
                ),
                Container(
                  height: 50.sp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.offAndToNamed('/adminHome');
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
            SizedBox(height: 30.sp),
            InkWell(
              onTap: () async {
                ImagePicker imagePiker = ImagePicker();

                XFile? xfile =
                    await imagePiker.pickImage(source: ImageSource.gallery);

                File file = File(xfile!.path);

                print(file);

                await file.readAsBytes().then((value) {
                  adminImageControllor.imageBytes = value;
                });

                adminImageControllor.iPath = String.fromCharCodes(
                  adminImageControllor.imageBytes!,
                );

                ImageModel i1 = ImageModel(
                  image: adminImageControllor.iPath,
                );
                setState(() {});

                adminImageControllor.insertImage(
                  i1: i1,
                );
              },
              child: allButton(
                string: "Add",
              ),
            ),
            SizedBox(height: 30.sp),
            Expanded(
              child: StreamBuilder(
                stream: adminImageControllor.readImage(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "${snapshot.error}",
                    );
                  } else if (snapshot.hasData) {
                    adminImageControllor.imageList.clear();
                    for (var x in snapshot.data!.docs) {
                      ImageModel i1 = ImageModel(
                        image: x['image'],
                        key: x.id,
                      );

                      adminImageControllor.imageList.add(i1);
                    }
                    return ListView.builder(
                      itemCount: adminImageControllor.imageList.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 150.sp,
                              width: 150.sp,
                              child: IconButton(
                                onPressed: () {
                                  ImageModel i1 = ImageModel(
                                    key: adminImageControllor
                                        .imageList[index].key,
                                  );
                                  adminImageControllor.deleteImage(
                                    i1: i1,
                                  );
                                },
                                icon: Icon(
                                  Icons.delete,
                                ),
                              ),
                            ),
                            Container(
                              height: 150.sp,
                              width: 150.sp,
                              alignment: Alignment.center,
                              child: Image.memory(
                                Uint8List.fromList(
                                  adminImageControllor
                                      .imageList[index].image!.codeUnits,
                                ),
                                height: 130.sp,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
