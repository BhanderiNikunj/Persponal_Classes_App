import 'package:carousel_slider/carousel_slider.dart';
import 'package:classes_app/Models/ImageModel.dart';
import 'package:classes_app/Screens/Home/Controller/HomeControllor.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  HomeControllor homeControllor = Get.put(
    HomeControllor(),
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Container(
          width: 35.h,
          color: Colors.white,
          child: Column(
            children: [
              Text("hello"),
            ],
          ),
        ),
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
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.sp),
            StreamBuilder(
              stream: homeControllor.readImage(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    "${snapshot.error}",
                  );
                } else if (snapshot.hasData) {
                  homeControllor.imageList.clear();

                  for (var x in snapshot.data!.docs) {
                    ImageModel i1 = ImageModel(
                      image: x['image'],
                    );

                    homeControllor.imageList.add(i1);
                  }
                  return Container(
                    height: 200.sp,
                    child: CarouselSlider.builder(
                      itemCount: homeControllor.imageList.length,
                      itemBuilder: (context, index, realIndex) {
                        return Image.memory(
                          Uint8List.fromList(
                            homeControllor.imageList[index].image!.codeUnits,
                          ),
                        );
                      },
                      disableGesture: true,
                      carouselController:
                          homeControllor.buttonCarouselController,
                      options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        height: 200.sp,
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
