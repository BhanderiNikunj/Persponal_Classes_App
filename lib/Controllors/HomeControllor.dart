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
      routes: '/homeWorkRead',
    ),
    TitleModel(
      name: "Fees",
      routes: '/studentNameForFees',
      image: "Assets/Images/fees.png",
    ),
    TitleModel(
      name: "Result",
      routes: '/studentNameForResult',
      image: "Assets/Images/result.png",
    ),
    TitleModel(
      name: "Massage",
      image: "Assets/Images/massage.png",
      routes: '/massageRead',
    ),
    TitleModel(
      name: "Leave",
      image: "Assets/Images/leave.png",
      routes: '/leaveRead',
    ),
    TitleModel(
      name: "Profile",
      image: "Assets/Images/profile.png",
      routes: '/profile',
    ),
  ];

  List<TitleModel> userTitleList = [
    TitleModel(
      name: "Home Work",
      image: "Assets/Images/homeWork.png",
      routes: '/userHomeWork',
    ),
    TitleModel(
      name: "Massage",
      image: "Assets/Images/massage.png",
      routes: '/userMassage',
    ),
    TitleModel(
      name: "Leave",
      image: "Assets/Images/leave.png",
      routes: '/userLeaveRead',
    ),
    TitleModel(
      name: "Profile",
      image: "Assets/Images/profile.png",
      // routes: '/profile',
    ),
  ];
}
