import 'package:courses/modules/test/test_screen.dart';
import 'package:courses/shared/colors/colors_common.dart';
import 'package:courses/shared/network/remote/dio_helper.dart';
import 'package:courses/shared/styles/style.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryModel {
  String title;
  IconData iconData;

  CategoryModel(this.title, this.iconData);
}

List<CategoryModel> cat = [
  CategoryModel(
    'Mobile App',
    Icons.lightbulb_outline,
  ),
  CategoryModel(
    'UI & UX',
    Icons.lightbulb_outline,
  ),
  CategoryModel(
    'Front End',
    Icons.lightbulb_outline,
  ),
  CategoryModel(
    'Back End',
    Icons.lightbulb_outline,
  ),
  CategoryModel(
    'ML',
    Icons.lightbulb_outline,
  ),
  CategoryModel(
    'AI',
    Icons.lightbulb_outline,
  ),
  CategoryModel(
    'IOT',
    Icons.lightbulb_outline,
  ),
];

void initApp()
{
  DioHelper();
}

Widget defaultButton({
  Color background = defaultColor,
  double radius = 5.0,
  @required Function function,
  @required String text,
  bool toUpper = true,
}) =>
    Container(
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: FlatButton(
        onPressed: function,
        child: Text(
          toUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget buildSettingItem({@required title,@required function}) => Column(
  children: [
    SizedBox(
      height: 1.0,
    ),
        ListTile(
      tileColor: Colors.white,
      onTap: function,
      title: Text(
        title.toString(),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14.0,
      ),
    ),
  ],
);

Widget buildProfileItem({@required title, @required Widget shape,@required function}) => Expanded(
  child: GestureDetector(
    onTap: function,
    child: Container(
      height: 140.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30.0,
            child: shape,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            title.toString(),
            style: black16Bold(),
          ),
        ],
      ),
    ),
  ),
);

Widget defaultTextForm({
  String title,
  String hint = '',
  bool isPassword = false,
  @required TextEditingController controller,
  @required TextInputType type,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsetsDirectional.only(
        start: 10.0,
        end: 10.0,
        top: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) detailsText(title),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
            keyboardType: type,
          ),
        ],
      ),
    );

Widget buildCourseItem(course) => Padding(
  padding: EdgeInsets.symmetric(horizontal: 20.0,),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0,),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 10,
        ),
      ],
    ),
    padding: EdgeInsets.symmetric(vertical: 5.0,),
    child: ExpansionTileCard(
      baseColor: Colors.white,
      expandedColor: Colors.white,
      elevation: 0.0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0,),
              color: defaultColor,
              image: DecorationImage(image: NetworkImage(course['image'],)),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${course['title']}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: black16Bold(),
                      ),
                    ),
                    // RatingBar.builder(
                    //   initialRating: 4.5,
                    //   minRating: 1,
                    //   direction: Axis.horizontal,
                    //   allowHalfRating: true,
                    //   itemCount: 5,
                    //   itemSize: 10.0,
                    //   ignoreGestures: true,
                    //   itemPadding: EdgeInsets.zero,
                    //   itemBuilder: (context, _) => Icon(
                    //     Icons.star,
                    //     color: Colors.amber,
                    //   ),
                    //   onRatingUpdate: (rating)
                    //   {
                    //     print(rating);
                    //   },
                    // ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${course['description']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: grey14(),
                ),
              ],
            ),
          ),
        ],
      ),
      onExpansionChanged: (value)
      {

      },
      children: <Widget>[
        Text('test'),
      ],
    ),
  ),
);

Widget buildSearchItem(CategoryModel model, context) => GestureDetector(
  onTap: () {
    navigateTo(context, TestScreen());
  },
  child: Container(
    height: 100.0,
    width: 100.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        15.0,
      ),
      color: Colors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 15.0,
          child: Icon(
            model.iconData,
            size: 16.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          model.title,
          style: black14Bold(),
        ),
      ],
    ),
  ),
);

Widget logo() => Column(
      children: [
        Image(
          image: AssetImage('assets/images/main_logo.png'),
        ),
        SizedBox(
          height: 80.0,
        ),
      ],
    );

Widget headText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 25.0,
      ),
    );

Widget captionText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );

Widget detailsText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

void buildProgress({
  context,
  text,
  bool error = false,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (!error) CircularProgressIndicator(),
                if (!error)
                  SizedBox(
                    width: 20.0,
                  ),
                Expanded(
                  child: Text(
                    text,
                  ),
                ),
              ],
            ),
            if (error)
            SizedBox(
              height: 20.0,
            ),
            if (error)
            defaultButton(
              function: ()
              {
                Navigator.pop(context);
              },
              text: 'cancel',
            )
          ],
        ),
      ),
    );

void showToast({@required text, @required error,}) => Fluttertoast.showToast(
    msg: text.toString(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: error ? Colors.red : Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
);