import 'package:classes_app/Screen/Main/Bottom/Controllor/BottomControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  BottomControllor bottomControllor = Get.put(
    BottomControllor(),
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
              BarItem(title: 'notes', icon: Icons.notes),
              BarItem(title: 'Profile', icon: Icons.person),
            ],
            selectedIndex: bottomControllor.isBottom.value,
            onButtonPressed: (index) {
              setState(() {
                bottomControllor.isBottom.value = index;
              });
            },
            inactiveColor: Color(0xff6E92FF),
            activeColor: Color(0xff7E82FF),
          ),
        ),
      ),
    );
  }
}
