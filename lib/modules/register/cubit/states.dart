abstract class RegisterStates {}

class RegisterStateInitial extends RegisterStates {}

class RegisterStateLoading extends RegisterStates {}

class RegisterStateSuccess extends RegisterStates {}

class RegisterStateError extends RegisterStates
{
  final error;

  RegisterStateError(this.error);
}