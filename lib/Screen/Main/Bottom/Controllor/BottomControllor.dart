import 'package:classes_app/Screen/Main/Home/View/HomeScreen.dart';
import 'package:classes_app/Screen/Notes/View/NotesScreen.dart';
import 'package:classes_app/Screen/Profile/View/ProfileScreen.dart';
import 'package:get/get.dart';

class BottomControllor extends GetxController {

  RxInt isBottom = 0.obs;

  List Screens = [
    HomeScreen(),
    NotesScreen(),
    ProfileScreen(),
  ];
}
