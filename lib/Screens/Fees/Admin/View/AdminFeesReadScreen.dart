import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminFeesReadScreen extends StatefulWidget {
  const AdminFeesReadScreen({super.key});

  @override
  State<AdminFeesReadScreen> createState() => _AdminFeesReadScreenState();
}

class _AdminFeesReadScreenState extends State<AdminFeesReadScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/adminFeesAdd');
          },
          backgroundColor: Color(0xff2660A6),
          child: Icon(
            Icons.add,
          ),
        ),
        body: StreamBuilder(
          builder: (context, snapshot) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
