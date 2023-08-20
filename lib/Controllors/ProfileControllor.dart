import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:get/get.dart';

class ProfileControllor extends GetxController {
  List userDetail = [];

  Future<List> readUserDetail() {
    return ApiHelper.apiHelper.readUserDetail();
  }
}
