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
    final userLoginController =
        TextEditingController(text: 'Halipov@gmail.com');
    // final userLoginController = TextEditingController(text: 'admin');
    final passwordController = TextEditingController(text: 'testing');

    return Scaffold(
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
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return LoginButonColor(
                  text: state is AuthLoadingState ? 'Signing' : 'Sign in ',
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
                );
              },
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return LoginButonColor(
                  text: state is GuestAuthLoadingState
                      ? 'Signing'
                      : 'Sign in via Guest',
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(
                      const LogInViaGuestEvent(),
                    );
                  },
                );
              },
            ),
            TextSignUp()
          ],
        ),
      ),
    );
  }
}
