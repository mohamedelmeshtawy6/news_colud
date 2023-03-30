import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_cloud/viewmodel/aricles_viewmodel.dart';

class HomeView extends GetView<ArticleViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleViewModel>(
      builder: (con) => con.loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                _searchFormTextField(),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 15,
                            ),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                GetBuilder(
                                  init: ArticleViewModel(),
                                  builder: (c) => SizedBox(
                                    height: 200,
                                    child: Image.network(
                                        c.articles[index].image.toString()),
                                  ),
                                ),
                                GetBuilder<ArticleViewModel>(
                                  builder: (c) => Text(
                                    c.articles[index].title.toString(),
                                    maxLines: 1,
                                  ),
                                ),
                                GetBuilder<ArticleViewModel>(
                                  builder: (c) => Text(
                                    c.articles[index].desc.toString(),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: controller.articles.length),
                  ),
                ),
              ],
            )),
    );
  }
}

Widget _searchFormTextField() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
    child: TextFormField(
      decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          )),
    ),
  );
}
