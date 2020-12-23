import 'package:courses/shared/components/components.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        SizedBox(
          height: 15.0,
        ),
        Container(
          height: 100.0,
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => buildSearchItem(cat[index], context),
            separatorBuilder: (context, index) => SizedBox(
              width: 10.0,
            ),
            itemCount: cat.length,
          ),
        ),
        Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 20.0,),
            itemBuilder: (context, index) => buildCourseItem(),
            separatorBuilder: (context, index) => SizedBox(
              height: 20.0,
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}