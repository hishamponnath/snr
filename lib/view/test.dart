import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snr/api/api.dart';
import 'package:snr/model/associationmodel.dart'; // Ensure this model is defined properly

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Future<List<AssociationModel>> getData(int page) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse(
          "${API().baseUrl}${API().accountprofileassociationUrl}?page=$page&size=5000"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      try {
        // Directly decoding the response as a List<dynamic>
        final List<dynamic> data = jsonDecode(response.body);

        // Mapping the List<dynamic> to a List of AssociationModel
        return data.map((item) => AssociationModel.fromJson(item)).toList();
      } catch (e) {
        throw Exception('Error parsing response: $e');
      }
    } else {
      throw Exception(
          'Failed to load data, status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      body: FutureBuilder<List<AssociationModel>>(
        future: getData(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            // Display data from the list
            final associations = snapshot.data!;
            return ListView.builder(
              itemCount: associations.length,
              itemBuilder: (context, index) {
                final association = associations[index];
                return ListTile(
                  title: Text(association.accountProfileName ?? 'Unknown'),
                  subtitle:
                      Text('Location: ${association.locationName ?? 'N/A'}'),
                );
              },
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Test(),
  ));
}
