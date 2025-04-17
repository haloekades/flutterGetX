import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/news_controller.dart';
import '../models/news_model.dart';

class HomePage extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News List')),
      body: Obx(() {
        if (newsController.isLoading.value && newsController.newsList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        if (newsController.error.isNotEmpty) {
          return Center(child: Text(newsController.error.value));
        }

        return RefreshIndicator(
          onRefresh: newsController.fetchNews,
          child: ListView.builder(
            itemCount: newsController.newsList.length,
            itemBuilder: (context, index) {
              final NewsModel news = newsController.newsList[index];
              return ListTile(
                title: Text(news.title),
                onTap: () {
                  Get.toNamed('/detail', arguments: news);
                },
              );
            },
          ),
        );
      }),
    );
  }
}