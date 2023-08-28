import 'package:classes_app/Models/AllModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseHelper {
  static FirebaseHelper firebaseHelper = FirebaseHelper._();

  FirebaseHelper._();

  // Controllers

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  // Login

  Future<String> logIn({
    required LoginModel loginModel,
  }) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(
          email: loginModel.email!,
          password: loginModel.password!,
        )
        .then(
          (value) => "true",
        )
        .catchError(
          (e) => "$e",
        );
  }

  void signOut() {
    firebaseAuth.signOut();
  }

  bool checkLogin() {
    return firebaseAuth.currentUser?.uid != null;
  }

  String? findUid() {
    return firebaseAuth.currentUser?.uid;
  }

  String? findEmail() {
    return firebaseAuth.currentUser?.email;
  }
}
