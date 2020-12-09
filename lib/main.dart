import 'package:courses/modules/register/cubit/cubit.dart';
import 'package:courses/modules/welcome/welcome_screen.dart';
import 'package:courses/shared/colors/colors_common.dart';
import 'package:courses/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    DioHelper();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Courses',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: defaultColor,
          ),
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}