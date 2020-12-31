import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Widgets/widget.dart';
import 'package:newsapp/helper/newsArticle.dart';
import 'package:newsapp/model/articleModel.dart';

class CategoryView extends StatefulWidget {
  final String categoryName;
  CategoryView({@required this.categoryName});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ArticleModel> categoryNewsList = List<ArticleModel>();
  bool _isLoading = true;
  getNews() async {
    CategoryNews categoryNews = new CategoryNews();
    await categoryNews.getCategoryNews(widget.categoryName.toLowerCase());
    categoryNewsList = categoryNews.categoryNewsList;
    setState(() {
      print(categoryNewsList[0]);
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(context),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Opacity(
            opacity: 0.0,
            child: Container(
              child: Icon(Icons.save),
            ),
          )
        ],
      ),
      body: _isLoading
          ? Container(child: Center(child: CircularProgressIndicator()))
          : Container(
              child: ListView.builder(
                  itemCount: categoryNewsList.length,
                  itemBuilder: (context, index) {
                    return ArticleTile(
                      imageUrl: categoryNewsList[index].urlToImage ?? "",
                      description: categoryNewsList[index].description ?? "",
                      title: categoryNewsList[index].title ?? "",
                      url: categoryNewsList[index].url ?? "",
                    );
                  })),
    );
  }
}
