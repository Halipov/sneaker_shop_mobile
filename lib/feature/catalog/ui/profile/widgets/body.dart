import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/bloc/auth_bloc.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: 'My Account',
            icon: 'assets/icons/User Icon.svg',
            press: () => {},
          ),
          ProfileMenu(
            text: 'Settings',
            icon: 'assets/icons/Settings.svg',
            press: () {},
          ),
          ProfileMenu(
            text: 'Log Out',
            icon: 'assets/icons/Log out.svg',
            press: () {
              BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
            },
          ),
        ],
      ),
    );
  }
}
