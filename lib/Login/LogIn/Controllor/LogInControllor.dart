import 'package:classes_app/Models/AllModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInControllor extends GetxController {

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  Future<bool> logIn({
    required LoginModel loginModel,
  }) {
    return FirebaseHelper.firebaseHelper.logIn(
      loginModel: loginModel,
    );
  }
}
