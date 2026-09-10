import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/api_consumer.dart';
import 'package:news_app/core/api/end_points.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/general/general_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit({required this.api}) : super(InitialState());

  // ignore: strict_top_level_inference
  static AppCubit get(context) => BlocProvider.of(context);
  final ApiConsumer api;

  int currentindex = 0;
  List<Widget> screens = [
    GeneralScreen(),
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];

  List<ArticleModel> business = [];

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

  Future<List<ArticleModel>> getBusinessData() async {
    try {
      emit(Loading());
      final response = await api.get(
        EndPoints.topheadlines,
        queryParameters: {
          ApiKeys.apiKey: ApiKeys.apiKeyValue,
          ApiKeys.categoryKey: ApiKeys.categoryBusinessValue,
        },
      );
      emit(Success());
      Map<String, dynamic> jsonData = response;
      List<dynamic> articles = jsonData['articles'];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromjson(article);
        business.add(articleModel);
      }
    } on ServerException catch (e) {
      emit(Failure(message: e.errorModel.errorMessage));
    }
    return business;
  }
}
