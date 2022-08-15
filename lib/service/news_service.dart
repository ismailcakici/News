import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class NewsService {
  Future<List<Articles>?> getArticlesByCategorie(
      String category, String country) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=5fce1fe88285466aba8ecc7db7938d6b");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = NewsModel.fromJson(json.decode(response.body));
      return result.articles;
    }
    throw Exception();
  }
}
