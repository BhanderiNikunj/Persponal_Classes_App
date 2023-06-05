import 'package:classes_app/Screen/SignUp/Controllor/SignUpControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpControllor signUpControllor = Get.put(
    SignUpControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Center(
                    child: Image.asset(
                      height: 150.sp,
                      "Assets/Images/bright.jpg",
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  Center(
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Text(
                    "Enter Your Email",
                  ),
                  SizedBox(height: 5.sp),
                  TextField(
                    controller: signUpControllor.txtEmail,
                    decoration: InputDecoration(
                      hintText: "user@gmail.com",
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    "Enter Your Password",
                  ),
                  SizedBox(height: 5.sp),
                  TextField(
                    controller: signUpControllor.txtPassword,
                    decoration: InputDecoration(
                      hintText: "********",
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        String msg = await signUpControllor.signUp(
                          email: signUpControllor.txtEmail.text,
                          password: signUpControllor.txtPassword.text,
                        );

                        print(msg);
                      },
                      child: Container(
                        height: 40.sp,
                        width: 80.sp,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff007060),
                          ),
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Color(0xff01957f),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Have Already Account ? SignIn",
                        style: TextStyle(
                          color: Color(0xff01957f),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
