import 'package:courses/modules/register/cubit/states.dart';
import 'package:courses/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  // create constructor to call super and pass initial state to super
  CounterCubit() : super(CounterStateInitial());

  // create object from my cubit -counter cubit- to call it from any where
  static CounterCubit get(context) => BlocProvider.of(context);

  // // create variables
  // int counter = 0;
  //
  // int counter2 = 5;
  //
  // // create plus method
  // plus()
  // {
  //   counter ++;
  //
  //   if(counter == 10)
  //     emit(CounterStateTen());
  //
  //   // go to counter state plus from initial state
  //   emit(CounterStatePlus());
  // }
  //
  // // create minus method
  // minus()
  // {
  //   counter --;
  //
  //   emit(CounterStateMinus());
  // }

  register({first, last, email, password, city})
  {
    emit(CounterStateLoading());

    DioHelper.postData(
      path: 'lms/api/v1/auth/signup-save',
      data:
      {
        'first_name':'$first',
        'last_name':'$last',
        'email':'$email',
        'password':'$password',
        'city':'$city',
      },
    ).then((value)
    {
      emit(CounterStateSuccess());
    });
  }
}