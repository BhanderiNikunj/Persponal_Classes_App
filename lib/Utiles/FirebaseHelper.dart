import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static FirebaseHelper firebaseHelper = FirebaseHelper._();

  FirebaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // login start

  Future<String> signUp({required email, required password}) async {
    return await firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      return "success";
    }).catchError((e) {
      return "$e";
    });
  }

  Future<String> signIn({required email, required password}) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      return "success";
    }).catchError((e) {
      return "$e";
    });
  }

  bool checkLogin() {
    User? user = firebaseAuth.currentUser;
    if (user?.uid == null) {
      print(
          "---------------------------------------------------------------hello");

      return false;
    } else {
      print(
          "---------------------------------------------------------------hii");
      return true;
    }
  }

  void signOut() {
    firebaseAuth.signOut();
  }

  // login End

  void InsertStudentDetail() {
    User? user = firebaseAuth.currentUser;

    firebaseFirestore.collection("Student").doc("${user!.uid}").collection("").add({

    });
  }
}
