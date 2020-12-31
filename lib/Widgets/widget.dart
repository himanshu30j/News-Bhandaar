import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/view/article_view.dart';

Widget appBarTitle(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("News",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        Text("Bhandar",
            style:
                TextStyle(color: Colors.blue[500], fontWeight: FontWeight.bold))
      ],
    ),
  );
}

// blog tile
class ArticleTile extends StatelessWidget {
  final String imageUrl, title, description, url;
  final DateTime date;
  ArticleTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.url,
      this.date});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      url: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        //color: Colors.pink,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: MediaQuery.of(context).size.width - 20.0,
                  height: 200.0,
                  fit: BoxFit.fill,
                )),
            SizedBox(height: 5.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(
                    wordSpacing: 2.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0),
              ),
            ),
            SizedBox(height: 6.0),
            Text(description,
                style: TextStyle(
                  wordSpacing: 3.0,
                  fontWeight: FontWeight.w200,
                )),
          ],
        ),
      ),
    );
  }
}

String apiKey = "4d0a985b92b143dbb26cf6570b568d72";
