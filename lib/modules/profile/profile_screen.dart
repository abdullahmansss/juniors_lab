import 'package:courses/shared/colors/colors_common.dart';
import 'package:courses/shared/components/components.dart';
import 'package:courses/shared/styles/style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            radius: 45.0,
            backgroundImage: NetworkImage(
                'https://avatars1.githubusercontent.com/u/34492145?s=460&u=3874317b78e6f8269ed80b9f2f7342942c5121ee&v=4'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Abdullah Mansour Ali',
                style: black18Bold(),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  size: 18.0,
                  color: defaultColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Text(
            'abdullah@gmail.com',
            style: black16(),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                buildProfileItem(
                  function: () {},
                  title: 'My Courses',
                  shape: Text(
                    '5',
                    style: black20Bold(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                buildProfileItem(
                  function: () {},
                  title: 'My Favourites',
                  shape: Icon(
                    Icons.favorite_border,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                buildProfileItem(
                  function: () {},
                  title: 'My Cart',
                  shape: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                buildProfileItem(
                  function: () {},
                  title: 'My Reviews',
                  shape: Icon(
                    Icons.star_half,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                buildProfileItem(
                  function: () {},
                  title: 'Invite a friend',
                  shape: Icon(
                    Icons.share,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                buildProfileItem(
                  function: () {},
                  title: 'Help & Support',
                  shape: Icon(
                    Icons.help_outline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
