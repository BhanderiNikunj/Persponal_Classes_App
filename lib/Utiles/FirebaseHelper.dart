import 'package:classes_app/Admin/AdminHomeWork/ShowHomeWork/Model/HomeWorkModel.dart';
import 'package:classes_app/Admin/AdminMassage/Model/AdminMassageModel.dart';
import 'package:classes_app/Admin/AdminProfile/Model/AdminProfileModel.dart';
import 'package:classes_app/Admin/AdminResult/Model/AdminResultModel.dart';
import 'package:classes_app/Admin/AdminStudent/AdminAddStudent/Model/AdminStudentModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FirebaseHelper {
  static FirebaseHelper firebaseHelper = FirebaseHelper._();

  FirebaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  // Notification

  Future<String?> findFCMToken() async {
    var fcmToken = await firebaseMessaging.getToken();
    print(fcmToken);
    return fcmToken;
  }

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
      return false;
    } else {
      return true;
    }
  }

  void signOut() {
    firebaseAuth.signOut();
    Get.offAndToNamed('/signIn');
  }

  // login End

  // Database Start

  void InsertStudentDetail({
    required AdminStudentModel s1,
  }) {
    print(FindUid());
    firebaseFirestore
        .collection("school")
        .doc("${FindUid()}")
        .collection("data")
        .add(
      {
        "f_name": s1.f_name,
        "l_name": s1.l_name,
        "father": s1.father_name,
        "std": s1.std,
        "mobile_no": s1.mobile_no,
        "email_id": s1.email_id,
        "total_fees": s1.total_fees,
        "paid_fees": s1.paid_fees,
        "image": s1.image,
        "address": s1.address,
      },
    );
  }

  Future<String> updateStudentDetail({
    required AdminStudentModel s1,
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
          "father": s1.father_name,
          "std": s1.std,
          "mobile_no": s1.mobile_no,
          "email_id": s1.email_id,
          "total_fees": s1.total_fees,
          "paid_fees": s1.paid_fees,
          "image": s1.image,
          "address": s1.address,
        })
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  void deleteDetail({
    required AdminStudentModel s1,
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

  // Homework

  Future<String> insertHomeWork({
    required HomeWorkModel h1,
  }) async {
    return await firebaseFirestore
        .collection("homeWork")
        .add(
          {
            "title": h1.title,
            "std": h1.std,
            "dueDate": h1.dueDate,
            "subject": h1.subject,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  Future<String> updateHomeWork({
    required HomeWorkModel h1,
  }) async {
    return await firebaseFirestore
        .collection("homeWork")
        .doc(h1.key)
        .set(
          {
            "title": h1.title,
            "std": h1.std,
            "dueDate": h1.dueDate,
            "subject": h1.subject,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  void deleteHomeWork({
    required HomeWorkModel h1,
  }) {
    firebaseFirestore.collection("homeWork").doc(h1.key).delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readHomeWork() {
    return firebaseFirestore.collection("homeWork").snapshots();
  }

  // user

  // Admin

  Future<String> insertAdminDetail({
    required AdminProfileModel a1,
  }) async {
    return await firebaseFirestore
        .collection("school")
        .doc(FindUid())
        .collection("detail")
        .add(
          {
            "name": a1.name,
            "uid": a1.uid,
            "surname": a1.surname,
            "mobile": a1.mobile,
            "email": a1.email,
            "adminUser": a1.adminUser,
            "image": a1.image,
            "std": a1.std,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  Future<String> updateAdminDetail({
    required AdminProfileModel a1,
  }) async {
    print(a1.key);
    return await firebaseFirestore
        .collection("school")
        .doc(FindUid())
        .collection("detail")
        .doc(a1.key)
        .set(
          {
            "name": a1.name,
            "uid": a1.uid,
            "surname": a1.surname,
            "mobile": a1.mobile,
            "email": a1.email,
            "adminUser": a1.adminUser,
            "image": a1.image,
            "std": a1.std,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readAdminDetail() {
    return firebaseFirestore
        .collection("school")
        .doc(FindUid())
        .collection("detail")
        .snapshots();
  }

  // image slider

  Future<String> insertImage({
    required String image,
  }) async {
    return await firebaseFirestore
        .collection("image")
        .add(
          {
            "image": "$image",
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  Future<String> deleteImage({
    required id,
  }) async {
    return await firebaseFirestore
        .collection("image")
        .doc(id)
        .delete()
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readImage() {
    return firebaseFirestore.collection("image").snapshots();
  }

  // Massage

  Future<String> insertMassage({
    required AdminMassageModel m1,
  }) async {
    return await firebaseFirestore
        .collection("massage")
        .add(
          {
            "msg": m1.msg,
            "date": m1.date,
            "time": m1.time,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  void updateMassage({
    required AdminMassageModel m1,
  }) {
    firebaseFirestore.collection("massage").doc(m1.key).set(
      {
        "msg": m1.msg,
        "date": m1.date,
        "time": m1.time,
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readMassage() {
    return firebaseFirestore.collection("massage").snapshots();
  }

  Future<void> deleteMassage({
    required AdminMassageModel m1,
  }) {
    return firebaseFirestore.collection("massage").doc(m1.key).delete();
  }

  // result

  void insertResult({
    required AdminResultModel r1,
  }) {
    firebaseFirestore.collection("result").add(
      {
        "math": r1.math,
        "socialScience": r1.socialScience,
        "science": r1.science,
        "english": r1.english,
        "total": r1.total,
        "uid": r1.uid,
        "totalOutOf": r1.totalOutOf,
        "monthNumber": r1.monthNumber,
        "std": r1.std,
        "mobile": r1.mobile,
        "name": r1.name,
      },
    );
  }

  void updateResult({
    required AdminResultModel r1,
  }) {
    print(r1.key);
    firebaseFirestore.collection("result").doc(r1.key).set(
      {
        "math": r1.math,
        "socialScience": r1.socialScience,
        "science": r1.science,
        "english": r1.english,
        "total": r1.total,
        "uid": r1.uid,
        "totalOutOf": r1.totalOutOf,
        "monthNumber": r1.monthNumber,
        "std": r1.std,
        "mobile": r1.mobile,
        "name": r1.name,
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readResult() {
    return firebaseFirestore.collection("result").snapshots();
  }

  Future<void> deleteResult({
    required AdminResultModel r1,
  }) {
    return firebaseFirestore.collection("result").doc(r1.key).delete();
  }

  // readStudentOnResult

  Stream<QuerySnapshot<Map<String, dynamic>>> readStudentOnResult() {
    return firebaseFirestore.collection("student").snapshots();
  }
}
