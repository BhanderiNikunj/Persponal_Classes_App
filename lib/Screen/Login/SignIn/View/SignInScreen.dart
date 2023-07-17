import 'package:classes_app/Screen/Login/SignIn/Controllor/SignInControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInControllor signInControllor = Get.put(
    SignInControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Center(
                    child: Image.asset(
                      height: 150.sp,
                      "Assets/Images/bright.png",
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  Center(
                    child: Text(
                      "LogIn",
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
                    controller: signInControllor.txtEmail,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
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
                  Obx(
                    () => TextField(
                      obscureText: signInControllor.isCheckPass == true ? false : true,
                      controller: signInControllor.txtPassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            signInControllor.isCheckPass.value =
                                !signInControllor.isCheckPass.value;
                          },
                          icon: Icon(signInControllor.isCheckPass == false ? Icons.visibility_off : Icons.visibility),
                        ),
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
                  ),
                  SizedBox(height: 30.sp),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        String msg = await signInControllor.signIn(
                          email: signInControllor.txtEmail.text,
                          password: signInControllor.txtPassword.text,
                        );

                        print(msg);

                        if (msg == "success") {
                          Get.offAndToNamed('/bottom');
                        }

                        Get.snackbar(
                          "$msg",
                          "",
                        );
                      },
                      child: Container(
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
                          "LogIn",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('/signUp');
                      },
                      child: Text(
                        "Create A New Account ? SignUp",
                        style: TextStyle(
                          color: Color(0xff01957f),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
