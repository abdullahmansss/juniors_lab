import 'package:conditional_builder/conditional_builder.dart';
import 'package:courses/models/courses_model.dart';
import 'package:courses/modules/courses/cubit/cubit.dart';
import 'package:courses/modules/courses/cubit/states.dart';
import 'package:courses/shared/components/components.dart';
import 'package:courses/shared/di/di.dart';
import 'package:courses/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => di<CoursesCubit>()..getCourses(),
      child: BlocConsumer<CoursesCubit, CoursesStates>(
        listener: (context, state)
        {
          if(state is CoursesStateSuccess)
          {
            print('----- status => ${CoursesModel.get.status}');
          }

          if(state is CoursesStateError)
          {
            print('----- status => ${CoursesModel.get.status}');
          }
        },
        builder: (context, state)
        {
          return ConditionalBuilder(
            condition: state is! CoursesStateLoading,
            builder: (context) => ConditionalBuilder(
              condition: state is! CoursesStateError,
              builder: (context) => ConditionalBuilder(
                condition: CoursesModel.get.results.courses.length != 0,
                builder: (context) => Column(
                  children: [
                    // SizedBox(
                    //   height: 15.0,
                    // ),
                    // Container(
                    //   height: 100.0,
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: 20.0,
                    //   ),
                    //   child: ListView.separated(
                    //     physics: BouncingScrollPhysics(),
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, index) =>
                    //         buildSearchItem(cat[index], context),
                    //     separatorBuilder: (context, index) => SizedBox(
                    //       width: 10.0,
                    //     ),
                    //     itemCount: cat.length,
                    //   ),
                    // ),
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(
                          top: 20.0,
                        ),
                        itemBuilder: (context, index) => buildCourseItem(CoursesModel.get.results.courses[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.0,
                        ),
                        itemCount: CoursesModel.get.results.courses.length,
                      ),
                    ),
                  ],
                ),
                fallback: (context) => Center(
                  child: Text(
                    'No Courses Yet',
                    style: black20Bold(),
                  ),
                ),
              ),
              fallback: (context) => Center(
                child: Text(
                  'Error',
                  style: black20Bold(),
                ),
              ),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
