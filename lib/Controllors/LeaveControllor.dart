import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:get/get.dart';

class LeaveControllor extends GetxController {
  List leaveList = [];

  Future<List> readLeave() {
    return ApiHelper.apiHelper.readLeave();
  }
}
