import 'package:classes_app/Authentication/AddAllData/View/AddAllDataScreen.dart';
import 'package:classes_app/Authentication/Splesh/View/SpleshScreen.dart';
import 'package:classes_app/Authentication/logIn/View/LogInScreen.dart';
import 'package:classes_app/Screens/Home/Admin/View/AdminHomeScreen.dart';
import 'package:classes_app/Screens/Home/User/View/UserHomeScreen.dart';
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
          getPages: [
            GetPage(
              name: '/',
              page: () => SpleshScreen(),
            ),
            GetPage(
              name: '/login',
              page: () => LogInScreen(),
            ),
            GetPage(
              name: '/addDetail',
              page: () => AddAllDetailScreen(),
            ),

            // Admin
            GetPage(
              name: '/adminHome',
              page: () => AdminHomeScreen(),
            ),

            // User
            GetPage(
              name: '/userHome',
              page: () => UserHomeScreen(),
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
      style: GoogleFonts.archivo(
        fontSize: 12.sp,
        color: Colors.white,
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
