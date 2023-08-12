import 'package:classes_app/Models/AllModel.dart';
import 'package:get/get.dart';

class HomeControllor extends GetxController {
  List<TitleModel> titleList = [
    TitleModel(
      name: "Student",
      routes: '/studentRead',
      image: "Assets/Images/student.png",
    ),
    TitleModel(
      name: "Home Work",
      image: "Assets/Images/homeWork.png",
    ),
    TitleModel(
      name: "Fees",
      routes: '/feesRead',
      image: "Assets/Images/fees.png",
    ),
    TitleModel(
      name: "Massage",
      image: "Assets/Images/massage.png",
      routes: '/massageRead',
    ),
  ];
}
