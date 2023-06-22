import 'package:classes_app/Screen/Main/Home/Model/HomeModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:get/get.dart';

class HomeControllor extends GetxController {
  List<HomeModel> Types = [
    HomeModel(
      image: "Assets/Images/student.png",
      name: "Student",
    ),
    HomeModel(
      image: "Assets/Images/courses.png",
      name: "HomeWork",
    ),
  ];

  void signOut() {
    FirebaseHelper.firebaseHelper.signOut();
  }
}
