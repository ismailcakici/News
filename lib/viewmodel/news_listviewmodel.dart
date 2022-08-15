import 'package:flutter/cupertino.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/viewmodel/news_viewmodel.dart';
import '../model/news_model.dart';

enum AppStatus { loading, error, succes }

class NewsListViewModel with ChangeNotifier {
  List<String> countries = ["kr", "jp", "us", "tr"];
  String? selectedItem = "us";
  List categoriesTitles = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology",
  ];
  String category = "General";
  String country = "us";
  AppStatus appStatus = AppStatus.loading;
  NewsViewModel newsViewModel = NewsViewModel("", [], "");
  Future<void> getArticlesByCategory(String category, String country) async {
    List<Articles>? articles =
        await NewsService().getArticlesByCategorie(category, country);
    newsViewModel = NewsViewModel(category, articles, country);
    appStatus = articles!.isEmpty ? AppStatus.error : AppStatus.succes;
    notifyListeners();
  }

  changeDropDownButton(String? value) {
    selectedItem = value;
    notifyListeners();
  }

  changeCountry(String value) {
    country = value;
    notifyListeners();
  }

  changeCategory(String value) {
    category = value;
    notifyListeners();
  }
}
