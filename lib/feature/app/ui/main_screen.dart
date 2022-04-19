import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../enums/app_mode.dart';
import '../../catalog/ui/catalog_screen.dart';
import '../bloc/main_app_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: BlocBuilder<MainAppBloc, MainAppState>(
        builder: (context, state) {
          switch (state.appMode) {
            case AppMode.catalog:
              return const CatalogScreen();
            case AppMode.favorite:
              return Container();
            case AppMode.cart:
              return Container();
            case AppMode.profile:
              return Container();
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
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                activeIcon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.blueAccent,
                ),
                label: 'Catalog',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                activeIcon: Icon(
                  Icons.favorite,
                  color: Colors.blueAccent,
                ),
                label: 'Favorite',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: Colors.blueAccent,
                ),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                activeIcon: Icon(
                  Icons.account_box,
                  color: Colors.blueAccent,
                ),
                label: 'Account',
              ),
            ],
          );
        },
      ),
    );
  }
}
