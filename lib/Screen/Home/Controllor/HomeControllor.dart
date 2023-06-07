import 'package:classes_app/Screen/Home/Model/HomeModel.dart';
import 'package:get/get.dart';

class HomeControllor extends GetxController {
  List<HomeModel> Types = [
    HomeModel(
      image: "Assets/Images/courses.png",
      name: "courses",
    ),
    HomeModel(
      image: "Assets/Images/student.png",
      name: "Student",
    ),
  ];
}
