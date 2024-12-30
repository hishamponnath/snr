import 'package:flutter/material.dart';
import 'dart:async';

import 'package:snr/view/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();

    // Start the fade-in animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigate to LoginScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showSplash = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: _showSplash
          ? Center(
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'image/salesnrich.png',
                      width: 200, // Increase width to make the image larger
                      height: 200, // Increase height to make the image larger
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'SalesNrich',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            40, // Increase font size for better visibility
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(), // Display nothing after splash duration
    );
  }
}
