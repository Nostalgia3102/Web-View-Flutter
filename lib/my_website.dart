import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyWebsite extends StatefulWidget {
  const MyWebsite({Key? key}) : super(key: key);

  @override
  State<MyWebsite> createState() => _MyWebsiteState();
}

class _MyWebsiteState extends State<MyWebsite> {
  double _progress = 0;
  late InAppWebViewController? inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var isLastPage = await inAppWebViewController?.canGoBack() ?? false;

        if (isLastPage) {
          inAppWebViewController?.goBack();
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                    url: WebUri("https://github.com/Nostalgia3102")),
                onWebViewCreated: (controller) {
                  inAppWebViewController = controller;
                },
                onProgressChanged: (controller, progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              if (_progress < 1)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: LinearProgressIndicator(
                      value: _progress,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
