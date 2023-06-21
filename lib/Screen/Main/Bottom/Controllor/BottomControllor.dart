import 'package:classes_app/Screen/Main/Home/View/HomeScreen.dart';
import 'package:classes_app/Screen/Student/AddStudent/View/AddStudentScreen.dart';
import 'package:get/get.dart';

class BottomControllor extends GetxController {

  RxInt isBottom = 0.obs;

  List Screens = [
    HomeScreen(),
    AddStudentScreen(),
    HomeScreen(),
  ];
}
