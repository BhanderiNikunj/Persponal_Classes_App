import 'package:classes_app/Screen/HomeWork/AddHomeWork/View/AddHomeWorkScreen.dart';
import 'package:classes_app/Screen/HomeWork/ShowHomeWork/View/ShowHomeWork.dart';
import 'package:classes_app/Screen/Login/AddUserDetail/View/AddUserDetailScreen.dart';
import 'package:classes_app/Screen/Login/SignIn/View/SignInScreen.dart';
import 'package:classes_app/Screen/Login/SignUp/View/SignUpScreen.dart';
import 'package:classes_app/Screen/Login/Splesh/View/SpleshScreen.dart';
import 'package:classes_app/Screen/Main/Bottom/View/BottomScreen.dart';
import 'package:classes_app/Screen/Main/Home/View/HomeScreen.dart';
import 'package:classes_app/Screen/Student/AddStudent/View/AddStudentScreen.dart';
import 'package:classes_app/Screen/Student/ShowDetail/View/ShowDetailScreen.dart';
import 'package:classes_app/Screen/Student/readStudent/View/readStudentScreen.dart';
import 'package:classes_app/Screen/User/Home/View/UserHomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
              name: '/',
              page: () => SpleshScreen(),
            ),
            GetPage(
              name: '/signIn',
              page: () => SignInScreen(),
            ),
            GetPage(
              name: '/signUp',
              page: () => SignUpScreen(),
            ),
            GetPage(
              name: '/home',
              page: () => HomeScreen(),
            ),
            GetPage(
              name: '/bottom',
              page: () => BottomScreen(),
            ),
            GetPage(
              name: '/addStudent',
              page: () => AddStudentScreen(),
            ),
            GetPage(
              name: '/showStudent',
              page: () => readStudentScreen(),
            ),
            GetPage(
              name: '/showDetail',
              page: () => ShowDetailScreen(),
            ),
            GetPage(
              name: '/homeWork',
              page: () => ShowHomeWorkScreen(),
            ),
            GetPage(
              name: '/addHomeWork',
              page: () => AddHomeWorkScreen(),
            ),
            GetPage(
              name: '/userHome',
              page: () => UserHomeScreen(),
            ),
            GetPage(
              name: '/addUserDetail',
              page: () => AddUserDetailScreen(),
            ),
          ],
        );
      },
    ),
  );
}
