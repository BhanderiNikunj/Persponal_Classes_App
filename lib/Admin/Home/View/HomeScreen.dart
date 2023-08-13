import 'package:classes_app/Controllors/HomeControllor.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey key = GlobalKey();

  HomeControllor homeControllor = Get.put(
    HomeControllor(),
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
                // Container(
                //   height: 50.sp,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       IconButton(
                //         onPressed: () {
                //           // key.currentState?.openDrawer();
                //         },
                //         icon: Icon(
                //           Icons.menu,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(
                                  '${homeControllor.titleList[index].routes}');
                            },
                            child: Container(
                              margin: EdgeInsets.all(5.sp),
                              // color: Colors.black12,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    "${homeControllor.titleList[index].image}",
                                    height: 70.sp,
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: double.infinity,
                                    // color: Colors.black,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${homeControllor.titleList[index].name}",
                                      style: GoogleFonts.archivo(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: homeControllor.titleList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
