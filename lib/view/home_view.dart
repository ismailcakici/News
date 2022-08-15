import 'package:flutter/material.dart';
import 'package:news_app/components/articles_list.dart';
import 'package:news_app/components/categories.dart';
import 'package:news_app/components/headline_text_widget.dart';
import 'package:news_app/utils/constants/text_style_constant.dart';
import 'package:news_app/utils/theme/theme_manager.dart';
import 'package:news_app/viewmodel/news_listviewmodel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () => Provider.of<NewsListViewModel>(context, listen: false)
          .getArticlesByCategory("general", "us"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<NewsListViewModel>(context);
    var themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: appBar(vm, themeManager),
      body: Column(
        children: [
          const HeadlineText(text: "Categories"),
          const NewsCategories(),
          const HeadlineText(text: "Headlines"),
          getWidgetByStatus(vm),
        ],
      ),
    );
  }

  AppBar appBar(NewsListViewModel vm, ThemeManager themeManager) {
    return AppBar(
      title: Text(
        "News",
        style: TextStyleConstants.bold24,
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(20),
          value: vm.selectedItem,
          items: vm.countries
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: (item) {
            vm.changeDropDownButton(item);
            vm.changeCountry(item as String);
            vm.getArticlesByCategory(vm.category, item);
          },
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            themeManager.changeTheme();
            themeManager.checkIcon();
          },
          icon: themeManager.iconMode,
        ),
      ],
    );
  }

  Widget getWidgetByStatus(NewsListViewModel vm) {
    switch (vm.appStatus.index) {
      case 0:
        return const Center(child: CircularProgressIndicator());
      case 1:
        return const Center(
          child: Text("error"),
        );
      default:
        return ArticlesList(newsViewModel: vm.newsViewModel);
    }
  }
}
