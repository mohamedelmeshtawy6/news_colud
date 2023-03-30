// ignore_for_file: public_member_api_docs, sort_constructors_first
class ArticleModel {
  String? title;
  String? image;
  String? desc;
  String? url;
  ArticleModel({
    required this.title,
    required this.image,
    required this.desc,
    required this.url,
  });

  ArticleModel.fromMap(Map<dynamic, dynamic> map) {
    title = map['title'];
    image = map['urlToImage'];
    desc = map['description'];
    url = map['url'];
  }
}
