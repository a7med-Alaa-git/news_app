abstract class AppStates {}

class InitialState extends AppStates {}

class ChangeBottomNavBarIndexState extends AppStates {}

class GetBusinessDataFailureState extends AppStates {
  final String message;

  GetBusinessDataFailureState({required this.message});
}

class GetBusinessDataLoadingState extends AppStates {}

class GetBusinessDataSuccessState extends AppStates {}

class GetGeneralDataLoadingState extends AppStates {}

class GetGeneralDataSuccessState extends AppStates {}

class GetGeneralDataFailureState extends AppStates {
  final String message;

  GetGeneralDataFailureState({required this.message});
}
