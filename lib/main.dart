import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observable.dart';
import 'constants/theme.dart';
import 'feature/admin/bloc/admin_bloc.dart';
import 'feature/admin/ui/admin_screen.dart';
import 'feature/app/bloc/main_app_bloc.dart';
import 'feature/app/ui/main_screen.dart';
import 'feature/auth/bloc/auth_bloc.dart';
import 'feature/auth/service/auth_service.dart';
import 'feature/auth/service/user_service.dart';
import 'feature/auth/ui/login_screen.dart';
import 'feature/catalog/bloc/catalog_bloc.dart';
import 'feature/catalog/service/product_service.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  Bloc.observer = AppBlocObserver();
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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              context.read<AuthService>(),
              context.read<UserService>(),
            ),
          ),
          BlocProvider<MainAppBloc>(
            create: (context) => MainAppBloc(),
          ),
          BlocProvider<AdminBloc>(
            create: (context) => AdminBloc(),
          ),
          BlocProvider<CatalogBloc>(
            create: (context) => CatalogBloc(
              context.read<ProductService>(),
            ),
          )
        ],
        child: const MyApp(),
      ),
    ),
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
