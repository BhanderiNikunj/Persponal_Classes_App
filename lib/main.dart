import 'package:classes_app/Screen/HomeWork/AddHomeWork/View/AddHomeWorkScreen.dart';
import 'package:classes_app/Screen/HomeWork/ShowHomeWork/View/ShowHomeWork.dart';
import 'package:classes_app/Screen/ImageSet/View/ImageSetScreen.dart';
import 'package:classes_app/Screen/Login/AddUserDetail/View/AddUserDetailScreen.dart';
import 'package:classes_app/Screen/Login/SignIn/View/SignInScreen.dart';
import 'package:classes_app/Screen/Login/SignUp/View/SignUpScreen.dart';
import 'package:classes_app/Screen/Login/Splesh/View/SpleshScreen.dart';
import 'package:classes_app/Screen/User/Massage/View/UserMassageScreen.dart';
import 'package:classes_app/Screen/Main/Bottom/View/BottomScreen.dart';
import 'package:classes_app/Screen/Main/Home/View/HomeScreen.dart';
import 'package:classes_app/Screen/Massage/View/MassageScreen.dart';
import 'package:classes_app/Screen/Profile/View/ProfileScreen.dart';
import 'package:classes_app/Screen/Student/AddStudent/View/AddStudentScreen.dart';
import 'package:classes_app/Screen/Student/ShowDetail/View/ShowDetailScreen.dart';
import 'package:classes_app/Screen/Student/readStudent/View/readStudentScreen.dart';
import 'package:classes_app/Screen/User/Home/View/UserHomeScreen.dart';
import 'package:classes_app/Screen/User/UserProfile/View/UserProfileScreen.dart';
import 'package:classes_app/Screen/checkUser/View/checkUserScreen.dart';
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
          // initialRoute: '/userAdmin',
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
              name: '/userAdmin',
              page: () => checkUserScreen(),
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
              name: '/message',
              page: () => MassageScreen(),
            ),
            GetPage(
              name: '/userHome',
              page: () => UserHomeScreen(),
            ),
            GetPage(
              name: '/addUserDetail',
              page: () => AddUserDetailScreen(),
            ),
            GetPage(
              name: '/profile',
              page: () => ProfileScreen(),
            ),
            GetPage(
              name: '/image',
              page: () => ImageSetScreen(),
            ),
            GetPage(
              name: '/userMassage',
              page: () => UserMassageScreen(),
            ),
            GetPage(
              name: '/userProfile',
              page: () => UserProfileScreen(),
            ),
          ],
        );
      },
    ),
  );
}

Widget allButton({
  required string,
}) {
  return Container(
    height: 30.sp,
    width: 60.sp,
    decoration: BoxDecoration(
      border: Border.all(
        color: Color(0xff007060),
      ),
      borderRadius: BorderRadius.circular(10.sp),
      color: Color(0xff01957f),
    ),
    alignment: Alignment.center,
    child: Text(
      "$string",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: Colors.white,
      ),
    ),
  );
}