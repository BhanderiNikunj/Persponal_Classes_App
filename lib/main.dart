import 'package:classes_app/Admin/AdminHome/View/AdminHomeScreen.dart';
import 'package:classes_app/Admin/AdminHomeWork/AddAdminHomeWork/View/AddHomeWorkScreen.dart';
import 'package:classes_app/Admin/AdminHomeWork/ShowHomeWork/View/ShowAdminHomeWork.dart';
import 'package:classes_app/Admin/AdminImageSet/View/ImageSetScreen.dart';
import 'package:classes_app/Admin/AdminMassage/View/AdminMassageScreen.dart';
import 'package:classes_app/Admin/AdminProfile/View/AdminProfileScreen.dart';
import 'package:classes_app/Admin/AdminResult/View/AdminAddStudentResultScreen.dart';
import 'package:classes_app/Admin/AdminResult/View/AdminReadStudentResultScreen.dart';
import 'package:classes_app/Admin/AdminResult/View/AdminResultScreen.dart';
import 'package:classes_app/Admin/AdminStudent/AdminAddStudent/View/AddStudentScreen.dart';
import 'package:classes_app/Admin/AdminStudent/ShowDetail/View/ShowDetailScreen.dart';
import 'package:classes_app/Admin/AdminStudent/readStudent/View/readStudentScreen.dart';
import 'package:classes_app/Login/AddUserDetail/View/AddUserDetailScreen.dart';
import 'package:classes_app/Login/SignIn/View/SignInScreen.dart';
import 'package:classes_app/Login/SignUp/View/SignUpScreen.dart';
import 'package:classes_app/Login/Splesh/View/SpleshScreen.dart';
import 'package:classes_app/Login/checkUser/View/checkUserScreen.dart';
import 'package:classes_app/User/UserHome/View/UserHomeScreen.dart';
import 'package:classes_app/User/UserHomeWork/View/UserHomeWorkScreen.dart';
import 'package:classes_app/User/UserMassage/View/UserMassageScreen.dart';
import 'package:classes_app/User/UserProfile/View/UserProfileScreen.dart';
import 'package:classes_app/User/UserResult/View/UserResultScreen.dart';
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
          debugShowCheckedModeBanner: false,
          // initialRoute: '/message',
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
              name: '/checkAdminUser',
              page: () => checkUserScreen(),
            ),
            GetPage(
              name: '/addUserDetail',
              page: () => AddUserDetailScreen(),
            ),






            GetPage(
              name: '/home',
              page: () => AdminHomeScreen(),
            ),
            GetPage(
              name: '/addStudent',
              page: () => AdminAddStudentScreen(),
            ),
            GetPage(
              name: '/showStudent',
              page: () => AdminReadStudentScreen(),
            ),
            GetPage(
              name: '/showDetail',
              page: () => AdminShowDetailScreen(),
            ),
            GetPage(
              name: '/homeWork',
              page: () => AdminShowHomeWorkScreen(),
            ),
            GetPage(
              name: '/addHomeWork',
              page: () => AdminAddHomeWorkScreen(),
            ),
            GetPage(
              name: '/message',
              page: () => AdminMassageScreen(),
            ),
            GetPage(
              name: '/profile',
              page: () => AdminProfileScreen(),
            ),
            GetPage(
              name: '/image',
              page: () => AdminImageSetScreen(),
            ),
            GetPage(
              name: '/result',
              page: () => AdminResultScreen(),
            ),
            GetPage(
              name: '/readResult',
              page: () => AdminReadStudentResultScreen(),
            ),
            GetPage(
              name: '/addResult',
              page: () => AdminAddStudentResultScreen(),
            ),











            GetPage(
              name: '/userHome',
              page: () => UserHomeScreen(),
            ),
            GetPage(
              name: '/userMassage',
              page: () => UserMassageScreen(),
            ),
            GetPage(
              name: '/userProfile',
              page: () => UserProfileScreen(),
            ),
            GetPage(
              name: '/userHomeWork',
              page: () => UserHomeWorkScreen(),
            ),
            GetPage(
              name: '/userResult',
              page: () => UserResultScreen(),
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
