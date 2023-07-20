import 'package:classes_app/Screen/HomeWork/ShowHomeWork/Model/HomeWorkModel.dart';
import 'package:classes_app/Screen/Login/AddUserDetail/Model/AddUserDetailModel.dart';
import 'package:classes_app/Screen/Massage/Model/MassageModel.dart';
import 'package:classes_app/Screen/Student/AddStudent/Model/StudentModel.dart';
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

  Future<void> hand(RemoteMessage massage) async {}

  // Notification

  Future<String?> findFCMToken() async {
    var fcmToken = await firebaseMessaging.getToken();
    print(fcmToken);
    return fcmToken;
  }

  // Future<void> initNotification() async {
  //   await firebaseMessaging.requestPermission();
  //
  //   findFCMToken();
  //
  //   NotificationSettings notificationSettings = NotificationSettings(
  //     alert: AppleNotificationSetting.enabled,
  //     announcement: AppleNotificationSetting.disabled,
  //     badge: AppleNotificationSetting.enabled,
  //     carPlay: AppleNotificationSetting.disabled,
  //     criticalAlert: AppleNotificationSetting.disabled,
  //     sound: AppleNotificationSetting.disabled,
  //     authorizationStatus: AuthorizationStatus.denied,
  //     lockScreen: AppleNotificationSetting.enabled,
  //     notificationCenter: AppleNotificationSetting.enabled,
  //     showPreviews: AppleShowPreviewSetting.always,
  //     timeSensitive: AppleNotificationSetting.enabled,
  //   );
  //
  //   if (notificationSettings.authorizationStatus ==
  //       AuthorizationStatus.authorized) {
  //     print("--------------");
  //   } else if (notificationSettings.authorizationStatus ==
  //       AuthorizationStatus.provisional) {
  //     print("-----------------------");
  //   } else {
  //     print("failed");
  //   }
  // }
  //
  // void sendMassage({required Massage, required Title}) {}

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
      "father": s1.father_name,
      "std": s1.std,
      "mobile_no": s1.mobile_no,
      "email_id": s1.email_id,
      "total_fees": s1.total_fees,
      "paid_fees": s1.paid_fees,
      "image": s1.image,
      "address": s1.address,
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

  Future<String> insertUserDetail({
    required AddUserDetailModel a1,
  }) async {
    return await firebaseFirestore
        .collection("user")
        .add(
          {
            "name": a1.name,
            "surname": a1.surname,
            "mobile": a1.mobileNo,
            "email": a1.emailId,
            "adminUser": a1.checkAdmin,
            "image": a1.image,
            "std": a1.std,
            "uid": a1.uid,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  Future<String> updateUserDetail({
    required AddUserDetailModel a1,
  }) async {
    print(a1.key);
    return await firebaseFirestore
        .collection("user")
        .doc(a1.key)
        .set(
          {
            "name": a1.name,
            "surname": a1.surname,
            "mobile": a1.mobileNo,
            "email": a1.emailId,
            "adminUser": a1.checkAdmin,
            "image": a1.image,
            "std": a1.std,
            "uid": a1.uid,
          },
        )
        .then(
          (value) => "success",
        )
        .catchError(
          (e) => "$e",
        );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readUSerDetail() {
    return firebaseFirestore.collection("user").snapshots();
  }

  // Admin

  Future<String> insertAdminDetail({
    required AddUserDetailModel a1,
  }) async {
    return await firebaseFirestore
        .collection("school")
        .doc(FindUid())
        .collection("detail")
        .add(
          {
            "name": a1.name,
            "surname": a1.surname,
            "mobile": a1.mobileNo,
            "email": a1.emailId,
            "adminUser": a1.checkAdmin,
            "image": a1.image,
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
    required AddUserDetailModel a1,
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
            "surname": a1.surname,
            "mobile": a1.mobileNo,
            "email": a1.emailId,
            "adminUser": a1.checkAdmin,
            "image": a1.image,
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
    required MassageModel m1,
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
    required MassageModel m1,
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
    required MassageModel m1,
  }) {
    return firebaseFirestore.collection("massage").doc(m1.key).delete();
  }

  // FCM

  void insertFCM({
    required fcm,
  }) {
    firebaseFirestore.collection("fcm").add(
      {
        "fcm": fcm,
      },
    );
  }

  void readFCM() {
    firebaseFirestore.collection("fcm").snapshots();
  }

  void insertResult() {}

// Future<String> insertImage({
//   required String image,
// }) async {
//   return await firebaseFirestore
//       .collection("school")
//       .doc(FindUid())
//       .collection("image")
//       .add(
//     {
//       "image": "$image",
//     },
//   )
//       .then(
//         (value) => "success",
//   )
//       .catchError(
//         (e) => "$e",
//   );
// }
//
// Future<String> deleteImage({
//   required id,
// }) async {
//   return await firebaseFirestore
//       .collection("school")
//       .doc(FindUid())
//       .collection("image")
//       .doc(id)
//       .delete()
//       .then(
//         (value) => "success",
//   )
//       .catchError(
//         (e) => "$e",
//   );
// }
//
// Stream<QuerySnapshot<Map<String, dynamic>>> readImage() {
//   return firebaseFirestore.collection("school").doc(FindUid()).collection("image").snapshots();
// }
}
