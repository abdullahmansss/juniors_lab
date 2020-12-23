import 'package:courses/layout/cubit/cubit.dart';
import 'package:courses/layout/home.dart';
import 'package:courses/modules/register/cubit/cubit.dart';
import 'package:courses/modules/welcome/welcome_screen.dart';
import 'package:courses/shared/colors/colors_common.dart';
import 'package:courses/shared/components/components.dart';
import 'package:courses/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  var widget;

  await initPref().then((value)
  {
    if(getToken() != null && getToken().length > 0)
    {
      print('---- token exist');
      widget = HomeScreen();
    }
    else
      {
        print('---- token not exist');
        widget = WelcomeScreen();
      }
  });

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget
{
  var widget;

  MyApp(this.widget);

  @override
  Widget build(BuildContext context)
  {
    initApp();

    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Courses',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: defaultColor,
          ),
          primaryColor: defaultMaterialColor,
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: widget,
      ),
    );
  }
}