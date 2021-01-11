import 'package:courses/modules/phone/phone_screen.dart';
import 'package:courses/modules/welcome/welcome_screen.dart';
import 'package:courses/shared/components/components.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSettingItem(
          function: () {},
          title: 'Account Settings',
        ),
        buildSettingItem(
          function: ()
          {
            navigateTo(context, PhoneScreen(),);
          },
          title: 'Phone Authentication',
        ),
        buildSettingItem(
          function: () {},
          title: 'Push Notifications',
        ),
        buildSettingItem(
          function: () {},
          title: 'About Us',
        ),
        buildSettingItem(
          function: () {},
          title: 'FAQ',
        ),
        buildSettingItem(
          function: () {},
          title: 'Contact Us',
        ),
        buildSettingItem(
          function: ()
          {
            removeToken().then((value)
            {
              navigateAndFinish(context, WelcomeScreen());
            });
          },
          title: 'Logout',
        ),
      ],
    );
  }
}
