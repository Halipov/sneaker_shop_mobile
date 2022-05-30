import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/size_config.dart';

import '../../auth/bloc/auth_bloc.dart';
import 'user_profile_screen.dart';
import 'widgets/top_custom_shape.dart';
import 'widgets/user_sections.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopCustomShape(),
            SizedBox(
              height: SizeConfig.screenHeight / 34.15,
            ),
            UserSection(
              iconName: Icons.account_circle,
              sectionText: 'My information',
              onTap: () => showDialog(
                useSafeArea: false,
                context: context,
                builder: (_) => const UserProfileScreen(),
              ).whenComplete(() => setState(() {})),
            ),
            UserSection(
              iconName: Icons.shopping_basket,
              sectionText: 'Past orders',
            ),
            UserSection(
              iconName: Icons.logout,
              sectionText: 'Log Out',
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
