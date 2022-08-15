import 'package:news_app/model/news_model.dart';

class NewsViewModel {
  final String country;
  final String category;
  final List<Articles>? articles;

  NewsViewModel(this.category, this.articles, this.country);
}
