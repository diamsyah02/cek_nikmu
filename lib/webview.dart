import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key, required this.title});
  final String title;
  @override
  State<WebviewPage> createState() => WebviewPageState();
}

class WebviewPageState extends State<WebviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebView(
        initialUrl: 'https://ceknikmu.diamsyahh.com/',
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
