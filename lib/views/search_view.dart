import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/widgets/articles_list_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
                  onChanged: (value) => AppCubit.get(context).searchData(value),
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined),
                    border: AppCubit.get(context).isDark
                        ? OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          )
                        : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                    enabledBorder: AppCubit.get(context).isDark
                        ? OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          )
                        : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                    focusedBorder: AppCubit.get(context).isDark
                        ? OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(12),
                          )
                        : OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                    floatingLabelStyle: AppCubit.get(context).isDark
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.white),
                    labelText: 'Search',
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: AppCubit.get(context).search.isEmpty
                      ? CircularProgressIndicator()
                      : ArticlesListView(
                          articleList: AppCubit.get(context).search,
                          image:
                              'https://thumbs.dreamstime.com/b/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg',
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
