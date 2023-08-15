import 'package:classes_app/Controllors/LeaveControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveReadScreen extends StatefulWidget {
  const LeaveReadScreen({super.key});

  @override
  State<LeaveReadScreen> createState() => _LeaveReadScreenState();
}

class _LeaveReadScreenState extends State<LeaveReadScreen> {
  LeaveControllor leaveControllor = Get.put(
    LeaveControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: leaveControllor.readLeave(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                "${snapshot.error}",
                style: GoogleFonts.archivo(),
              );
            } else if (snapshot.hasData) {
              leaveControllor.leaveList = snapshot.data!;
              return ListView.builder(
                itemCount: leaveControllor.leaveList.length,
                itemBuilder: (context, index) {
                  return Container(
                  child: Text("${leaveControllor.leaveList[index].firstName}"),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
