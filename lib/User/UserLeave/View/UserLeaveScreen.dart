import 'package:classes_app/User/UserLeave/Controllor/UserLeaveControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserLeaveScreen extends StatefulWidget {
  const UserLeaveScreen({super.key});

  @override
  State<UserLeaveScreen> createState() => _UserLeaveScreenState();
}

class _UserLeaveScreenState extends State<UserLeaveScreen> {
  UserLeaveControllor userLeaveControllor = Get.put(
    UserLeaveControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}
