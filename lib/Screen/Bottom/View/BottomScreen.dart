import 'package:classes_app/Screen/Bottom/Controllor/BottomControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

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
          () => WaterDropNavBar(
            inactiveIconColor: Colors.black,
            bottomPadding: 10,
            waterDropColor: Colors.black,
            barItems: [
              BarItem(
                filledIcon: Icons.home,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                filledIcon: Icons.person,
                outlinedIcon: Icons.person_outline,
              ),
            ],
            selectedIndex: bottomControllor.isBottom.value,
            onItemSelected: (index) {
              bottomControllor.isBottom.value = index;
            },
          ),
        ),
      ),
    );
  }
}
