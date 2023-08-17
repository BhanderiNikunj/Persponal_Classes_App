import 'package:classes_app/Admin/Fees/View/FeesAddScreen.dart';
import 'package:classes_app/Admin/Fees/View/FeesReadScreen.dart';
import 'package:classes_app/Admin/Fees/View/StudentNameForFees.dart';
import 'package:classes_app/Admin/Home/View/HomeScreen.dart';
import 'package:classes_app/Admin/HomeWork/View/HomeWorkAddScreen.dart';
import 'package:classes_app/Admin/HomeWork/View/HomeWorkReadScreen.dart';
import 'package:classes_app/Admin/Leave/View/LeaveAddScreen.dart';
import 'package:classes_app/Admin/Leave/View/LeaveReadScreen.dart';
import 'package:classes_app/Admin/Massage/View/MassageAddScreen.dart';
import 'package:classes_app/User/Home/View/UserHomeScreen.dart';
import 'package:classes_app/User/Massage/View/UserMassageScreen.dart';
import 'package:classes_app/Admin/Massage/View/MassageReadScreen.dart';
import 'package:classes_app/Admin/Student/View/StudentAddScreen.dart';
import 'package:classes_app/Admin/Student/View/StudentReadScreen.dart';
import 'package:classes_app/Login/LogIn/View/LogInScreen.dart';
import 'package:classes_app/Login/Splesh/View/SpleshScreen.dart';
import 'package:classes_app/Utiles/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  NotificationHelper.helper.initNotification();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: ThemeData(useMaterial3: true),
          getPages: [
            GetPage(name: '/', page: () => SpleshScreen(),),
            GetPage(name: '/logIn', page: () => LogInScreen(),),
            GetPage(name: '/home', page: () => HomeScreen(),),
            GetPage(name: '/studentRead', page: () => StudentReadScreen(),),
            GetPage(name: '/studentAdd', page: () => StudentAddScreen(),),
            GetPage(name: '/homeWorkRead', page: () => HomeWorkReadScreen(),),
            GetPage(name: '/homeWorkAdd', page: () => HomeWorkAddScreen(),),
            GetPage(name: '/studentNameForFees', page: () => StudentNameForFeesScreen(),),
            GetPage(name: '/feesRead', page: () => FeesReadScreen(),),
            GetPage(name: '/feesAdd', page: () => FeesAddScreen(),),
            GetPage(name: '/massageRead', page: () => MassageReadScreen(),),
            GetPage(name: '/massageAdd', page: () => MassageAddScreen(),),
            GetPage(name: '/leaveRead', page: () => LeaveReadScreen(),),
            GetPage(name: '/leaveAdd', page: () => LeaveAddScreen(),),
            GetPage(name: '/UserHome', page: () => UserHomeScreen(),),
            GetPage(name: '/UserMassage', page: () => UserMassageScreen(),),
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
