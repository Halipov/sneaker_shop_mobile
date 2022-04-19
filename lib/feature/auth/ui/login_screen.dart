import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../model/user.dart';
import 'widgets/custom_button_widget.dart';
import 'widgets/login_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userLoginController = TextEditingController(text: 'Test@test4');
    final passwordController = TextEditingController(text: 'testing');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Align(
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/background.png'),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 24,
                    left: 24,
                    top: 75,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 80.0,
                      ),
                      const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      CustomTextField(
                        prefix: 'Email',
                        title: 'Email Address',
                        textController: userLoginController,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      CustomTextField(
                        prefix: 'Password',
                        title: 'Password',
                        textController: passwordController,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),

                      const SizedBox(
                        height: 30.0,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return CustomButton(
                            backgroundColor: state is AuthLoadingState
                                ? const Color.fromRGBO(255, 255, 255, 0.9)
                                : Colors.white,
                            textColor: Colors.white,
                            fontSize: 15,
                            text: 'Sign In',
                            borderRadius: 12,
                            width: MediaQuery.of(context).size.width,
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                LoginInEvent(
                                  user: User(
                                    userName: userLoginController.text,
                                    password: passwordController.text,
                                  ),
                                  rememberMe: true,
                                ),
                              );
                            },
                            isLoading: state is AuthLoadingState,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 150.0,
                      ),
                      // signInViaGoogleButton(context),

                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthFailureState) {
                            return Text(
                              state.errorMessage,
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
