import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  const WebViewContainer({super.key});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onWebResourceError: (error) {
          print("WebView Error: ${error.errorCode}: ${error.description}");
        },
      ))
      ..loadRequest(Uri.parse('https://eportal.incometax.gov.in/iec/foservices/#/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("WebView Container"),
        ),
        body: WebViewWidget(
          controller: controller,
        ));
  }
}
