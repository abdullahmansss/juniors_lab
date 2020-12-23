import 'package:courses/layout/cubit/cubit.dart';
import 'package:courses/layout/home.dart';
import 'package:courses/modules/login/cubit/cubit.dart';
import 'package:courses/modules/login/cubit/states.dart';
import 'package:courses/modules/register/register_screen.dart';
import 'package:courses/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget
{
  String email;
  String password;

  LoginScreen({this.email, this.password});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    if(email != null && password != null)
    {
      emailController.text = email;
      passwordController.text = password;
    }

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state)
        {
          if (state is LoginStateLoading)
          {
            buildProgress(
              context: context,
              text: 'please wait ..',
            );
          }

          if(state is LoginStateSuccess)
          {
            Navigator.pop(context);

            saveToken(state.token).then((value)
            {
              if(value)
              {
                //showToast(text: 'success save token', error: false,);
                HomeCubit.get(context).changeIndex(0);
                navigateAndFinish(context, HomeScreen());
              }
              else
                showToast(text: 'error while saving a token', error: false,);
            });
          }

          if(state is LoginStateError)
          {
            Navigator.pop(context);

            buildProgress(
              context: context,
              text: 'you don\'t have an account',
              error: true,
            );
          }
        },
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Login',
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
                      hint: 'enter password',
                      isPassword: true,
                      title: 'Password',
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    defaultButton(
                      function: ()
                      {
                        String email = emailController.text;
                        String password = passwordController.text;

                        if(email.isEmpty || password.isEmpty)
                        {
                          showToast(
                            text: 'please enter a valid data',
                            error: true,
                          );

                          return;
                        }

                        LoginCubit.get(context).login(
                          email: email,
                          password: password,
                        );
                      },
                      text: 'login',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defaultButton(
                      function: ()
                      {
                        navigateTo(context, RegisterScreen());
                      },
                      text: 'register',
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    InkWell(
                      onTap: ()
                      {
                        print('forgot password');
                      },
                      child: captionText('Forgot Password?'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}