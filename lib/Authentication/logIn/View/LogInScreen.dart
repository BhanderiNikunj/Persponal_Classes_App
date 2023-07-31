import 'package:classes_app/Authentication/AddAllData/Model/AddAllDetailModel.dart';
import 'package:classes_app/Authentication/logIn/Controller/LogInController.dart';
import 'package:classes_app/Authentication/logIn/Model/LogInModel.dart';
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
  LogInController logInController = Get.put(
    LogInController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: logInController.readDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                "${snapshot.hasError}",
                style: GoogleFonts.archivo(
                  fontWeight: FontWeight.bold,
                ),
              );
            } else if (snapshot.hasData) {
              logInController.detailList.clear();
              for (var x in snapshot.data!.docs) {

                AddAllDetailModel addAllDetailModel = AddAllDetailModel(
                  std: x['std'],
                  adminUser: x['adminUser'],
                  key: x.id,
                  f_name: x['f_name'],
                  l_name: x['l_name'],
                  mobile: x['mobile'],
                  email: x['email'],
                );

                logInController.detailList.add(addAllDetailModel);
              }

              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "Assets/Images/bright.png",
                        height: 200.sp,
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Log In",
                        style: GoogleFonts.archivo(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      TextField(
                        controller: logInController.txtEmail,
                        style: GoogleFonts.archivo(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Ex. user@gmail.com",
                          hintStyle: GoogleFonts.archivo(),
                          label: Text("Email"),
                          labelStyle: GoogleFonts.archivo(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.sp,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.sp,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.sp,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.sp,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      TextField(
                        controller: logInController.txtPassword,
                        style: GoogleFonts.archivo(
                          color: Colors.black,
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye,
                            ),
                          ),
                          hintText: "Ex. * * * * * *",
                          hintStyle: GoogleFonts.archivo(),
                          label: Text("Password"),
                          labelStyle: GoogleFonts.archivo(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.sp,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.sp,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.sp,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.sp,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.sp),
                      InkWell(
                        onTap: () async {
                          LogInModel logInModel = LogInModel(
                            email: logInController.txtEmail.text,
                            password: logInController.txtPassword.text,
                          );
                          String msg = await logInController.logIn(
                              logInModel: logInModel);

                          if (msg == "success") {

                            if(logInController.detailList.isEmpty){
                              Get.offAndToNamed('/addDetail');
                            }
                            else{
                              Get.offAndToNamed('/home');
                            }

                            // Get.snackbar(
                            //   "Success",
                            //   "",
                            // );
                          } else {
                            Get.snackbar(
                              "$msg",
                              "",
                            );
                          }
                        },
                        child: allButton(
                          string: "LogIn",
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
