import 'package:classes_app/Screen/Notes/Notes/Model/NotesModel.dart';
import 'package:classes_app/Utiles/FirebaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AnnouncementControllor extends GetxController {

  List<NotesModel> notesList = [];

  Stream<QuerySnapshot<Map<String, dynamic>>> readNotes() {
    return FirebaseHelper.firebaseHelper.readNotes();
  }
}
