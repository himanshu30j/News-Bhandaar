import 'package:flutter/material.dart';
import 'package:newsapp/Widgets/widget.dart';

import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String url;
  ArticleView({@required this.url});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: appBarTitle(context),
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            Opacity(
              opacity: 0.0,
              child: Container(
                child: Icon(Icons.save),
              ),
            )
          ],
        ),
        body: Container(
          child: WebView(
            initialUrl: widget.url,
          ),
        ),
      ),
    );
  }
}
