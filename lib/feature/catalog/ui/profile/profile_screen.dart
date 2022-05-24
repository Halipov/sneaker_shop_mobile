import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/size_config.dart';
import '../../../auth/bloc/auth_bloc.dart';
import 'widgets/top_custom_shape.dart';
import 'widgets/user_sections.dart';

class ProfileScreen extends StatelessWidget {
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
            ),
            UserSection(
              iconName: Icons.shopping_basket,
              sectionText: 'Past orders',
            ),
            UserSection(
              iconName: Icons.location_city,
              sectionText: 'Address information',
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
