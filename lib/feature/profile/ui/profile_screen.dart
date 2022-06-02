import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/size_config.dart';

import '../../../constants/products_consants.dart';
import '../../auth/bloc/auth_bloc.dart';
import 'past_orders_screen.dart';
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
            !HardCodeConstants().isGuest
                ? Column(
                    children: [
                      HardCodeConstants().isAdmin
                          ? Container()
                          : UserSection(
                              iconName: Icons.account_circle,
                              sectionText: 'My information',
                              onTap: () => showDialog(
                                useSafeArea: false,
                                context: context,
                                builder: (_) => const UserProfileScreen(),
                              ).whenComplete(() => setState(() {})),
                            ),
                      HardCodeConstants().isAdmin
                          ? Container()
                          : UserSection(
                              iconName: Icons.shopping_basket,
                              sectionText: 'Past orders',
                              onTap: () => showDialog(
                                useSafeArea: false,
                                context: context,
                                builder: (_) => const PastOrdersScreen(),
                              ),
                            ),
                    ],
                  )
                : Container(),
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
