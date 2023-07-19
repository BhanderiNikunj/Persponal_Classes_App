import 'package:classes_app/Screen/Student/AddStudent/Model/StudentModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:get/get.dart';

class ReadStudentControllor extends GetxController {
  List<StudentModel> StudentDataList = [];
  RxInt checkStd = 0.obs;

  Future<String> updateStudentDetail({
    required StudentModel s1,
  }) async {
    return await FirebaseHelper.firebaseHelper.updateStudentDetail(
      s1: s1,
    );
  }

  void deleteDetail({
    required StudentModel s1,
  }) {
    FirebaseHelper.firebaseHelper.deleteDetail(
      s1: s1,
    );
  }
}
