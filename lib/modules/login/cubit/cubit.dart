import 'package:courses/modules/login/cubit/states.dart';
import 'package:courses/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(LoginStateInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  login({email, password})
  {
    emit(LoginStateLoading());

    DioHelper.postData(
      path: 'lms/oauth/token',
      data:
      {
        'grant_type':'password',
        'client_id':'1',
        'client_secret':'UFj2FJ7X2jQfSjtptUIadua4rb0yeZjKvVaS55T9',
        'username':'$email',
        'password':'$password',
      },
    ).then((value)
    {
      //print(value.toString());
      emit(LoginStateSuccess(value.data['access_token']));
    }).catchError((Error e)
    {
      print(e.toString());
      emit(LoginStateError(e.toString()));
    });
  }
}