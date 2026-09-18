import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/views/home_view.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),

      theme: ThemeData(
        dividerColor: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarThemeData(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: Colors.deepOrange,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),

      darkTheme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        dividerColor: Colors.white,
        scaffoldBackgroundColor: HexColor('333739'),
        appBarTheme: AppBarThemeData(
          scrolledUnderElevation: 0,
          backgroundColor: HexColor('333739'),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor('333739'),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
        ),
      ),

      themeMode: ThemeMode.light,
    );
  }
}
