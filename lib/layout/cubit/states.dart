abstract class HomeStates {}

class HomeStateInitial extends HomeStates {}

class HomeStateIndex extends HomeStates {}

class HomeStateSuccess extends HomeStates {}

class HomeStateError extends HomeStates {
  final String error;

  HomeStateError(this.error);
}