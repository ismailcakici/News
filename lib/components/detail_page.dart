import 'package:flutter/material.dart';
import 'package:news_app/utils/constants/text_style_constant.dart';
import 'package:news_app/viewmodel/news_viewmodel.dart';

class DetailPage extends StatelessWidget {
  final NewsViewModel newsViewModel;
  final int index;
  const DetailPage({Key? key, required this.newsViewModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var article = newsViewModel.articles![index];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article.title ?? "",
                  style: TextStyleConstants.bold26,
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    article.urlToImage ??
                        "https://i.picsum.photos/id/512/200/300.jpg?hmac=la5xkVbvHxjdyuCGyQl9H0Hhom_c8BN-5heSmUIPUzE",
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article.description ?? "",
                  style: TextStyleConstants.regular20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article.content ?? "",
                  style: TextStyleConstants.regular20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
