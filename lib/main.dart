import 'package:courses/modules/welcome/welcome_screen.dart';
import 'package:courses/shared/colors/colors_common.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: defaultColor,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: WelcomeScreen(),
    );
  }
}
