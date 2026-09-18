import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/widgets/articles_list_view.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ArticlesListView(
          articleList: AppCubit.get(context).business,
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIMCdG8rNuhnV0vmek1XsbyvG5jvCg0qRFU284-V_8zt9KVlCeTXcVRvA&s=10',
        );
      },
    );
  }
}
