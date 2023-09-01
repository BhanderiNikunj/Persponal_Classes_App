import 'package:classes_app/main.dart';
import 'package:flutter/material.dart';

class ResultReadScreen extends StatefulWidget {
  const ResultReadScreen({super.key});

  @override
  State<ResultReadScreen> createState() => _ResultReadScreenState();
}

class _ResultReadScreenState extends State<ResultReadScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            allAppBar(
              text: "Student Result",
            ),
          ],
        ),
      ),
    );
  }
}
