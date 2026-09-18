import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/article_item.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({
    super.key,
    required this.articleList,
    required this.image,
  });
  final List<ArticleModel> articleList;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          ArticleItem(articleModel: articleList[index], image: image),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Divider(color: Colors.grey, height: 2),
      ),
      itemCount: articleList.length,
    );
  }
}
