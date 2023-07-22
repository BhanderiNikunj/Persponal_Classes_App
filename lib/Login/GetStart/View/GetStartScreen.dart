import 'package:flutter/material.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {

    // Timer(Duration(seconds: 3), () {
    //   Get.offAndToNamed('/');
    // },);

    return SafeArea(
      child: Scaffold(),
    );
  }
}
