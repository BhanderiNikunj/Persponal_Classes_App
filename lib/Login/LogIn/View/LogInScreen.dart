import 'package:classes_app/Login/LogIn/Controllor/LogInControllor.dart';
import 'package:classes_app/Models/AllModel.dart';
import 'package:classes_app/Utiles/ApiHelper.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.sp),
                Image.asset(
                  "Assets/Images/bright.png",
                  height: 200,
                ),
                SizedBox(height: 10.sp),
                Text(
                  "Log In",
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

                    String check = await logInControllor.logIn(
                      loginModel: l1,
                    );

                    if (check == "true") {
                      Get.snackbar(
                        "LogIn Success",
                        "",
                      );

                      bool check = checkData(
                        email: logInControllor.txtEmail.text,
                      );

                      setState(() {});

                      if (check) {
                        Get.offAndToNamed(
                          '/check',
                          arguments: logInControllor.txtEmail.text,
                        );
                      } else {
                        Get.offAndToNamed(
                          '/check',
                          arguments: logInControllor.txtEmail.text,
                        );
                        print("$check----------------------------------------");
                      }
                    } else {
                      Get.snackbar(
                        "$check",
                        "",
                      );
                    }
                  },
                  child: allButton(
                    string: "Log In",
                  ),
                ),
                SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/signUp');
                  },
                  child: Text(
                    "Create A New Account ? SignUp",
                    style: GoogleFonts.archivo(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool checkData({
    String? email,
  }) {
    List l1 = [];
    FutureBuilder(
      future: ApiHelper.apiHelper.readUserDetail(
        email: email,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
          l1 = snapshot.data!;
          return Text(
            "${l1.length}",
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    if (l1.isEmpty) {
      return false;
    }
    return true;
  }
}
