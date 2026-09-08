import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/bloc_observer.dart';
import 'package:news_app/views/home_view.dart';

void main() {
  Bloc.observer =MyBlocObserver();
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
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          actionsIconTheme: IconThemeData(color: Colors.black, size: 38),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            // statusBarIconBrightness: Brightness.dark,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: Colors.deepOrange,
        ),
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(),
    );
  }
}
