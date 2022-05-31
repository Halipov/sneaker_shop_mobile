import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'constants/theme.dart';
import 'feature/admin/bloc/admin_bloc.dart';
import 'feature/admin/ui/admin_screen.dart';
import 'feature/app/bloc/main_app_bloc.dart';
import 'feature/app/ui/main_screen.dart';
import 'feature/auth/bloc/auth_bloc.dart';
import 'feature/auth/service/auth_service.dart';
import 'feature/auth/service/user_service.dart';
import 'feature/auth/ui/login_screen.dart';
import 'feature/cart/bloc/cart_bloc.dart';
import 'feature/catalog/bloc/catalog_bloc.dart';
import 'feature/catalog/service/product_service.dart';
import 'feature/favorite/bloc/favorite_bloc.dart';
import 'feature/orders/bloc/orders_bloc.dart';
import 'feature/orders/service/orders_service.dart';
import 'feature/profile/bloc/profile_bloc.dart';
import 'feature/profile/ui/bloc_observable.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  Stripe.publishableKey =
      'pk_test_51JfQ1ZH7g400lLF3CxUqGG1AOQFRx02BIk899JfYQj37KvCDDzvjXeCl48OBRuejPvjEValEzO6LNqsjwwIp9izq003hwQbDqW';
  BlocOverrides.runZoned(
    () {
      runApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => AuthService(dio: dio),
            ),
            RepositoryProvider(
              create: (context) => UserService(),
            ),
            RepositoryProvider(
              create: (context) => ProductService(dio),
            ),
            RepositoryProvider(
              create: (context) => OrdersService(dio),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(
                  context.read<AuthService>(),
                  context.read<UserService>(),
                ),
              ),
              BlocProvider<ProfileBloc>(
                create: (context) => ProfileBloc(
                  context.read<AuthService>(),
                ),
              ),
              BlocProvider<MainAppBloc>(
                create: (context) => MainAppBloc(),
              ),
              BlocProvider<AdminBloc>(
                create: (context) => AdminBloc(
                  context.read<ProductService>(),
                ),
              ),
              BlocProvider<CatalogBloc>(
                create: (context) => CatalogBloc(
                  context.read<ProductService>(),
                ),
              ),
              BlocProvider<OrdersBloc>(
                create: (context) => OrdersBloc(
                  context.read<OrdersService>(),
                ),
              ),
              BlocProvider<CartBloc>(
                create: (context) => CartBloc(
                  context.read<ProductService>(),
                ),
              ),
              BlocProvider<FavoriteBloc>(
                create: (context) => FavoriteBloc(
                  context.read<ProductService>(),
                ),
              )
            ],
            child: const MyApp(),
          ),
        ),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike Sneaker Shop',
      theme: theme(),
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return const MainScreen();
          } else if (state is AuthAdminAuthenticated) {
            return const AdminScreen();
          } else if (state is AuthNotAuthenticated) {
            return const LoginScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
