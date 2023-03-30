import 'package:get/get.dart';
import 'package:news_cloud/viewmodel/aricles_viewmodel.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleViewModel());
  }
}
