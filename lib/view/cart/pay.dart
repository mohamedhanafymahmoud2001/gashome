import 'package:flutter/material.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/mainAppUser.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class web extends StatefulWidget {
  final String paymentToken; // استلام التوكين من شاشة أخرى

  web({required this.paymentToken});

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<web> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // إعداد الـ WebViewController
    _controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted) // لتفعيل JavaScript
  ..setBackgroundColor(Colors.transparent) // للتأكد من عرض الخلفية بشكل صحيح
  ..setNavigationDelegate(
    NavigationDelegate(
      onPageStarted: (String url) {
        print('Started loading: $url');
      },
      onPageFinished: (String url) {
        print('Finished loading: $url');
      },
      onWebResourceError: (WebResourceError error) {
        print('Error: ${error.description}');
      },
    ),
  )
  ..loadRequest(Uri.parse(widget.paymentToken));

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
        return  Scaffold(
      appBar: AppBar(
        title: Text('Web Page'),
      ),
      body: WebViewWidget(controller: _controller),
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => MainAppUser()),
                                          (Route<dynamic> route) => false,
                                        );
                      val.switchBottomNavigatorBar(3);},child: Text("رجوع"),),
    );});
  }
}
