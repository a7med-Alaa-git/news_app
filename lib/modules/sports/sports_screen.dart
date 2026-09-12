import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/widgets/articles_list_view.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ArticlesListView(
      articleList: AppCubit.get(context).sports,
      image:
          'https://student-cms.prd.timeshighereducation.com/sites/default/files/styles/default/public/different_sports.jpg?itok=CW5zK9vp',
    );
  }
}
