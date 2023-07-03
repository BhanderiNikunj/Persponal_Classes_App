import 'package:classes_app/Screen/Notes/Notes/Model/NotesModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddNotesControllor extends GetxController {
  TextEditingController txtTask = TextEditingController();
  TextEditingController txtDate = TextEditingController(
      text:
          "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}");
  String? date;
  DateTime? dateTime = DateTime.now();

  Future<String> InsertNotes({
    required NotesModel n1,
  }) {
    return FirebaseHelper.firebaseHelper.insertNotes(
      n1: n1,
    );
  }

  Future<String> updateNotes({
    required NotesModel n1,
  }) {
    return FirebaseHelper.firebaseHelper.updateNotes(n1: n1,);
  }
}
