import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Widgets/widget.dart';
import 'package:newsapp/helper/listOfcategory.dart';
import 'package:newsapp/helper/newsArticle.dart';
import 'package:newsapp/model/articleModel.dart';
import 'package:newsapp/model/categoryModel.dart';
import 'package:newsapp/view/category_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = new List<CategoryModel>();
  List<ArticleModel> newsList = new List<ArticleModel>();

  bool _isLoading = true;
  void getNews() async {
    NewsArticle newsArticle = new NewsArticle();
    await newsArticle.getNews();
    newsList = newsArticle.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    category = categories();
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(context),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.0),
                // width: MediaQuery.of(context).size.width,
                height: 70.0,
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                          category[index].imageUrl, category[index].title);
                    }),
              ),
              //artcles
              Container(
                child: _isLoading
                    ? Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newsList.length,
                        itemBuilder: (context, index) {
                          return ArticleTile(
                            imageUrl: newsList[index].urlToImage ?? "",
                            title: newsList[index].title,
                            description: newsList[index].description ?? "",
                            date: newsList[index].publishedAt ?? "",
                            url: newsList[index].url ?? "",
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Caterory tile
class CategoryTile extends StatelessWidget {
  final imageurl, categoryName;
  CategoryTile(this.imageurl, this.categoryName);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryView(
                      categoryName: categoryName,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.only(right: 10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CachedNetworkImage(
                imageUrl: imageurl,
                width: 120.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60.0,
              width: 120.0,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
