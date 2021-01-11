import 'dart:ui';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:courses/modules/search/cubit/cubit.dart';
import 'package:courses/modules/search/cubit/states.dart';
import 'package:courses/shared/colors/colors_common.dart';
import 'package:courses/shared/components/components.dart';
import 'package:courses/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var courses = SearchCubit.get(context).courses;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsetsDirectional.only(
                    start: 20.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search ...',
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        width: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                          color: defaultColor,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(
                          height: 50.0,
                          onPressed: ()
                          {
                            SearchCubit.get(context).getSearch(searchController.text);
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 100.0,
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 20.0,
              //   ),
              //   child: ListView.separated(
              //     physics: BouncingScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) => buildSearchItem(cat[index], context),
              //     separatorBuilder: (context, index) => SizedBox(
              //       width: 10.0,
              //     ),
              //     itemCount: cat.length,
              //   ),
              // ),
              Expanded(
                child: ConditionalBuilder(
                  condition: state is! SearchStateLoading,
                  builder: (context) => ConditionalBuilder(
                    condition: courses.length > 0,
                    builder: (context) => ListView.separated(
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
                    fallback: (context) => Center(
                      child: Text(
                        'No Courses Found',
                        style: grey16Bold(),
                      ),
                    ),
                  ),
                  fallback: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
