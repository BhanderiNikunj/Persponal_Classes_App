import 'dart:convert';

import 'package:classes_app/Models/StudentModel.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static ApiHelper apiHelper = ApiHelper._();

  ApiHelper._();

  Future<bool> insertStudent({
    required StudentModel s1,
  }) async {
    Uri uri = Uri.parse(
      "https://dicotyledonous-rest.000webhostapp.com/Bright-Api/student/insertStudent.php",
    );

    var response = await http.post(
      uri,
      body: {
        "fName": s1.firstName,
        "lName": s1.lastName,
        "faName": s1.fatherName,
        "mobileNo": s1.mobileNumber,
        "std": s1.std,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateStudent({
    required StudentModel s1,
  }) async {
    Uri uri = Uri.parse(
      "https://dicotyledonous-rest.000webhostapp.com/Bright-Api/student/updateStudent.php",
    );

    var response = await http.post(
      uri,
      body: {
        "id": s1.id,
        "fName": s1.firstName,
        "lName": s1.lastName,
        "faName": s1.fatherName,
        "mobileNo": s1.mobileNumber,
        "std": s1.std,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteStudent({
    required StudentModel s1,
  }) async {
    Uri uri = Uri.parse(
      "https://dicotyledonous-rest.000webhostapp.com/Bright-Api/student/deleteStudent.php",
    );

    var response = await http.post(
      uri,
      body: {
        "id": s1.id,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List> readStudent() async {
    Uri uri = Uri.parse(
      "https://dicotyledonous-rest.000webhostapp.com/Bright-Api/student/readStudent.php",
    );

    var response = await http.get(uri);

    var json = jsonDecode(response.body);

    List studentList = json.map((e) => StudentModel.fromJson(e)).toList();

    return studentList;
  }
}
