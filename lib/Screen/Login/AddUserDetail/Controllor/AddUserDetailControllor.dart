import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUserDetailControllor extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSurname = TextEditingController();
  TextEditingController txtMobileNo = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  RxInt checkAdmin = 1.obs;
  RxString ipath = "".obs;
  Uint8List? imageBytes;
}
