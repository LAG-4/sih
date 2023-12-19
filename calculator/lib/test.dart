import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Adhaar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Webview Demo')),
        body: WebViewExample(),
      ),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final TextEditingController _textEditingController = TextEditingController();
  final _url = 'https://myaadhaar.uidai.gov.in/check-aadhaar-validity'; // Replace with your website URL

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _textEditingController,
          decoration: InputDecoration(labelText: 'Enter Text'),
        ),
        ElevatedButton(
          onPressed: () {
            _loadWebPage();
          },
          child: Text('Load Webview'),
        ),
        Expanded(
          child: WebView(
            initialUrl: _url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) async {
              // WebView controller
              // Inject JavaScript to fill the input field on page load
              await webViewController.evaluateJavascript(
                'document.getElementById("yourInputId").value = "${_textEditingController.text}";',
              );
            },
          ),
        ),
      ],
    );
  }

  void _loadWebPage() {
    setState(() {});
  }
}
