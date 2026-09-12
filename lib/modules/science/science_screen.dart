import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/widgets/articles_list_view.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ArticlesListView(
          articleList: AppCubit.get(context).science,
          image:
              'https://img.magnific.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg?semt=ais_hybrid&w=740&q=80',
        );
      },
    );
  }
}
