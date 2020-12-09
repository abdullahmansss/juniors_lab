import 'package:courses/layout/home.dart';
import 'package:courses/modules/register/cubit/cubit.dart';
import 'package:courses/modules/register/cubit/states.dart';
import 'package:courses/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget
{
  var firstController = TextEditingController();
  var lastController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state)
      {
        if(state is CounterStateLoading)
        {
          buildProgress(
            context: context,
            text: 'please wait ...',
          );
        }

        if(state is CounterStateSuccess)
        {
          navigateAndFinish(
            context,
            HomeScreen(),
          );
        }
      },
      builder: (context, state)
      {
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
                children:
                [
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
                    function: ()
                    {
                      CounterCubit.get(context).register(
                        first: firstController.text,
                        last: lastController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        city: cityController.text,
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