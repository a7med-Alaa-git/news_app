// ignore_for_file: strict_top_level_inference

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
}
