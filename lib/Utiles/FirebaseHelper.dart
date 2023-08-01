import 'package:classes_app/Authentication/AddAllData/Model/AddAllDetailModel.dart';
import 'package:classes_app/Authentication/logIn/Model/LogInModel.dart';
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

  void insertStudent() {
    firebaseFirestore.collection("student").add(
      {
        "f_name":"",
        "l_name":"",
        "father_name":"",
        "mobile_no":"",
      },
    );
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
