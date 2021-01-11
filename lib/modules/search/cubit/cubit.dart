import 'package:courses/modules/search/cubit/states.dart';
import 'package:courses/shared/components/components.dart';
import 'package:courses/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchStateInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  List courses = [];

  int totalPages = 0;
  int currentPage = 2;

  getSearch(String q)
  {
    emit(SearchStateLoading());

    DioHelper.postData(
      path: 'lms/api/v1/search',
      data:
      {
        'q': q,
        'type':1,
      },
      query:
      {
        'page': 1,
      },
      token: getToken(),
    ).then((value)
    {
      emit(SearchStateSuccess());
      print(value.data.toString());

      courses = value.data['result']['data'] as List;

      //currentPage ++;
      totalPages = value.data['result']['last_page'];
    }).catchError((error)
    {
      emit(SearchStateError(error));
      print(error.toString());
    });
  }

  getMoreSearch()
  {
    emit(SearchStateLoadingMore());

    DioHelper.postData(
      path: 'lms/api/v1/courses',
      query:
      {
        'page': currentPage,
      },
      token: getToken(),
    ).then((value)
    {
      emit(SearchStateSuccess());
      print(value.data.toString());

      courses.addAll(value.data['result']['data'] as List);

      currentPage ++;
    }).catchError((error)
    {
      emit(SearchStateError(error));
      print(error.toString());
    });
  }
}