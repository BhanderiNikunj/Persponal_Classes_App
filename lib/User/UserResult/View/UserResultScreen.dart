import 'package:classes_app/Admin/AdminProfile/Model/AdminProfileModel.dart';
import 'package:classes_app/User/UserProfile/Controllor/UserProfileControllor.dart';
import 'package:classes_app/User/UserResult/Controllor/UserResultControllor.dart';
import 'package:classes_app/User/UserResult/Model/UserResultModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserResultScreen extends StatefulWidget {
  const UserResultScreen({super.key});

  @override
  State<UserResultScreen> createState() => _UserResultScreenState();
}

class _UserResultScreenState extends State<UserResultScreen> {
  UserResultControllor userResultControllor = Get.put(
    UserResultControllor(),
  );

  UserProfileControllor userProfileControllor = Get.put(
    UserProfileControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: userResultControllor.readStudentResult(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                ),
              );
            } else if (snapshot.hasData) {
              userResultControllor.resultList.clear();
              for (var x in snapshot.data!.docs) {
                UserResultModel u1 = UserResultModel(
                  total: x['total'],
                  uid: x['uid'],
                  math: x['math'],
                  sci: x['sci'],
                  ss: x['ss'],
                  totalOutOf: x['totalOutOf'],
                  eng: x['eng'],
                );
                //
                userResultControllor.resultList.add(u1);
              }
              return StreamBuilder(
                stream: userProfileControllor.readUserData(),
                builder: (context, snap) {
                  if (snap.hasError) {
                    return Text(
                      "${snap.error}",
                    );
                  } else if (snap.hasData) {
                    userProfileControllor.UserData.clear();
                    for (var x in snap.data!.docs) {
                      AdminProfileModel a1 = AdminProfileModel(
                        key: x.id,
                        adminUser: x['adminUser'],
                        email: x['email'],
                        image: x['image'],
                        mobile: x['mobile'],
                        name: x['name'],
                        surname: x['surname'],
                        std: x['std'],
                        uid: x['uid'],
                      );

                      userProfileControllor.UserData.add(a1);
                    }
                    return Column(
                      children: [
                        Container(
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
                                      "Bright Education Classes",
                                      style: TextStyle(
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
                        ),
                        Container(
                          height: 200.sp,
                          width: double.infinity,
                          margin: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            color: Colors.black12,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50.sp,
                                backgroundImage: MemoryImage(
                                  Uint8List.fromList(
                                    userProfileControllor
                                        .UserData[0].image!.codeUnits,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.sp),
                              Text(
                                "${userProfileControllor.UserData[0].name} ${userProfileControllor.UserData[0].surname}",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10.sp),
                              Text(
                                "Std :- ${userProfileControllor.UserData[0].std}",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10.sp),
                          height: 200.sp,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    decoration: BoxDecoration(),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Subject",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Math",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "SS",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sci",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Eng",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Total",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.sp),
                              Column(
                                children: [
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Total",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "30",
                                    ),
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "30",
                                    ),
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "30",
                                    ),
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "30",
                                    ),
                                  ),
                                  Container(
                                    height: 30.sp,
                                    width: 50.sp,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "120",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.sp),
                              Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      userResultControllor.resultList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return userResultControllor
                                                .resultList[index].uid !=
                                            userResultControllor.findUid()
                                        ? Container()
                                        : Row(
                                            children: [
                                              SizedBox(width: 10.sp),
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30.sp,
                                                    width: 50.sp,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Mark",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 30.sp,
                                                    width: 50.sp,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${userResultControllor.resultList[index].math}",
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 30.sp,
                                                    width: 50.sp,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${userResultControllor.resultList[index].ss}",
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 30.sp,
                                                    width: 50.sp,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${userResultControllor.resultList[index].sci}",
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 30.sp,
                                                    width: 50.sp,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${userResultControllor.resultList[index].eng}",
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 30.sp,
                                                    width: 50.sp,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${userResultControllor.resultList[index].totalOutOf}",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
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
