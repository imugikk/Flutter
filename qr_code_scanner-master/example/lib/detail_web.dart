import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QrCodeWebView extends StatelessWidget{
  static const routeName = '/detail_web';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test QR Code'),
      ),

    );
  }
}
