import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/detail_page.dart';
import 'package:news_app/utils/constants/text_style_constant.dart';
import 'package:news_app/viewmodel/news_viewmodel.dart';

class ArticlesList extends StatelessWidget {
  final NewsViewModel newsViewModel;
  const ArticlesList({Key? key, required this.newsViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: newsViewModel.articles!.length,
        itemBuilder: (BuildContext context, int index) {
          final article = newsViewModel.articles![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => DetailPage(
                          newsViewModel: newsViewModel, index: index),
                    ));
              },
              borderRadius: BorderRadius.circular(20),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          article.urlToImage ??
                              "https://i.picsum.photos/id/512/200/300.jpg?hmac=la5xkVbvHxjdyuCGyQl9H0Hhom_c8BN-5heSmUIPUzE",
                          color: Colors.grey,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        article.title ?? "",
                        style: TextStyleConstants.bold20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        article.description ?? "",
                        style: TextStyleConstants.regular16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
