import 'package:courses/modules/courses/cubit/states.dart';
import 'package:courses/shared/components/components.dart';
import 'package:courses/shared/network/local/shared_preferences.dart';
import 'package:courses/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesCubit extends Cubit<CoursesStates>
{
  DioHelper dioHelper;

  CoursesCubit(this.dioHelper) : super(CoursesStateInitial());
  static CoursesCubit get(context) => BlocProvider.of(context);

  List courses = [];

  getCourses()
  {
    emit(CoursesStateLoading());

    dioHelper.postData(
      path: 'lms/api/v1/courses',
      token: getToken(),
    ).then((value)
    {
      emit(CoursesStateSuccess());
      print(value.data.toString());

      courses = value.data['result']['data'] as List;
    }).catchError((error)
    {
      emit(CoursesStateError(error));
      print(error.toString());
    });
  }
}
