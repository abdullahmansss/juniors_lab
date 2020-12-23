import 'package:courses/layout/cubit/cubit.dart';
import 'package:courses/layout/home.dart';
import 'package:courses/modules/login/login_screen.dart';
import 'package:courses/modules/register/cubit/cubit.dart';
import 'package:courses/modules/register/cubit/states.dart';
import 'package:courses/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  var firstController = TextEditingController();
  var lastController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterStateLoading)
        {
          buildProgress(
            context: context,
            text: 'please wait until creating an account ..',
          );
        }

        if (state is RegisterStateSuccess)
        {
          HomeCubit.get(context).changeIndex(0);

          navigateAndFinish(
            context,
            LoginScreen(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
        }

        if (state is RegisterStateError)
        {
          Navigator.pop(context);

          buildProgress(
            context: context,
            text: 'this email is already used',
            error: true,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Register',
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo(),
                  defaultTextForm(
                    controller: firstController,
                    type: TextInputType.name,
                    hint: 'enter first name',
                    title: 'First Name',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultTextForm(
                    controller: lastController,
                    type: TextInputType.name,
                    hint: 'enter last name',
                    title: 'Last Name',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultTextForm(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    hint: 'enter email',
                    title: 'Email',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultTextForm(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    isPassword: true,
                    hint: 'enter password',
                    title: 'Password',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultTextForm(
                    controller: cityController,
                    type: TextInputType.text,
                    hint: 'enter city',
                    title: 'City',
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultButton(
                    function: () {
                      String firstName = firstController.text;
                      String lastName = lastController.text;
                      String email = emailController.text;
                      String password = passwordController.text;
                      String city = cityController.text;

                      if (firstName.isEmpty ||
                          lastName.isEmpty ||
                          email.isEmpty ||
                          password.isEmpty ||
                          city.isEmpty)
                      {
                        showToast(
                          text: 'please enter a valid data',
                          error: true,
                        );

                        return;
                      }

                      RegisterCubit.get(context).register(
                        first: firstName,
                        last: lastName,
                        email: email,
                        password: password,
                        city: city,
                      );
                    },
                    text: 'register',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
