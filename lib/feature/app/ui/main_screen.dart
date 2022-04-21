import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';
import '../../../enums/app_mode.dart';
import '../../catalog/ui/cart_screen.dart';
import '../../catalog/ui/catalog_screen.dart';
import '../../catalog/ui/favorite_screen.dart';
import '../../catalog/ui/profile/profile_screen.dart';
import '../bloc/main_app_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const inActiveIconColor = Color(0xFFB6B6B6);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: BlocBuilder<MainAppBloc, MainAppState>(
        builder: (context, state) {
          switch (state.appMode) {
            case AppMode.catalog:
              return const CatalogScreen();
            case AppMode.favorite:
              return const FavoriteScreen();
            case AppMode.cart:
              return const CartScreen();
            case AppMode.profile:
              return ProfileScreen();
            default:
              return const CatalogScreen();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<MainAppBloc, MainAppState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.appMode.index,
            showUnselectedLabels: true,
            onTap: (index) => BlocProvider.of<MainAppBloc>(context).add(
              MainAppPageTapped(
                AppMode.values[index],
              ),
            ),
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: inActiveIconColor,
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
                label: 'Catalog',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/Heart Icon.svg',
                  color: inActiveIconColor,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/Heart Icon.svg',
                  color: kPrimaryColor,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/Cart Icon.svg',
                  color: inActiveIconColor,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/Cart Icon.svg',
                  color: kPrimaryColor,
                ),
                label: 'Cart',
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
