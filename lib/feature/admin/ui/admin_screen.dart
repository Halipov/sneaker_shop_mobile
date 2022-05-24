import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/constants.dart';
import '../../../enums/app_mode.dart';
import '../../app/bloc/main_app_bloc.dart';
import '../../catalog/ui/profile/profile_screen.dart';
import 'logout_screen.dart';
import 'order_screen.dart';
import 'products_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const inActiveIconColor = Color(0xFFB6B6B6);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: false,
      body: BlocBuilder<MainAppBloc, MainAppState>(
        builder: (context, state) {
          switch (state.adminAppMode) {
            case AppMode.catalog:
              return const ProductsScreen();
            case AppMode.favorite:
              return const OrderScreen();
            case AppMode.cart:
              return ProfileScreen();
            default:
              return const ProductsScreen();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<MainAppBloc, MainAppState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.adminAppMode.index,
            showUnselectedLabels: true,
            onTap: (index) => BlocProvider.of<MainAppBloc>(context).add(
              AdminAppPageTapped(
                AppMode.values[index],
              ),
            ),
            selectedLabelStyle: const TextStyle(
              color: kPrimaryColor,
            ),
            unselectedLabelStyle: const TextStyle(
              color: inActiveIconColor,
            ),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/Shop Icon.svg',
                  color: inActiveIconColor,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/Shop Icon.svg',
                  color: kPrimaryColor,
                ),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/Chat bubble Icon.svg',
                  color: inActiveIconColor,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/Chat bubble Icon.svg',
                  color: kPrimaryColor,
                ),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/User Icon.svg',
                  color: inActiveIconColor,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/User Icon.svg',
                  color: kPrimaryColor,
                ),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
