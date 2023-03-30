import 'package:flutter/widgets.dart';
import 'package:news_cloud/model/article_model.dart';
import 'package:news_cloud/services/news_services.dart';

import '../model/articles_model.dart';
import 'package:get/get.dart';

class ArticleViewModel extends GetxController {
  List<ArticleModel> _articles = [];
  final List<ArticleModel> _articlesbycategory = [];

  List<ArticleModel> get articles => _articles;
  List<ArticleModel> get articlesbycategory => _articlesbycategory;

  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  @override
  void onInit() async {
    super.onInit();
    await fetchdata();
  }

  Future<void> fetchdata() async {
    _loading.value = true;
    var datajson = await NewsApi().fetchArticles();
    ArticlesListModel articlesModel = ArticlesListModel.fromMap(datajson);

    _articles =
        articlesModel.articles.map((e) => ArticleModel.fromMap(e)).toList();
    _loading.value = false;

    update();
  }

  /*Future<void> fetchdatabyCategory(String category) async {
    _articlesbycategory = await NewsApi().fetchArticlescategory(category);
    notifyListeners();
  }*/
}
