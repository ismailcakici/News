import 'package:flutter/material.dart';
import 'package:news_app/utils/theme/theme_manager.dart';
import 'package:news_app/utils/theme/theme_mode.dart';
import 'package:news_app/view/home_view.dart';
import 'package:news_app/viewmodel/news_listviewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => NewsListViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ThemeManager(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: const HomeView(),
    );
  }
}
