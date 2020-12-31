import 'dart:convert';

import 'package:newsapp/Widgets/widget.dart';
import 'package:newsapp/model/articleModel.dart';
import 'package:http/http.dart' as http;

class NewsArticle {
  List<ArticleModel> news = List<ArticleModel>();
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = new ArticleModel();
          articleModel.author = element["author"];
          articleModel.title = element["title"];
          articleModel.description = element["description"];
          articleModel.url = element["url"];
          articleModel.urlToImage = element["urlToImage"];
          articleModel.publishedAt = DateTime.parse(element["publishedAt"]);
          articleModel.content = element["content"];
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> categoryNewsList = List<ArticleModel>();
  Future<void> getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = new ArticleModel();
          articleModel.author = element["author"];
          articleModel.title = element["title"];
          articleModel.description = element["description"];
          articleModel.url = element["url"];
          articleModel.urlToImage = element["urlToImage"];
          articleModel.publishedAt = DateTime.parse(element["publishedAt"]);
          articleModel.content = element["content"];
          categoryNewsList.add(articleModel);
        }
      });
    }
  }
}

// class CategoryNews {
//   List<CategoryNewsModel> categoryNewsList = List<CategoryNewsModel>();
//   Future<void> getCategoryNews(String category) async {
//     String url =
//         "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=4d0a985b92b143dbb26cf6570b568d72";
//     var response = await http.get(url);
//     var jsonData = jsonDecode(response.body);
//     if (jsonData["status"] == "ok") {
//       jsonData["sources"].forEach((element) {
//         CategoryNewsModel categoryNewsModel = new CategoryNewsModel();
//         categoryNewsModel.id = element["id"];
//         categoryNewsModel.name = element["name"];
//         categoryNewsModel.description = element["description"];
//         categoryNewsModel.url = element["url"];
//         categoryNewsModel.category = element["category"];
//         categoryNewsModel.language = element["language"];
//         categoryNewsModel.country = element["country"];
//         categoryNewsList.add(categoryNewsModel);
//       });
//     }
//   }
// }
