import 'package:classes_app/Models/AllModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpControllor extends GetxController {

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  Future<String> signUp({
    required LoginModel loginModel,
  }) {
    return FirebaseHelper.firebaseHelper.signUp(
      loginModel: loginModel,
    );
  }
}
