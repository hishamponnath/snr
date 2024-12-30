import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snr/view/database_helper.dart';
import 'package:snr/model/accountprofilemodel.dart';

import 'package:snr/api/api.dart';

class AccountProfileService {
  final client = http.Client();

  // Save account profiles into SQLite DB (local storage)
  Future<void> saveAccountProfilesToDB(
      List<AccountProfileModel> profiles) async {
    try {
      await DatabaseHelper.instance
          .deleteAllProfiles(); // Clear existing profiles
      await DatabaseHelper.instance
          .insertAccountProfiles(profiles); // Insert into DB
      print('Saved profiles to DB: ${profiles.length}');
    } catch (e) {
      print('Error saving profiles to DB: $e');
    }
  }

  // Fetch account profiles from the API
  Future<List<AccountProfileModel>> getAccountProfiles(int page) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<AccountProfileModel> accountProfileList = [];
    final token = pref.getString('token');

    try {
      final response = await client.get(
        Uri.parse(
            "${API().baseUrl}${API().accountprofileUrl}?page=$page&size=5000"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        for (var element in responseBody) {
          var accountProfileModel = AccountProfileModel.fromJson(element);
          accountProfileList.add(accountProfileModel);
        }

        // Save fetched profiles to SQLite DB
        await saveAccountProfilesToDB(accountProfileList);
      }
    } catch (e) {
      print("Error fetching data from API: $e");
    }

    return accountProfileList;
  }

  // Fetch account profiles from SQLite DB (local storage)
  Future<List<AccountProfileModel>> getAccountProfilesFromDB() async {
    try {
      return await DatabaseHelper.instance.getAllProfiles(); // Fetch from DB
    } catch (e) {
      print('Error fetching profiles from DB: $e');
      return [];
    }
  }
}
