abstract class AppStates {}

class InitialState extends AppStates {}

class ChangeBottomNavBarIndexState extends AppStates {}
class Failure extends AppStates{
  final String message;

  Failure({required this.message});
}
class Loading extends AppStates{}
class Success extends AppStates{}

