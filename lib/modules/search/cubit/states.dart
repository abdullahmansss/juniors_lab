abstract class SearchStates {}

class SearchStateInitial extends SearchStates {}

class SearchStateLoading extends SearchStates {}

class SearchStateLoadingMore extends SearchStates {}

class SearchStateSuccess extends SearchStates {}

class SearchStateError extends SearchStates
{
  final error;

  SearchStateError(this.error);
}