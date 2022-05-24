import 'package:flutter/material.dart';

import '../../widgets/text_field_widget/text_field_input.dart';
import '../../widgets/text_field_widget/text_field_password.dart';

class RegisterTextField extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController addressController;
  final TextEditingController phoneController;

  const RegisterTextField({
    Key? key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.addressController,
    required this.phoneController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFieldInput(
          controller: usernameController,
          text: 'username',
          iconName: Icons.account_circle,
          ltext: 'User Name',
        ),
        TextFieldInput(
          controller: emailController,
          text: 'email',
          iconName: Icons.mail,
          ltext: 'Email',
        ),
        TextFieldInput(
          controller: firstNameController,
          text: 'First Name',
          iconName: Icons.account_circle,
          ltext: 'First Name',
        ),
        TextFieldInput(
          controller: lastNameController,
          text: 'Last Name',
          iconName: Icons.account_circle,
          ltext: 'Last Name',
        ),
        TextFieldInput(
          controller: phoneController,
          text: 'Phone',
          iconName: Icons.phone,
          ltext: 'Phone',
        ),
        TextFieldInput(
          controller: addressController,
          text: 'Address',
          iconName: Icons.phone,
          ltext: 'Address',
        ),
        TextFieldPassword(
          controller: passwordController,
        ),
        // TextFieldPassword(),
      ],
    );
  }
}
