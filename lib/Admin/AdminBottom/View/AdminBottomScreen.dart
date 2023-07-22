import 'package:classes_app/Admin/AdminBottom/Controllor/AdminBottomControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class AdminBottomScreen extends StatefulWidget {
  const AdminBottomScreen({Key? key}) : super(key: key);

  @override
  State<AdminBottomScreen> createState() => _AdminBottomScreenState();
}

class _AdminBottomScreenState extends State<AdminBottomScreen> {
  AdminBottomControllor bottomControllor = Get.put(
    AdminBottomControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: bottomControllor.Screens[bottomControllor.isBottom.value],
        bottomNavigationBar: Obx(
          () => SlidingClippedNavBar(
            barItems: [
              BarItem(title: 'Home', icon: Icons.home),
              BarItem(title: 'Message', icon: Icons.message),
              BarItem(title: 'Profile', icon: Icons.person),
            ],
            selectedIndex: bottomControllor.isBottom.value,
            onButtonPressed: (index) {
              bottomControllor.isBottom.value = index;
            },
            inactiveColor: Color(0xff6E92FF),
            activeColor: Color(0xff7E82FF),
          ),
        ),
      ),
    );
  }
}
