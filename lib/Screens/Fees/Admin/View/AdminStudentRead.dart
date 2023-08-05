import 'package:classes_app/Models/ReadStudentNameModel.dart';
import 'package:classes_app/Screens/Fees/Controllor/FeesControllor.dart';
import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminStudentRead extends StatefulWidget {
  const AdminStudentRead({super.key});

  @override
  State<AdminStudentRead> createState() => _AdminStudentReadState();
}

class _AdminStudentReadState extends State<AdminStudentRead> {
  FeesControllor feesControllor = Get.put(
    FeesControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                allAppBar(
                  text: "Student Name",
                ),
                Container(
                  height: 50.sp,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.sp),
            DropdownButton(
              isExpanded: true,
              value: feesControllor.std,
              items: [
                DropdownMenuItem(
                  value: 1,
                  child: Text(
                    "Std 1",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text(
                    "Std 2",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text(
                    "Std 3",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text(
                    "Std 4",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 5,
                  child: Text(
                    "Std 5",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 6,
                  child: Text(
                    "Std 6",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 7,
                  child: Text(
                    "Std 7",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 8,
                  child: Text(
                    "Std 8",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 9,
                  child: Text(
                    "Std 9",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 10,
                  child: Text(
                    "Std 10",
                    style: GoogleFonts.archivo(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                feesControllor.std = value!;
                setState(() {});
              },
            ),
            Expanded(
              child: studentName(
                std: feesControllor.std,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget studentName({
    required int std,
  }) {
    if (std == 10) {
      return StreamBuilder(
        stream: feesControllor.readStudentName(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            feesControllor.studentNameList.clear();
            for (var x in snapShot.data!.docs) {
              ReadStudentNameModel r1 = ReadStudentNameModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              feesControllor.studentNameList.add(r1);
            }

            return ListView.builder(
              itemCount: feesControllor.studentNameList.length,
              itemBuilder: (context, index) {
                return feesControllor.studentNameList[index].std != 10
                    ? Container()
                    : InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/adminFeesAdd',
                      arguments: feesControllor.studentNameList[index],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "${feesControllor.studentNameList[index].name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Text(
                      "${feesControllor.studentNameList[index].std}",
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
    } else if (std == 9) {
      return StreamBuilder(
        stream: feesControllor.readStudentName(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            feesControllor.studentNameList.clear();
            for (var x in snapShot.data!.docs) {
              ReadStudentNameModel r1 = ReadStudentNameModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              feesControllor.studentNameList.add(r1);
            }

            return ListView.builder(
              itemCount: feesControllor.studentNameList.length,
              itemBuilder: (context, index) {
                return feesControllor.studentNameList[index].std != 9
                    ? Container()
                    : InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/adminFeesAdd',
                      arguments: feesControllor.studentNameList[index],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "${feesControllor.studentNameList[index].name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Text(
                      "${feesControllor.studentNameList[index].std}",
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
    } else if (std == 8) {
      return StreamBuilder(
        stream: feesControllor.readStudentName(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            feesControllor.studentNameList.clear();
            for (var x in snapShot.data!.docs) {
              ReadStudentNameModel r1 = ReadStudentNameModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              feesControllor.studentNameList.add(r1);
            }

            return ListView.builder(
              itemCount: feesControllor.studentNameList.length,
              itemBuilder: (context, index) {
                return feesControllor.studentNameList[index].std != 8
                    ? Container()
                    : InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/adminFeesAdd',
                      arguments: feesControllor.studentNameList[index],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "${feesControllor.studentNameList[index].name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Text(
                      "${feesControllor.studentNameList[index].std}",
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
    } else if (std == 7) {
      return StreamBuilder(
        stream: feesControllor.readStudentName(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            feesControllor.studentNameList.clear();
            for (var x in snapShot.data!.docs) {
              ReadStudentNameModel r1 = ReadStudentNameModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              feesControllor.studentNameList.add(r1);
            }

            return ListView.builder(
              itemCount: feesControllor.studentNameList.length,
              itemBuilder: (context, index) {
                return feesControllor.studentNameList[index].std != 7
                    ? Container()
                    : InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/adminFeesAdd',
                      arguments: feesControllor.studentNameList[index],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "${feesControllor.studentNameList[index].name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Text(
                      "${feesControllor.studentNameList[index].std}",
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
    } else if (std == 6) {
      return StreamBuilder(
        stream: feesControllor.readStudentName(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            feesControllor.studentNameList.clear();
            for (var x in snapShot.data!.docs) {
              ReadStudentNameModel r1 = ReadStudentNameModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              feesControllor.studentNameList.add(r1);
            }

            return ListView.builder(
              itemCount: feesControllor.studentNameList.length,
              itemBuilder: (context, index) {
                return feesControllor.studentNameList[index].std != 6
                    ? Container()
                    : InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/adminFeesAdd',
                      arguments: feesControllor.studentNameList[index],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "${feesControllor.studentNameList[index].name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Text(
                      "${feesControllor.studentNameList[index].std}",
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
    } else if (std == 5) {
      return StreamBuilder(
        stream: feesControllor.readStudentName(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            feesControllor.studentNameList.clear();
            for (var x in snapShot.data!.docs) {
              ReadStudentNameModel r1 = ReadStudentNameModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              feesControllor.studentNameList.add(r1);
            }

            return ListView.builder(
              itemCount: feesControllor.studentNameList.length,
              itemBuilder: (context, index) {
                return feesControllor.studentNameList[index].std != 5
                    ? Container()
                    : InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/adminFeesAdd',
                      arguments: feesControllor.studentNameList[index],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "${feesControllor.studentNameList[index].name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Text(
                      "${feesControllor.studentNameList[index].std}",
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
    } else if (std == 4) {
      return StreamBuilder(
        stream: feesControllor.readStudentName(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            feesControllor.studentNameList.clear();
            for (var x in snapShot.data!.docs) {
              ReadStudentNameModel r1 = ReadStudentNameModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              feesControllor.studentNameList.add(r1);
            }

            return ListView.builder(
              itemCount: feesControllor.studentNameList.length,
              itemBuilder: (context, index) {
                return feesControllor.studentNameList[index].std != 4
                    ? Container()
                    : InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/adminFeesAdd',
                      arguments: feesControllor.studentNameList[index],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "${feesControllor.studentNameList[index].name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Text(
                      "${feesControllor.studentNameList[index].std}",
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
    } else if (std == 3) {
      return StreamBuilder(
        stream: feesControllor.readStudentName(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            feesControllor.studentNameList.clear();
            for (var x in snapShot.data!.docs) {
              ReadStudentNameModel r1 = ReadStudentNameModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              feesControllor.studentNameList.add(r1);
            }

            return ListView.builder(
              itemCount: feesControllor.studentNameList.length,
              itemBuilder: (context, index) {
                return feesControllor.studentNameList[index].std != 3
                    ? Container()
                    : InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/adminFeesAdd',
                      arguments: feesControllor.studentNameList[index],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "${feesControllor.studentNameList[index].name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Text(
                      "${feesControllor.studentNameList[index].std}",
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
    } else if (std == 2) {
      return StreamBuilder(
        stream: feesControllor.readStudentName(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            feesControllor.studentNameList.clear();
            for (var x in snapShot.data!.docs) {
              ReadStudentNameModel r1 = ReadStudentNameModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              feesControllor.studentNameList.add(r1);
            }

            return ListView.builder(
              itemCount: feesControllor.studentNameList.length,
              itemBuilder: (context, index) {
                return feesControllor.studentNameList[index].std != 2
                    ? Container()
                    : InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/adminFeesAdd',
                      arguments: feesControllor.studentNameList[index],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "${feesControllor.studentNameList[index].name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Text(
                      "${feesControllor.studentNameList[index].std}",
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
    } else if (std == 1) {
      return StreamBuilder(
        stream: feesControllor.readStudentName(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(
              "${snapShot.error}",
            );
          } else if (snapShot.hasData) {
            feesControllor.studentNameList.clear();
            for (var x in snapShot.data!.docs) {
              ReadStudentNameModel r1 = ReadStudentNameModel(
                uid: x['uid'],
                mobile: x['mobile'],
                name: x['name'],
                std: x['std'],
              );

              feesControllor.studentNameList.add(r1);
            }

            return ListView.builder(
              itemCount: feesControllor.studentNameList.length,
              itemBuilder: (context, index) {
                return feesControllor.studentNameList[index].std != 1
                    ? Container()
                    : InkWell(
                  onTap: () {
                    Get.toNamed(
                      '/adminFeesAdd',
                      arguments: feesControllor.studentNameList[index],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "${feesControllor.studentNameList[index].name}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Text(
                      "${feesControllor.studentNameList[index].std}",
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
    } else {
      return Container();
    }
  }
}
