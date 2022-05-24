import 'package:flutter/material.dart';

import 'text_field_widget/text_field_input.dart';
import 'text_field_widget/text_field_password.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController userLoginController;
  final TextEditingController passwordController;
  const LoginTextField({
    Key? key,
    required this.userLoginController,
    required this.passwordController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFieldInput(
          text: 'email',
          iconName: Icons.mail,
          ltext: 'Email',
          controller: userLoginController,
        ),
        TextFieldPassword(
          controller: passwordController,
        ),
      ],
    );
  }
}
