import 'dart:convert';

import 'package:get_it/get_it.dart';

class CoursesModel
{
  Map coursesJson;

  static Future<CoursesModel> init(String json) async
  {
    print('----- init model => $json');

    return CoursesModel(jsonDecode(json));
  }

  static CoursesModel get get => GetIt.I<CoursesModel>();

  CoursesModel(this.coursesJson);

  Results get results => coursesJson['result'] == null ? null : Results(json: coursesJson['result']);

  String get status => coursesJson['status'];
}

class Results
{
  Results({
    this.json,
  });

  final Map json;

  List<CourseDetails> get courses => json['data'] == null ? null : (json['data'] as List).map((e) => CourseDetails(json: e)).toList();
}

class CourseDetails
{
  CourseDetails({
    this.json,
  });

  final Map json;

  String get title => json['title'];

  String get description => json['description'];

  String get image => json['image'];
}