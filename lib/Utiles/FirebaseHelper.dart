import 'package:classes_app/Models/AddAllDetailModel.dart';
import 'package:classes_app/Models/HomeWorkModel.dart';
import 'package:classes_app/Models/LogInModel.dart';
import 'package:classes_app/Models/StudentModel.dart';
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
    required LogInModel logInModel,
  }) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(
          email: logInModel.email!,
          password: logInModel.password!,
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
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

  // addAllData

  void insertDetail({
    required AddAllDetailModel addAllDetailModel,
  }) {
    firebaseFirestore
        .collection("detail")
        .doc(findUid())
        .collection("data")
        .add({
      "f_name": addAllDetailModel.f_name,
      "l_name": addAllDetailModel.l_name,
      "mobile_no": addAllDetailModel.mobile,
      "std": addAllDetailModel.std,
      "adminUser": addAllDetailModel.adminUser,
      "email": findEmail(),
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readDetail() {
    return firebaseFirestore
        .collection("detail")
        .doc(findUid())
        .collection("data")
        .snapshots();
  }

  // Add Student

  void insertStudent({
    required StudentModel s1,
  }) {
    firebaseFirestore.collection("student").add(
      {
        "f_name": s1.f_name,
        "l_name": s1.l_name,
        "father_name": s1.father_name,
        "mobile_no": s1.mobile_no,
        "std": s1.std,
      },
    );
  }

  void updateStudent({
    required StudentModel s1,
  }) {
    firebaseFirestore.collection("student").doc(s1.key).set(
      {
        "f_name": s1.f_name,
        "l_name": s1.l_name,
        "father_name": s1.father_name,
        "mobile_no": s1.mobile_no,
        "std": s1.std,
      },
    );
  }

  void deleteStudent({
    required StudentModel s1,
  }) {
    firebaseFirestore.collection("student").doc(s1.key).delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readStudent() {
    return firebaseFirestore.collection("student").snapshots();
  }

  // HomeWork

  void insertHomeWork({
    required HomeWorkModel h1,
  }) {
    firebaseFirestore.collection("homeWork").add(
      {
        "title": h1.title,
        "subject": h1.subject,
        "dueDate": h1.dueDate,
        "std": h1.std,
      },
    );
  }

  void updateHomeWork({
    required HomeWorkModel h1,
  }) {
    firebaseFirestore.collection("homeWork").doc(h1.key).set(
      {
        "title": h1.title,
        "subject": h1.subject,
        "dueDate": h1.dueDate,
        "std": h1.std,
      },
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

  // Fees

  void insertFees() {
    firebaseFirestore.collection("fees").add(
      {
        "Total Fees": 15000,
        "Paid Fees": 10000,
        "Less Fees": 5000,
        "student_name": "",
        "uid": "",
      },
    );
  }

  void updateFees() {
    firebaseFirestore.collection("fees").doc().set(
      {
        "Total Fees": 15000,
        "Paid Fees": 10000,
        "Less Fees": 5000,
        "student_name": "",
        "uid": "",
      },
    );
  }

  void deleteFees({
    required StudentModel s1,
  }) {
    firebaseFirestore.collection("fees").doc(s1.key).delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readFees() {
    return firebaseFirestore.collection("fees").snapshots();
  }

  // Image

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
}
