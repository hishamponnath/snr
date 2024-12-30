import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


import 'package:shared_preferences/shared_preferences.dart';
import 'package:snr/api/api.dart';
import 'package:snr/model/attendancemodel.dart';

class AttendanceService {
  final Client = http.Client();

  Future<List<Attendancemodel>?> getAllAttendance() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<Attendancemodel> AttendanceList = [];
    final token = pref.getString('token');

    if (kDebugMode) {
      print(token);
    }

    try {
      final response = await Client.get(
        Uri.parse("${API().baseUrl}${API().attendanceurl}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        for (var element in responseBody) {
          var attendancemodel = Attendancemodel.fromJson(element);
          AttendanceList.add(attendancemodel);
          if (kDebugMode) {
            print(attendancemodel);
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching Attendance: $e");
      }
    }
    return AttendanceList;
  }
}
