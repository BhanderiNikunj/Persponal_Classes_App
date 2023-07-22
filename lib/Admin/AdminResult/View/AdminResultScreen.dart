import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AdminResultScreen extends StatefulWidget {
  const AdminResultScreen({super.key});

  @override
  State<AdminResultScreen> createState() => _AdminResultScreenState();
}

class _AdminResultScreenState extends State<AdminResultScreen> {
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
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Container(
                    height: 50.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.black26,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Std ${index + 1}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
