import 'package:classes_app/Screen/Notes/Notes/Model/NotesModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NotesControllor extends GetxController {
  List<NotesModel> notesList = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> readNotes() {
    return FirebaseHelper.firebaseHelper.readNotes();
  }

  Future<void> deleteNotes({
    required NotesModel n1,
  }) async {
    return await FirebaseHelper.firebaseHelper.deleteNotes(
      n1: n1,
    );
  }
}
