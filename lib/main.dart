import 'package:classes_app/Admin/result/View/ResultAddScreen.dart';
import 'package:classes_app/Admin/result/View/ResultReadScreen.dart';
import 'package:classes_app/Admin/result/View/StudentNameForResult.dart';
import 'package:classes_app/Login/PageNotFound/View/PageNotFoundScreen.dart';
import 'package:classes_app/Login/SignUp/View/LogInScreen.dart';
import 'package:classes_app/User/Fees/View/UserFeesReadScreen.dart';
import 'package:classes_app/User/HomeWork/View/UserHomeWorkScreen.dart';
import 'package:classes_app/User/Leave/View/UserLeaveAddScreen.dart';
import 'package:classes_app/User/Leave/View/UserLeaveReadScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:classes_app/Admin/Student/View/StudentReadScreen.dart';
import 'package:classes_app/Admin/Student/View/StudentAddScreen.dart';
import 'package:classes_app/Admin/Fees/View/FeesAddScreen.dart';
import 'package:classes_app/Admin/Fees/View/FeesReadScreen.dart';
import 'package:classes_app/Admin/Fees/View/StudentNameForFees.dart';
import 'package:classes_app/Admin/Home/View/HomeScreen.dart';
import 'package:classes_app/Admin/HomeWork/View/HomeWorkAddScreen.dart';
import 'package:classes_app/Admin/HomeWork/View/HomeWorkReadScreen.dart';
import 'package:classes_app/Admin/Leave/View/LeaveAddScreen.dart';
import 'package:classes_app/Admin/Leave/View/LeaveReadScreen.dart';
import 'package:classes_app/Admin/Massage/View/MassageAddScreen.dart';
import 'package:classes_app/Login/AddDetail/View/AddDetailScreen.dart';
import 'package:classes_app/Login/Check/View/CheckScreen.dart';
import 'package:classes_app/Login/Profie/View/ProfileScreen.dart';
import 'package:classes_app/User/Home/View/UserHomeScreen.dart';
import 'package:classes_app/User/Massage/View/UserMassageScreen.dart';
import 'package:classes_app/Admin/Massage/View/MassageReadScreen.dart';
import 'package:classes_app/Login/LogIn/View/LogInScreen.dart';
import 'package:classes_app/Login/Splesh/View/SpleshScreen.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
   ScreenUtilInit (
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          getPages: [
            GetPage(
              name: '/',
              page: () => const SpleshScreen(),
            ),
            GetPage(
              name: '/logIn',
              page: () => const LogInScreen(),
            ),
            GetPage(
              name: '/signUp',
              page: () => const SignUpScreen(),
            ),
            GetPage(
              name: '/addDetail',
              page: () => const AddDetailScreen(),
            ),
            GetPage(
              name: '/pageNotFound',
              page: () => const PageNotFoundScreen(),
            ),
            GetPage(
              name: '/check',
              page: () => const CheckScreen(),
            ),
            GetPage(
              name: '/home',
              page: () => const HomeScreen(),
            ),
            GetPage(
              name: '/studentRead',
              page: () => const StudentReadScreen(),
            ),
            GetPage(
              name: '/studentAdd',
              page: () => const StudentAddScreen(),
            ),
            GetPage(
              name: '/homeWorkRead',
              page: () => const HomeWorkReadScreen(),
            ),
            GetPage(
              name: '/homeWorkAdd',
              page: () => const HomeWorkAddScreen(),
            ),
            GetPage(
              name: '/studentNameForFees',
              page: () => const StudentNameForFeesScreen(),
            ),
            GetPage(
              name: '/feesRead',
              page: () => const FeesReadScreen(),
            ),
            GetPage(
              name: '/feesAdd',
              page: () => const FeesAddScreen(),
            ),
            GetPage(
              name: '/studentNameForResult',
              page: () => const StudentNameForResultScreen(),
            ),
            GetPage(
              name: '/resultRead',
              page: () => const ResultReadScreen(),
            ),
            GetPage(
              name: '/resultAdd',
              page: () => const ResultAddScreen(),
            ),
            GetPage(
              name: '/massageRead',
              page: () => const MassageReadScreen(),
            ),
            GetPage(
              name: '/massageAdd',
              page: () => const MassageAddScreen(),
            ),
            GetPage(
              name: '/leaveRead',
              page: () => const LeaveReadScreen(),
            ),
            GetPage(
              name: '/leaveAdd',
              page: () => const LeaveAddScreen(),
            ),
            GetPage(
              name: '/profile',
              page: () => const ProfileScreen(),
            ),
            GetPage(
              name: '/userHome',
              page: () => const UserHomeScreen(),
            ),
            GetPage(
              name: '/userMassage',
              page: () => const UserMassageScreen(),
            ),
            GetPage(
              name: '/userHomeWork',
              page: () => const UserHomeWorkScreen(),
            ),
            GetPage(
              name: '/userLeaveRead',
              page: () => const UserLeaveReadScreen(),
            ),
            GetPage(
              name: '/userLeaveAdd',
              page: () => const UserLeaveAddScreen(),
            ),
            GetPage(
              name: '/userFeesRead',
              page: () => const UserFeesReadScreen(),
            ),
          ],
        );
      },
    ),
  );
}

/*
*
  * GoogleFonts.archivo
*
* */

// Object

Widget allButton({
  required string,
}) {
  return Container(
    height: 30.sp,
    width: 100.sp,
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
      style: GoogleFonts.archivo(
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget allAppBar({
  required String text,
}) {
  return Container(
    height: 50.sp,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.sp),
          bottomRight: Radius.circular(20.sp)),
      color: Color(0xffE85720),
    ),
    child: Stack(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$text",
                style: GoogleFonts.archivo(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
