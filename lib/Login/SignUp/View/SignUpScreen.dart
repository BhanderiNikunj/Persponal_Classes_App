import 'package:classes_app/Login/SignUp/Controllor/SignUpControllor.dart';
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
                      "Assets/Images/bright.png",
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  Center(
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 20.sp,
                        // fontWeight: FontWeight.bold,
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
                      obscureText: signUpControllor.isCheckPass == true ? false : true,
                      controller: signUpControllor.txtPassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            signUpControllor.isCheckPass.value =
                            !signUpControllor.isCheckPass.value;
                          },
                          icon: Icon(signUpControllor.isCheckPass == false ? Icons.visibility_off : Icons.visibility),
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
                        String msg = await signUpControllor.signUp(
                          email: signUpControllor.txtEmail.text,
                          password: signUpControllor.txtPassword.text,
                        );

                        if (msg == "success") {
                          Get.offAndToNamed('/addUserDetail');
                        }
                        Get.snackbar(
                          "$msg",
                          "",
                        );

                        print(msg);
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
                          "SignUp",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
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
