import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/api_consumer.dart';
import 'package:news_app/core/api/end_points.dart';
import 'package:news_app/core/database/cache/cache_helper.dart';
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
  List<ArticleModel> general = [];
  List<ArticleModel> science = [];
  List<ArticleModel> sports = [];

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
    if (index == 1) {
      getBusinessData();
    }
    if (index == 2) {
      getScienceData();
    }
    if (index == 3) {
      getSportsData();
    }
    emit(ChangeBottomNavBarIndexState());
  }

  Future<List<ArticleModel>> getBusinessData() async {
    try {
      emit(GetBusinessDataLoadingState());
      if (business.isEmpty) {
        final response = await api.get(
          EndPoints.topheadlines,
          queryParameters: {
            ApiKeys.apiKey: ApiKeys.apiKeyValue,
            ApiKeys.categoryKey: ApiKeys.categoryBusinessValue,
          },
        );
        emit(GetBusinessDataSuccessState());
        Map<String, dynamic> jsonData = response;
        List<dynamic> articles = jsonData['articles'];
        for (var article in articles) {
          ArticleModel articleModel = ArticleModel.fromjson(article);
          business.add(articleModel);
        }
      } else {
        emit(GetBusinessDataSuccessState());
      }
    } on ServerException catch (e) {
      emit(GetBusinessDataFailureState(message: e.errorModel.errorMessage));
    }
    return business;
  }

  Future<List<ArticleModel>> getGeneralData() async {
    emit(GetGeneralDataLoadingState());
    try {
      if (general.isEmpty) {
        final response = await api.get(
          EndPoints.topheadlines,
          queryParameters: {
            ApiKeys.apiKey: ApiKeys.apiKeyValue,
            ApiKeys.categoryKey: ApiKeys.categoryGeneralValue,
          },
        );
        emit(GetGeneralDataSuccessState());
        Map<String, dynamic> jsonData = response;
        List<dynamic> articles = jsonData['articles'];
        for (var article in articles) {
          ArticleModel articleModel = ArticleModel.fromjson(article);
          general.add(articleModel);
        }
      } else {
        emit(GetGeneralDataSuccessState());
      }
    } on ServerException catch (e) {
      emit(GetGeneralDataFailureState(message: e.errorModel.errorMessage));
    }
    return general;
  }

  Future<List<ArticleModel>> getScienceData() async {
    emit(GetScienceDataLoadingState());
    try {
      if (science.isEmpty) {
        final response = await api.get(
          EndPoints.topheadlines,
          queryParameters: {
            ApiKeys.apiKey: ApiKeys.apiKeyValue,
            ApiKeys.categoryKey: ApiKeys.categoryScienceValue,
          },
        );
        emit(GetScienceDataSuccessState());
        Map<String, dynamic> jsonData = response;
        List<dynamic> articles = jsonData['articles'];
        for (var article in articles) {
          ArticleModel articleModel = ArticleModel.fromjson(article);
          science.add(articleModel);
        }
      } else {
        emit(GetScienceDataSuccessState());
      }
    } on ServerException catch (e) {
      emit(GetScienceDataFailureState(message: e.errorModel.errorMessage));
    }
    return science;
  }

  Future<List<ArticleModel>> getSportsData() async {
    emit(GetSportsDataLoadingState());
    try {
      if (sports.isEmpty) {
        final response = await api.get(
          EndPoints.topheadlines,
          queryParameters: {
            ApiKeys.apiKey: ApiKeys.apiKeyValue,
            ApiKeys.categoryKey: ApiKeys.categorySportsValue,
          },
        );
        emit(GetSportsDataSuccessState());
        Map<String, dynamic> jsonData = response;
        List<dynamic> articles = jsonData['articles'];
        for (var article in articles) {
          ArticleModel articleModel = ArticleModel.fromjson(article);
          sports.add(articleModel);
        }
      } else {
        emit(GetSportsDataSuccessState());
      }
    } on ServerException catch (e) {
      emit(GetSportsDataFailureState(message: e.errorModel.errorMessage));
    }
    return sports;
  }

  bool isDark = false;
  void changeMode({bool? isDarkFromShared}) {
    if (isDarkFromShared != null) {
      isDark = isDarkFromShared;
      emit(ChangeThemeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeThemeModeState());
      });
    }
  }

  List<ArticleModel> search = [];
  Future<List<ArticleModel>> searchData(String value) async {
    try {
    
      emit(GetSearchDataLoadingState());
      final response = await api.get(
        EndPoints.searchNewsData,
        queryParameters: {
          ApiKeys.searchKey: value,
          ApiKeys.apiKey: ApiKeys.apiKeyValue,
        },
      );
      emit(GetSearchDataSuccessState());
      Map<String, dynamic> jsonData = response;
      List<dynamic> articles = jsonData['articles'];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromjson(article);
        search.add(articleModel);
      }
    } on ServerException catch (e) {
      emit(GetSearchDataFailureState(message: e.errorModel.errorMessage));
    }
    return search;
  }
}
