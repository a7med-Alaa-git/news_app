// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/dio_consumer.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/general/general_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit({required this.api}) : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  final DioConsumer api;

  int currentindex = 0;
  List<Widget> screens = [
    GeneralScreen(),
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.newspaper_outlined),
      label: 'General',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business_rounded),
      label: 'Business',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
  ];

  void changeBottomNavBarIndex(int index) {
    currentindex = index;
    emit(ChangeBottomNavBarIndexState());
  }
}
