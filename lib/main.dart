import 'package:flutter/material.dart';
import 'package:snr/view/splash_view.dart';
import 'package:snr/view/webview.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(iconTheme: const IconThemeData(color: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: const WebViewContainer(),  
    );
  }
}
