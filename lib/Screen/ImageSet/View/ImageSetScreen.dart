import 'dart:io';

import 'package:classes_app/Screen/ImageSet/Controllor/imageSetControllor.dart';
import 'package:classes_app/Screen/ImageSet/Model/ImageSetModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ImageSetScreen extends StatefulWidget {
  const ImageSetScreen({super.key});

  @override
  State<ImageSetScreen> createState() => _ImageSetScreenState();
}

class _ImageSetScreenState extends State<ImageSetScreen> {
  ImageSetControllor imageSetControllor = Get.put(
    ImageSetControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20.sp),
            Center(
              child: InkWell(
                onTap: () async {
                  print("-----------");
                  ImagePicker imagePiker = ImagePicker();

                  XFile? xfile =
                      await imagePiker.pickImage(source: ImageSource.gallery);

                  File file = File(xfile!.path);

                  print(file);

                  await file.readAsBytes().then((value) {
                    imageSetControllor.imageBytes = value;
                  });

                  imageSetControllor.ipath.value = String.fromCharCodes(
                    imageSetControllor.imageBytes!,
                  );

                  String msg = await imageSetControllor.insertImage(
                    image: imageSetControllor.ipath.value,
                  );

                  Get.snackbar(
                    "$msg",
                    "",
                  );
                },
                child: allButton(
                  string: "Add Image",
                ),
              ),
            ),
            SizedBox(height: 20.sp),
            Expanded(
              child: StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    imageSetControllor.imageList.clear();
                    for (var x in snapshot.data!.docs) {
                      ImageSetModel i1 = ImageSetModel(
                        key: x.id,
                        image: x['image'],
                      );

                      imageSetControllor.imageList.add(i1);
                    }
                    return ListView.builder(
                      itemCount: imageSetControllor.imageList.length,
                      itemBuilder: (context, index) {
                        // ignore: unnecessary_null_comparison
                        return imageSetControllor.ipath.value == null
                            ? null
                            : Container(
                                width: double.infinity,
                                height: 150.sp,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 150.sp,
                                      width: 100.sp,
                                      child: IconButton(
                                        onPressed: () {
                                          imageSetControllor.deleteImage(
                                            id: imageSetControllor
                                                .imageList[index].key,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 150.sp,
                                      width: 100.sp,
                                      child: Image.memory(
                                        Uint8List.fromList(
                                          imageSetControllor.imageList[index]
                                              .image!.codeUnits,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      },
                    );
                  }
                  return CircularProgressIndicator();
                },
                stream: imageSetControllor.readImage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
