import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_cloud/model/article_model.dart';
import 'package:news_cloud/model/articles_model.dart';

class NewsApi {
  // final apiKey = '44eebc0de2ba4712bc0f3827c1da8fbc';

  String uri =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=44eebc0de2ba4712bc0f3827c1da8fbc";
  Future fetchArticles() async {
    try {
      http.Response response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);

        return jsonData;
      } else {
        Get.snackbar(
          'error',
          response.statusCode.toString(),
        ).show();
      }
    } catch (ex) {
      Get.snackbar(
        'error',
        ex.toString(),
      ).show();
    }
  }

  Future fetchArticlescategory(String category) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=44eebc0de2ba4712bc0f3827c1da8fbc"));

      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articlesModel = ArticlesListModel.fromMap(jsonData);

        List<ArticleModel> articlesList =
            articlesModel.articles.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesList;
      } else {
        Get.snackbar(
          'error',
          response.statusCode.toString(),
        ).show();
      }
    } catch (ex) {
      Get.snackbar(
        'error',
        ex.toString(),
      ).show();
    }
  }
}
