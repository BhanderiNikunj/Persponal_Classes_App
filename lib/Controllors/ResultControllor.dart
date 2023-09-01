import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:get/get.dart';

class ResultControllor extends GetxController {
  List studentUidList = [];
  String std = "1";

  Future<List> readStudentUid() {
    return ApiHelper.apiHelper.readStudentUid();
  }
}
