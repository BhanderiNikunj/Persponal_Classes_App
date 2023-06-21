import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpControllor extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  Future<String> signUp({required email, required password}) async {
    return await FirebaseHelper.firebaseHelper.signUp(
      email: email,
      password: password,
    );
  }
}
