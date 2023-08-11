import 'dart:convert';

import 'package:classes_app/Models/FeesModel.dart';
import 'package:classes_app/Models/StudentModel.dart';
import 'package:classes_app/Models/StudentUidModel.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static ApiHelper apiHelper = ApiHelper._();

  ApiHelper._();

  // Student

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

  // Fees

  Future<bool> insertFees({
    required FeesModel f1,
  }) async {
    Uri uri = Uri.parse(
        "https://dicotyledonous-rest.000webhostapp.com/Bright-Api/Fees/insertFees.php");

    var response = await http.post(
      uri,
      body: {
        "firstName": f1.firstName,
        "std": f1.std,
        "uid": f1.uid,
        "totalFees": f1.totalFees,
        "paidFees": f1.paidFees,
      },
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updateFees({
    required FeesModel f1,
  }) async {
    Uri uri = Uri.parse(
        "https://dicotyledonous-rest.000webhostapp.com/Bright-Api/Fees/updateFees.php");

    var response = await http.post(
      uri,
      body: {
        "id": f1.id,
        "firstName": f1.firstName,
        "std": f1.std,
        "uid": f1.uid,
        "totalFees": f1.totalFees,
        "paidFees": f1.paidFees,
      },
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deleteFees({
    required FeesModel f1,
  }) async {
    Uri uri = Uri.parse(
        "https://dicotyledonous-rest.000webhostapp.com/Bright-Api/leave/deleteLeave.php");

    var response = await http.post(
      uri,
      body: {
        "id": f1.id,
      },
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List> readFees() async {
    Uri uri = Uri.parse(
        "https://dicotyledonous-rest.000webhostapp.com/Bright-Api/Fees/readFees.php");

    var response = await http.post(
      uri,
    );

    var json = jsonDecode(response.body);

    List l1 = json.map((e) => FeesModel.fromJson(e)).toList();

    if (response.statusCode == 200) {
      return l1;
    }
    return [];
  }

  Future<List> readStudentUid() async {
    Uri uri = Uri.parse(
        "https://dicotyledonous-rest.000webhostapp.com/Bright-Api/StudentUid/readStudentUid.php");

    var response = await http.get(uri);

    var json = jsonDecode(response.body);

    List l1 = json.map((e) => StudentUidModel.fromJson(e)).toList();
    return l1;
  }
}
