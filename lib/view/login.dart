import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:snr/api/api.dart';
import 'package:snr/model/usermodel.dart';
import 'package:snr/view/accountprofile.dart';

class AuthService {
  final http.Client _client = http.Client();

  Future<UserModel?> login(String username, String password) async {
    final Map<String, dynamic> body = {
      'username': username,
      'password': password
    };

    try {
      final Uri url = Uri.parse("${API().baseUrl}${API().authUrl}");
      final response = await _client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final UserModel user = UserModel.fromJson(result);

        // Save token, username, and password in local storage
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('token', user.idToken.toString());
        pref.setString('username', username);
        pref.setString('password', password);

        return user;
      } else {
        print("Request failed with status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (error) {
      print("Error during login: $error");
    }
    return null;
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  void _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("image/salesnrich.png"),
              const SizedBox(height: 24),
              Form(
                key: _loginKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernamecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid User Name";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "User Name",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Enter your username",
                        hintStyle: TextStyle(color: Colors.white60),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid Password";
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: "Enter your password",
                        hintStyle: const TextStyle(color: Colors.white60),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () async {
                  if (_loginKey.currentState!.validate()) {
                    AuthService authService = AuthService();
                    final user = await authService.login(
                        _usernamecontroller.text, _passwordcontroller.text);
                    if (user != null) {
                      // Navigate to AccountProfile screen
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountProfile(),
                        ),
                        (route) => false,
                      );
                    } else {
                      _showSnackbar('Invalid username or password');
                    }
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
