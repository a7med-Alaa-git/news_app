import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
    required this.articleModel,
    required this.image,
  });
  final ArticleModel articleModel;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                articleModel.image ?? image,
                fit: BoxFit.cover,
                width: 140,
                height: 140,

               
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        articleModel.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      articleModel.date,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
