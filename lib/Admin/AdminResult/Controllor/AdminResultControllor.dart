import 'package:classes_app/Admin/AdminResult/Model/AdminResultModel.dart';
import 'package:classes_app/Admin/AdminResult/Model/AdminStudentUidModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminResultControllor extends GetxController {
  RxInt checkStd = 1.obs;

  TextEditingController txtMath = TextEditingController();
  TextEditingController txtSS = TextEditingController();
  TextEditingController txtSci = TextEditingController();
  TextEditingController txtEng = TextEditingController();
  TextEditingController txtTotal = TextEditingController();

  List<AdminResultModel> resultList = [];

  void insertResult({
    required AdminResultModel r1,
  }) {
    return FirebaseHelper.firebaseHelper.insertResult(
      r1: r1,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readResult() {
    return FirebaseHelper.firebaseHelper.readResult();
  }

  String findUid() {
    return FirebaseHelper.firebaseHelper.FindUid();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readStudent() {
    return FirebaseHelper.firebaseHelper.readStudentResult();
  }

  Future<void> deleteStudent({
    required AdminResultModel a1,
  }) {
    return FirebaseHelper.firebaseHelper.deleteStudentResult(a1: a1);
  }

  // void insert() {
  //   for (int i = 0; i < std10List.length; i++) {
  //     AdminStudentUidModel a1 = AdminStudentUidModel(
  //       uid: std10List[i].uid,
  //       mobile: std10List[i].mobile,
  //       std: std10List[i].std,
  //       name: std10List[i].name,
  //     );
  //     FirebaseHelper.firebaseHelper.insertStudentResult(a1: a1);
  //   }
  // }

  // List<AdminStudentUidModel> std1List = [];
  // List<AdminStudentUidModel> std2List = [];
  // List<AdminStudentUidModel> std3List = [];
  // List<AdminStudentUidModel> std4List = [];
  // List<AdminStudentUidModel> std5List = [];
  // List<AdminStudentUidModel> std6List = [];
  // List<AdminStudentUidModel> std7List = [
  //   AdminStudentUidModel(
  //     uid: "",
  //     std: 7,
  //     name: "Ansh Bhanderi",
  //     mobile: "6352431889",
  //   ),
  // ];
  // List<AdminStudentUidModel> std8List = [];
  // List<AdminStudentUidModel> std9List = [];
  // List<AdminStudentUidModel> std10List = [
  //   AdminStudentUidModel(
  //     uid: "jdSwOZrOXVegy7MA1gEUS0wg8X63",
  //     name: "Swati Kesari",
  //     std: 10,
  //     mobile: "9664750208",
  //   ),
  //   AdminStudentUidModel(
  //     uid: "7hVV2p0eAoYY2myYdRQ1X3f3Jmx1",
  //     name: "Ary Prajapati",
  //     std: 10,
  //     mobile: "9586189009",
  //   ),
  //   AdminStudentUidModel(
  //     uid: "17Fhr7hq7paqKQyCViEuqXK7OVb2",
  //     name: "Dhruvi Prajapati",
  //     std: 10,
  //     mobile: "9978544293",
  //   ),
  //   AdminStudentUidModel(
  //     uid: "PIpHauacAGOkw2Pjbn1yQzCO9053",
  //     name: "Khushi Kesari",
  //     std: 10,
  //     mobile: "9664750208",
  //   ),
  //   AdminStudentUidModel(
  //     uid: "BUw7fJTnU8NIVf7oN6pSnPT4Wv62",
  //     name: "Khushali Unagar",
  //     std: 10,
  //     mobile: "6353063195",
  //   ),
  //   AdminStudentUidModel(
  //     uid: "qN0yE7QqtQcsAg84Qr55vjmG4wq1",
  //     name: "Hemanshu Hingu",
  //     std: 10,
  //     mobile: "9824195717",
  //   ),
  //   AdminStudentUidModel(
  //     uid: "LlIcyGR3ecaxsHynArxHrrEHN833",
  //     name: "Nency Patel",
  //     std: 10,
  //     mobile: "6359262499",
  //   ),
  //   AdminStudentUidModel(
  //     uid: "POHG5A5pEvOM41H1S8lRr23udQ42",
  //     name: "Sagar Prajapati",
  //     std: 10,
  //     mobile: "9913873517",
  //   ),
  //   AdminStudentUidModel(
  //     uid: "HFT9bGjpYOP2a69kwJBbqbcFRQj1",
  //     name: "Riken Raval",
  //     std: 10,
  //     mobile: "8000326496",
  //   ),
  // ];

  List<AdminStudentUidModel> allStdList = [];
}
