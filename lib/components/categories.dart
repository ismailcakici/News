import 'package:flutter/material.dart';
import 'package:news_app/utils/constants/text_style_constant.dart';
import 'package:news_app/utils/data/categories_data.dart';
import 'package:news_app/viewmodel/news_listviewmodel.dart';
import 'package:provider/provider.dart';

class NewsCategories extends StatelessWidget {
  const NewsCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NewsListViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: CategorieList.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                provider.getArticlesByCategory(
                    CategorieList.categoriesTitles[index], provider.country);
                provider.changeCategory(CategorieList.categoriesTitles[index]);
              },
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          CategorieList.categories[index],
                          color: Colors.grey,
                          colorBlendMode: BlendMode.modulate,
                        ),
                      ),
                      Text(
                        CategorieList.categoriesTitles[index],
                        style: TextStyleConstants.bold16
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
