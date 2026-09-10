import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/widgets/articles_list_view.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ArticlesListView(
      articleList: AppCubit.get(context).business,
      image:
          'https://wintradoacademy.com/wp-content/uploads/2024/10/digital-business-1.jpg',
    );
  }
}
