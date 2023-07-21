import 'package:classes_app/Admin/AdminStudent/AdminAddStudent/Model/AdminStudentModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:get/get.dart';

class AdminReadStudentControllor extends GetxController {
  List<AdminStudentModel> StudentDataList = [];
  RxInt checkStd = 0.obs;

  Future<String> updateStudentDetail({
    required AdminStudentModel s1,
  }) async {
    return await FirebaseHelper.firebaseHelper.updateStudentDetail(
      s1: s1,
    );
  }

  void deleteDetail({
    required AdminStudentModel s1,
  }) {
    FirebaseHelper.firebaseHelper.deleteDetail(
      s1: s1,
    );
  }
}