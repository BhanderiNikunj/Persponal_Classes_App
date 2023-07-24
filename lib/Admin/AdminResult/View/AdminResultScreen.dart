import 'package:classes_app/Admin/AdminResult/Controllor/AdminResultControllor.dart';
import 'package:classes_app/Admin/AdminResult/Model/AdminStudentUidModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdminResultScreen extends StatefulWidget {
  const AdminResultScreen({super.key});

  @override
  State<AdminResultScreen> createState() => _AdminResultScreenState();
}

class _AdminResultScreenState extends State<AdminResultScreen> {
  AdminResultControllor adminResultControllor = Get.put(
    AdminResultControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                "Assets/Images/bright_op.png",
                height: 200.sp,
              ),
            ),
            Column(
              children: [
                Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    value: adminResultControllor.checkStd.value,
                    items: [
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "Std 1",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "Std 2",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text(
                          "Std 3",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 4,
                        child: Text(
                          "Std 4",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 5,
                        child: Text(
                          "Std 5",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 6,
                        child: Text(
                          "Std 6",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 7,
                        child: Text(
                          "Std 7",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 8,
                        child: Text(
                          "Std 8",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 9,
                        child: Text(
                          "Std 9",
                        ),
                      ),
                      DropdownMenuItem(
                        value: 10,
                        child: Text(
                          "Std 10",
                        ),
                      ),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        adminResultControllor.checkStd.value = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: studentList(
                    std: adminResultControllor.checkStd.value,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget studentList({
    required std,
  }) {
    if (std == 10) {
      return StreamBuilder(
        stream: adminResultControllor.readStudent(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            adminResultControllor.allStdList.clear();
            for (var x in snapShot.data!.docs) {
              AdminStudentUidModel a1 = AdminStudentUidModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              adminResultControllor.allStdList.add(a1);
            }

            return ListView.builder(
              itemCount: adminResultControllor.allStdList.length,
              itemBuilder: (context, index) {
                return adminResultControllor.allStdList[index].std != 10
                    ? Container()
                    : InkWell(
                        onTap: () {
                          AdminStudentUidModel r1 = AdminStudentUidModel(
                            uid: adminResultControllor.allStdList[index].uid,
                            name: adminResultControllor.allStdList[index].name,
                            std: adminResultControllor.allStdList[index].std,
                            mobile:
                                adminResultControllor.allStdList[index].mobile,
                          );
                          Get.toNamed(
                            '/readResult',
                            arguments: r1,
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${adminResultControllor.allStdList[index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Text(
                            "${adminResultControllor.allStdList[index].std}",
                          ),
                        ),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    else if (std == 9) {
      return StreamBuilder(
        stream: adminResultControllor.readStudent(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            adminResultControllor.allStdList.clear();
            for (var x in snapShot.data!.docs) {
              AdminStudentUidModel a1 = AdminStudentUidModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              adminResultControllor.allStdList.add(a1);
            }

            return ListView.builder(
              itemCount: adminResultControllor.allStdList.length,
              itemBuilder: (context, index) {
                return adminResultControllor.allStdList[index].std != 9
                    ? Container()
                    : InkWell(
                        onTap: () {
                          AdminStudentUidModel r1 = AdminStudentUidModel(
                            uid: adminResultControllor.allStdList[index].uid,
                            name: adminResultControllor.allStdList[index].name,
                            std: adminResultControllor.allStdList[index].std,
                            mobile:
                                adminResultControllor.allStdList[index].mobile,
                          );
                          Get.toNamed(
                            '/readResult',
                            arguments: r1,
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${adminResultControllor.allStdList[index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Text(
                            "${adminResultControllor.allStdList[index].std}",
                          ),
                        ),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    else if (std == 8) {
      return StreamBuilder(
        stream: adminResultControllor.readStudent(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            adminResultControllor.allStdList.clear();
            for (var x in snapShot.data!.docs) {
              AdminStudentUidModel a1 = AdminStudentUidModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              adminResultControllor.allStdList.add(a1);
            }

            return ListView.builder(
              itemCount: adminResultControllor.allStdList.length,
              itemBuilder: (context, index) {
                return adminResultControllor.allStdList[index].std != 8
                    ? Container()
                    : InkWell(
                        onTap: () {
                          AdminStudentUidModel r1 = AdminStudentUidModel(
                            uid: adminResultControllor.allStdList[index].uid,
                            name: adminResultControllor.allStdList[index].name,
                            std: adminResultControllor.allStdList[index].std,
                            mobile:
                                adminResultControllor.allStdList[index].mobile,
                          );
                          Get.toNamed(
                            '/readResult',
                            arguments: r1,
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${adminResultControllor.allStdList[index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Text(
                            "${adminResultControllor.allStdList[index].std}",
                          ),
                        ),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    else if (std == 7) {
      return StreamBuilder(
        stream: adminResultControllor.readStudent(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            adminResultControllor.allStdList.clear();
            for (var x in snapShot.data!.docs) {
              AdminStudentUidModel a1 = AdminStudentUidModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              adminResultControllor.allStdList.add(a1);
            }

            return ListView.builder(
              itemCount: adminResultControllor.allStdList.length,
              itemBuilder: (context, index) {
                return adminResultControllor.allStdList[index].std != 7
                    ? Container()
                    : InkWell(
                        onTap: () {
                          AdminStudentUidModel r1 = AdminStudentUidModel(
                            uid: adminResultControllor.allStdList[index].uid,
                            name: adminResultControllor.allStdList[index].name,
                            std: adminResultControllor.allStdList[index].std,
                            mobile:
                                adminResultControllor.allStdList[index].mobile,
                          );
                          Get.toNamed(
                            '/readResult',
                            arguments: r1,
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${adminResultControllor.allStdList[index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Text(
                            "${adminResultControllor.allStdList[index].std}",
                          ),
                        ),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    else if (std == 6) {
      return StreamBuilder(
        stream: adminResultControllor.readStudent(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            adminResultControllor.allStdList.clear();
            for (var x in snapShot.data!.docs) {
              AdminStudentUidModel a1 = AdminStudentUidModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              adminResultControllor.allStdList.add(a1);
            }

            return ListView.builder(
              itemCount: adminResultControllor.allStdList.length,
              itemBuilder: (context, index) {
                return adminResultControllor.allStdList[index].std != 6
                    ? Container()
                    : InkWell(
                        onTap: () {
                          AdminStudentUidModel r1 = AdminStudentUidModel(
                            uid: adminResultControllor.allStdList[index].uid,
                            name: adminResultControllor.allStdList[index].name,
                            std: adminResultControllor.allStdList[index].std,
                            mobile:
                                adminResultControllor.allStdList[index].mobile,
                          );
                          Get.toNamed(
                            '/readResult',
                            arguments: r1,
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${adminResultControllor.allStdList[index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Text(
                            "${adminResultControllor.allStdList[index].std}",
                          ),
                        ),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    else if (std == 5) {
      return StreamBuilder(
        stream: adminResultControllor.readStudent(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            adminResultControllor.allStdList.clear();
            for (var x in snapShot.data!.docs) {
              AdminStudentUidModel a1 = AdminStudentUidModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              adminResultControllor.allStdList.add(a1);
            }

            return ListView.builder(
              itemCount: adminResultControllor.allStdList.length,
              itemBuilder: (context, index) {
                return adminResultControllor.allStdList[index].std != 5
                    ? Container()
                    : InkWell(
                        onTap: () {
                          AdminStudentUidModel r1 = AdminStudentUidModel(
                            uid: adminResultControllor.allStdList[index].uid,
                            name: adminResultControllor.allStdList[index].name,
                            std: adminResultControllor.allStdList[index].std,
                            mobile:
                                adminResultControllor.allStdList[index].mobile,
                          );
                          Get.toNamed(
                            '/readResult',
                            arguments: r1,
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${adminResultControllor.allStdList[index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Text(
                            "${adminResultControllor.allStdList[index].std}",
                          ),
                        ),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    else if (std == 4) {
      return StreamBuilder(
        stream: adminResultControllor.readStudent(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            adminResultControllor.allStdList.clear();
            for (var x in snapShot.data!.docs) {
              AdminStudentUidModel a1 = AdminStudentUidModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              adminResultControllor.allStdList.add(a1);
            }

            return ListView.builder(
              itemCount: adminResultControllor.allStdList.length,
              itemBuilder: (context, index) {
                return adminResultControllor.allStdList[index].std != 4
                    ? Container()
                    : InkWell(
                        onTap: () {
                          AdminStudentUidModel r1 = AdminStudentUidModel(
                            uid: adminResultControllor.allStdList[index].uid,
                            name: adminResultControllor.allStdList[index].name,
                            std: adminResultControllor.allStdList[index].std,
                            mobile:
                                adminResultControllor.allStdList[index].mobile,
                          );
                          Get.toNamed(
                            '/readResult',
                            arguments: r1,
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${adminResultControllor.allStdList[index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Text(
                            "${adminResultControllor.allStdList[index].std}",
                          ),
                        ),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    else if (std == 3) {
      return StreamBuilder(
        stream: adminResultControllor.readStudent(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            adminResultControllor.allStdList.clear();
            for (var x in snapShot.data!.docs) {
              AdminStudentUidModel a1 = AdminStudentUidModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              adminResultControllor.allStdList.add(a1);
            }

            return ListView.builder(
              itemCount: adminResultControllor.allStdList.length,
              itemBuilder: (context, index) {
                return adminResultControllor.allStdList[index].std != 3
                    ? Container()
                    : InkWell(
                        onTap: () {
                          AdminStudentUidModel r1 = AdminStudentUidModel(
                            uid: adminResultControllor.allStdList[index].uid,
                            name: adminResultControllor.allStdList[index].name,
                            std: adminResultControllor.allStdList[index].std,
                            mobile:
                                adminResultControllor.allStdList[index].mobile,
                          );
                          Get.toNamed(
                            '/readResult',
                            arguments: r1,
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${adminResultControllor.allStdList[index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Text(
                            "${adminResultControllor.allStdList[index].std}",
                          ),
                        ),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    else if (std == 2) {
      return StreamBuilder(
        stream: adminResultControllor.readStudent(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            adminResultControllor.allStdList.clear();
            for (var x in snapShot.data!.docs) {
              AdminStudentUidModel a1 = AdminStudentUidModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              adminResultControllor.allStdList.add(a1);
            }

            return ListView.builder(
              itemCount: adminResultControllor.allStdList.length,
              itemBuilder: (context, index) {
                return adminResultControllor.allStdList[index].std != 2
                    ? Container()
                    : InkWell(
                        onTap: () {
                          AdminStudentUidModel r1 = AdminStudentUidModel(
                            uid: adminResultControllor.allStdList[index].uid,
                            name: adminResultControllor.allStdList[index].name,
                            std: adminResultControllor.allStdList[index].std,
                            mobile:
                                adminResultControllor.allStdList[index].mobile,
                          );
                          Get.toNamed(
                            '/readResult',
                            arguments: r1,
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${adminResultControllor.allStdList[index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Text(
                            "${adminResultControllor.allStdList[index].std}",
                          ),
                        ),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    else if (std == 1) {
      return StreamBuilder(
        stream: adminResultControllor.readStudent(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            adminResultControllor.allStdList.clear();
            for (var x in snapShot.data!.docs) {
              AdminStudentUidModel a1 = AdminStudentUidModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              adminResultControllor.allStdList.add(a1);
            }

            return ListView.builder(
              itemCount: adminResultControllor.allStdList.length,
              itemBuilder: (context, index) {
                return adminResultControllor.allStdList[index].std != 1
                    ? Container()
                    : InkWell(
                        onTap: () {
                          AdminStudentUidModel r1 = AdminStudentUidModel(
                            uid: adminResultControllor.allStdList[index].uid,
                            name: adminResultControllor.allStdList[index].name,
                            std: adminResultControllor.allStdList[index].std,
                            mobile:
                                adminResultControllor.allStdList[index].mobile,
                          );
                          Get.toNamed(
                            '/readResult',
                            arguments: r1,
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${adminResultControllor.allStdList[index].name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Text(
                            "${adminResultControllor.allStdList[index].std}",
                          ),
                        ),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    else {
      return Text(
        "Bad Choice",
      );
    }
  }
}
