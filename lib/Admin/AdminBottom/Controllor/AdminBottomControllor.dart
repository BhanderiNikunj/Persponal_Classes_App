import 'package:classes_app/Admin/AdminHome/View/AdminHomeScreen.dart';
import 'package:classes_app/Admin/AdminMassage/View/AdminMassageScreen.dart';
import 'package:classes_app/Admin/AdminProfile/View/AdminProfileScreen.dart';
import 'package:get/get.dart';

class AdminBottomControllor extends GetxController {

  RxInt isBottom = 0.obs;

  List Screens = [
    AdminHomeScreen(),
    AdminMassageScreen(),
    AdminProfileScreen(),
  ];
}
