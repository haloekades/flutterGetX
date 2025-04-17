import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/news_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsModel news = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(news.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(news.content),
          ],
        ),
      ),
    );
  }
}
