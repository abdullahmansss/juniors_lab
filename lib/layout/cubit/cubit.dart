import 'dart:convert';

import 'package:courses/layout/cubit/states.dart';
import 'package:courses/modules/courses/courses_screen.dart';
import 'package:courses/modules/profile/profile_screen.dart';
import 'package:courses/modules/search/search_screen.dart';
import 'package:courses/modules/settings/settings_screen.dart';
import 'package:courses/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStateInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  var widget = [
    CoursesScreen(),
    SearchScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  var titles = [
    'Courses',
    'Search',
    'Profile',
    'Settings',
  ];

  int currentIndex = 0;

  changeIndex(index) {
    currentIndex = index;
    emit(HomeStateIndex());
  }

  sendNotification() async
  {
    var model = {
      "to": "/topics/juniors",
      "notification": {
        "title": "you have received a message from abdullah mansour",
        "body": "testing body from post man",
        "sound": "default"
      },
      "android": {
        "priority": "HIGH",
        "notification": {
          "notification_priority": "PRIORITY_MAX",
          "sound": "default",
          "default_sound": true,
          "default_vibrate_timings": true,
          "default_light_settings": true
        }
      },
      "data": {
        "url": "hhhhh",
        "id": "yyyyyy",
      }
    };

    await DioHelper.postNotification(
      path: 'fcm/send',
      data: jsonEncode(model),
    ).then((value) {
      print('success');
      emit(HomeStateSuccess());
    }).catchError((e) {
      print(e.toString());
      emit(HomeStateError(e.toString()));
    });
  }
}
