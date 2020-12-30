import 'package:courses/models/courses_model.dart';
import 'package:courses/modules/courses/cubit/cubit.dart';
import 'package:courses/modules/login/cubit/cubit.dart';
import 'package:courses/modules/register/cubit/cubit.dart';
import 'package:courses/shared/network/remote/dio_helper.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.I..allowReassignment = true;

Future init() async
{
  di.registerFactory<CoursesCubit>(
    () => CoursesCubit(
      di<DioHelper>(), // get singleton object that registered from dio helper
    ),
  );

  di.registerFactory<LoginCubit>(
        () => LoginCubit(
      di<DioHelper>(), // get singleton object that registered from dio helper
    ),
  );

  di.registerFactory<RegisterCubit>(
        () => RegisterCubit(
      di<DioHelper>(), // get singleton object that registered from dio helper
    ),
  );

  di.registerLazySingleton<DioHelper>(
    () => DioHelper(),
  );
}