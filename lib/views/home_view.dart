import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('News Cloud'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              SizedBox(width: 7),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: AppCubit.get(context).items,
            currentIndex: AppCubit.get(context).currentindex,
            onTap: AppCubit.get(context).changeBottomNavBarIndex,
          ),
          body: AppCubit.get(
            context,
          ).screens[AppCubit.get(context).currentindex],
        );
      },
    );
  }
}
