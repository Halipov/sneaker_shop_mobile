import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../model/user.dart';
import 'widgets/forgot_password.dart';
import 'widgets/login_button.dart';
import 'widgets/logo.dart';
import 'widgets/text_field.dart';
import 'widgets/text_signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userLoginController = TextEditingController(text: 'Test@test4');
    final passwordController = TextEditingController(text: 'testing');
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LogoImage(),
              LoginTextField(
                userLoginController: userLoginController,
                passwordController: passwordController,
              ),
              const ForgotPassword(),
              LoginButonColor(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    LogInEvent(
                      user: User(
                        userName: userLoginController.text,
                        password: passwordController.text,
                      ),
                    ),
                  );
                },
              ),
              TextSignUp()
            ],
          ),
        ),
      ),
    );
  }
}
