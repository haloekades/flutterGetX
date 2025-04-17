import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/news_model.dart';

class NewsController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      error('');
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        newsList.value = data.map((e) => NewsModel.fromJson(e)).toList();
      } else {
        error('Failed to load news');
      }
    } catch (e) {
      error('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
