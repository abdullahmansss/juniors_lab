abstract class CoursesStates {}

class CoursesStateInitial extends CoursesStates {}

class CoursesStateLoading extends CoursesStates {}

class CoursesStateLoadingMore extends CoursesStates {}

class CoursesStateSuccess extends CoursesStates {}

class CoursesStateError extends CoursesStates
{
  final error;

  CoursesStateError(this.error);
}