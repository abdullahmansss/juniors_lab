import 'package:conditional_builder/conditional_builder.dart';
import 'package:courses/modules/courses/cubit/cubit.dart';
import 'package:courses/modules/courses/cubit/states.dart';
import 'package:courses/shared/colors/colors_common.dart';
import 'package:courses/shared/components/components.dart';
import 'package:courses/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesScreen extends StatefulWidget
{
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen>
{
  ScrollController controller = ScrollController();
  BuildContext blocContext;

  @override
  void initState()
  {
    super.initState();

    controller.addListener(()
    {
      if (controller.offset >= controller.position.maxScrollExtent &&
          !controller.position.outOfRange)
      {
        print('bottom bottom');

        if(CoursesCubit.get(blocContext).currentPage <= CoursesCubit.get(blocContext).totalPages)
          CoursesCubit.get(blocContext).getMoreCourses();
      }
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<CoursesCubit, CoursesStates>(
      listener: (context, state)
      {

      },
      builder: (context, state)
      {
        blocContext = context;
        var courses = CoursesCubit.get(context).courses;

        return ConditionalBuilder(
          condition: state is! CoursesStateLoading,
          builder: (context) => ConditionalBuilder(
            condition: state is! CoursesStateError,
            builder: (context) => ConditionalBuilder(
              condition: courses.length != 0,
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
                      controller: controller,
                      padding: EdgeInsets.only(
                        top: 20.0,
                        bottom: 20.0,
                      ),
                      itemBuilder: (context, index) => buildCourseItem(courses[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.0,
                      ),
                      itemCount: courses.length,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children:
                    [
                      Container(),
                      // loading more button

                      // if(state is! CoursesStateLoadingMore && CoursesCubit.get(context).currentPage <= CoursesCubit.get(context).totalPages)
                      //   MaterialButton(
                      //   height: 40.0,
                      //   color: defaultColor,
                      //   onPressed: ()
                      //   {
                      //     if(CoursesCubit.get(context).currentPage <= CoursesCubit.get(context).totalPages)
                      //       CoursesCubit.get(context).getMoreCourses();
                      //   },
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       Text(
                      //         'Load More',
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10.0,
                      //       ),
                      //       Icon(
                      //         Icons.arrow_downward,
                      //         size: 16.0,
                      //         color: Colors.white,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      if(state is CoursesStateLoadingMore)
                        CircularProgressIndicator(),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
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
    );
  }
}
