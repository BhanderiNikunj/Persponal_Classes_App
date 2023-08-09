import 'package:classes_app/Login/LogIn/Controllor/LogInControllor.dart';
import 'package:classes_app/Models/AllModel.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  LogInControllor logInControllor = Get.put(
    LogInControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.asset(
                "Assets/Images/bright_op.png",
                height: 200,
              ),
              SizedBox(height: 10.sp),
              Text(
                "LogIn",
                style: GoogleFonts.archivo(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextField(
                controller: logInControllor.txtEmail,
                decoration: InputDecoration(
                  label: Text(
                    "Enter Email Id.",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  hintText: "Ex. user@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              TextField(
                controller: logInControllor.txtPassword,
                decoration: InputDecoration(
                  label: Text(
                    "Enter Email Id.",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  hintText: "Ex. user@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              InkWell(
                onTap: () {
                  LoginModel l1 = LoginModel(
                    email: logInControllor.txtEmail.text,
                    password: logInControllor.txtPassword.text,
                  );

                  logInControllor.logIn(
                    loginModel: l1,
                  );


                },
                child: allButton(
                  string: "Log In",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
