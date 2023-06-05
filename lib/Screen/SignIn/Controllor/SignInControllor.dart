import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInControllor extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  Future<String> signIn({required email, required password}) async {
    return await FirebaseHelper.firebaseHelper.signIn(
      email: email,
      password: password,
    );
  }
}
