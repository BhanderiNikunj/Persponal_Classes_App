import 'package:classes_app/Screen/AddStudent/View/AddStudentScreen.dart';
import 'package:classes_app/Screen/Bottom/View/BottomScreen.dart';
import 'package:classes_app/Screen/Home/View/HomeScreen.dart';
import 'package:classes_app/Screen/SignIn/View/SignInScreen.dart';
import 'package:classes_app/Screen/SignUp/View/SignUpScreen.dart';
import 'package:classes_app/Screen/Splesh/View/SpleshScreen.dart';
import 'package:classes_app/Screen/readStudent/View/readStudentScreen.dart';
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
          ],
        );
      },
    ),
  );
}
