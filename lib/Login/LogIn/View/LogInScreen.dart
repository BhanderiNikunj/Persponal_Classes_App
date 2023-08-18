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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: TextField(
                  controller: logInControllor.txtEmail,
                  style: GoogleFonts.archivo(),
                  cursorColor: Color(0xffe85720),
                  cursorWidth: 1,
                  cursorRadius: Radius.circular(50),
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () async {},
                      icon: Icon(
                        Icons.email,
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0x27e85720),
                    hintText: "Ex. user@gmail.com",
                    hintStyle: GoogleFonts.archivo(),
                    label: Text(
                      "Enter Email",
                      style: GoogleFonts.archivo(),
                    ),
                    labelStyle: GoogleFonts.archivo(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: TextField(
                  controller: logInControllor.txtPassword,
                  style: GoogleFonts.archivo(),
                  cursorColor: Color(0xffe85720),
                  cursorWidth: 1,
                  cursorRadius: Radius.circular(50),
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () async {},
                      icon: Icon(
                        Icons.lock,
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0x27e85720),
                    hintText: "Ex. * * * * * * * ",
                    hintStyle: GoogleFonts.archivo(),
                    label: Text(
                      "Enter Password",
                      style: GoogleFonts.archivo(),
                    ),
                    labelStyle: GoogleFonts.archivo(),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              InkWell(
                onTap: () async {
                  LoginModel l1 = LoginModel(
                    email: logInControllor.txtEmail.text,
                    password: logInControllor.txtPassword.text,
                  );

                  bool check = await logInControllor.logIn(
                    loginModel: l1,
                  );

                  if (check) {
                    Get.snackbar(
                      "LogIn Success",
                      "",
                    );

                    Get.offAndToNamed(
                      '/check',
                      arguments: logInControllor.txtEmail.text,
                    );
                  } else {
                    Get.snackbar(
                      "LogIn Un Success",
                      "",
                    );
                  }
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
