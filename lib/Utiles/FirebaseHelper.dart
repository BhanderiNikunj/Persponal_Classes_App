import 'package:classes_app/Screen/AddStudent/Model/StudentModel.dart';
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

  // Database Start

  void InsertStudentDetail({
    required StudentModel s1,
  }) {
    print(FindUid());
    firebaseFirestore
        .collection("school")
        .doc("${FindUid()}")
        .collection("data")
        .add({
      "f_name": s1.f_name,
      "l_name": s1.l_name,
      "mobile_no": s1.mobile_no,
      "email_id": s1.email_id,
      "total_fees": s1.total_fees,
      "paid_fees": s1.paid_fees,
      "image": s1.image,
    });
  }

  Future<String> updateStudentDetail({
    required StudentModel s1,
  }) async {
    print(FindUid());
    return await firebaseFirestore
        .collection("school")
        .doc("${FindUid()}")
        .collection("data")
        .doc(s1.key)
        .set({
          "f_name": s1.f_name,
          "l_name": s1.l_name,
          "mobile_no": s1.mobile_no,
          "email_id": s1.email_id,
          "total_fees": s1.total_fees,
          "paid_fees": s1.paid_fees,
          "image": s1.image,
        })
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  void deleteDetail({
    required StudentModel s1,
  }) {
    firebaseFirestore
      ..collection("school")
          .doc("${FindUid()}")
          .collection("data")
          .doc(s1.key)
          .delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readStudentDetail() {
    return firebaseFirestore
        .collection("school")
        .doc("${FindUid()}")
        .collection("data")
        .snapshots();
  }

  String FindUid() {
    User? user = firebaseAuth.currentUser;
    String uid = user!.uid;
    print("${uid}");
    return uid;
  }
}
