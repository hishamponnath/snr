import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snr/model/accountprofilemodel.dart';
import 'package:snr/model/territoriesmodel.dart';
import 'package:snr/service/accountprofileservice.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({super.key});

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  final AccountProfileService _accountProfileService = AccountProfileService();
  List<AccountProfileModel> _accountProfiles = [];
  List<AccountProfileModel> _filteredProfiles = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;

  // Territories data for dropdown
  List<TerritoriesModel> _territories = [];
  String? _selectedTerritory;

  @override
  void initState() {
    super.initState();
    _loadProfilesFromStorage(); // Load data from local storage (SQLite)
    _fetchTerritories(); // Fetch territories for dropdown
    _searchController.addListener(_filterProfiles);
  }

  // Load account profiles from SQLite DB (local storage)
  Future<void> _loadProfilesFromStorage() async {
    setState(() {
      _isLoading = true;
    });

    List<AccountProfileModel> profiles = await _accountProfileService
        .getAccountProfilesFromDB(); // Fetch from DB
    print('Loaded profiles from DB: ${profiles.length}');
    setState(() {
      _accountProfiles = profiles;
      _filteredProfiles = profiles;
      _isLoading = false;
    });
  }

  // Fetch profiles from API, save them into SQLite, and update UI
  Future<void> _fetchAndSaveProfiles() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<AccountProfileModel> profiles =
          await _accountProfileService.getAccountProfiles(0); // Fetch from API

      setState(() {
        _accountProfiles = profiles;
        _filteredProfiles = profiles;
        _isLoading = false;
      });
    } catch (error) {
      print("Error: $error");
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Fetch territories for dropdown
// Fetch territories for dropdown with token
  Future<void> _fetchTerritories() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');

      final response = await http.get(
        Uri.parse('http://salesnrich.com/api/territories'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Include token in header
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _territories = data.map((e) => TerritoriesModel.fromJson(e)).toList();
        });
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load territories');
      }
    } catch (error) {
      print('Error fetching territories: $error');
    }
  }

  // Filter profiles based on search query
  void _filterProfiles() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProfiles = _accountProfiles.where((profile) {
        return (profile.name != null &&
                profile.name!.toLowerCase().contains(query)) ||
            (profile.phone1 != null && profile.phone1!.contains(query));
      }).toList();
    });
  }

  // Method to make a call
  Future<void> _makeCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // // Method to handle menu option selection
  // void _onMenuSelected(String menu) {
  //   print('Selected menu: $menu');
  //   if (menu == 'Attendance') {
  //     print('Navigate to Attendance');
  //   } else if (menu == 'Settings') {
  //     print('Navigate to Settings');
  //   }
  // }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 4, 68, 121),
        child: Column(
          children: [],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text(
          "Account Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // leading: IconButton(
        //   icon: const Icon(Icons.sync, color: Colors.white),
        //   onPressed: _fetchAndSaveProfiles, // Fetch and save profiles
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync, color: Colors.white),
            onPressed: _fetchAndSaveProfiles, // Fetch and save profiles
          ),
        ],
        // actions: [
        //   PopupMenuButton<String>(
        //     icon: const Icon(Icons.more_vert, color: Colors.white),
        //     onSelected: _onMenuSelected, // Handle menu selection
        //     itemBuilder: (BuildContext context) {
        //       return [
        //         PopupMenuItem<String>(
        //           onTap: () {
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const AttendanceView()),
        //             );
        //           },
        //           value: 'Attendance',
        //           child: const Row(
        //             children: [
        //               Icon(Icons.access_time, color: Colors.black),
        //               SizedBox(width: 10),
        //               Text('Attendance'),
        //             ],
        //           ),
        //         ),
        //         PopupMenuItem<String>(
        //           onTap: () {},
        //           value: 'Punch In',
        //           child: const Row(
        //             children: [
        //               Icon(Icons.fingerprint, color: Colors.black),
        //               SizedBox(width: 10),
        //               Text('Punch In'),
        //             ],
        //           ),
        //         ),
        //         const PopupMenuItem<String>(
        //           value: 'Settings',
        //           child: Row(
        //             children: [
        //               Icon(Icons.settings, color: Colors.black),
        //               SizedBox(width: 10),
        //               Text('Settings'),
        //             ],
        //           ),
        //         ),
        //       ];
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          if (_isLoading) ...[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(),
            ),
            const Text(
              "Loading...",
              style: TextStyle(fontSize: 16),
            ),
          ],
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search by Name or Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedTerritory,
                    hint: const Text('Select Territory'),
                    items: _territories.map((territory) {
                      return DropdownMenuItem<String>(
                        value: territory.id,
                        child: Text(territory.name ?? 'Unknown'),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTerritory = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProfiles.length,
              itemBuilder: (context, index) {
                var profile = _filteredProfiles[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4.0,
                  color: Colors.grey[900],
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(2.0), // Border width
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          profile.name != null
                              ? profile.name![0].toUpperCase()
                              : 'N',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    title: Text(
                      profile.name ?? 'No Name',
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.phone1 ?? 'No Phone Number',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          profile.address ?? 'No Email Provided',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        if (profile.phone1 != null) {
                          _makeCall(profile.phone1!); // Make the call
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
