import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/widgets/articles_list_view.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined),
                    border: Theme.of(context).inputDecorationTheme.border,
                    focusedBorder: Theme.of(
                      context,
                    ).inputDecorationTheme.focusedBorder,
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: ArticlesListView(
                    articleList: AppCubit.get(context).general,
                    image: '',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
