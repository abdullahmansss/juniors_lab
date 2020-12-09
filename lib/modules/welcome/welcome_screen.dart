import 'package:courses/modules/login/login_screen.dart';
import 'package:courses/modules/register/register_screen.dart';
import 'package:courses/shared/colors/colors_common.dart';
import 'package:courses/shared/components/components.dart';
import 'package:courses/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(),
            defaultButton(
              text: 'login',
              function: ()
              {
                navigateTo(context, LoginScreen());
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: defaultButton(
                text: 'register',
                function: ()
                {
                  navigateTo(context, RegisterScreen());

                  // DioHelper.postData(
                  //   path: 'lms/api/v1/auth/signup-save',
                  //   data:
                  //   {
                  //     'first_name':'Ahmed',
                  //     'last_name':'Mansour',
                  //     'email':'Ahmed@gmail.com',
                  //     'password':'123456789',
                  //     'city':'cairo',
                  //   },
                  // ).then((value)
                  // {
                  //   print(value.data);
                  // });
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            captionText('Or Login With'),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: defaultColor,
                  child: Image(
                    image: AssetImage('assets/images/facebook.png'),
                    height: 20.0,
                    width: 20.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: defaultColor,
                  child: Image(
                    image: AssetImage('assets/images/google.png'),
                    height: 20.0,
                    width: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}