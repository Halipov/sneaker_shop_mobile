import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';
import '../../model/new_user.dart';
import '../../model/user_info.dart';
import 'widgets/background_image.dart';
import 'widgets/register_button.dart';
import 'widgets/text_field.dart';
import 'widgets/text_signin.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  _RegisterPageViewState createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final addressController = TextEditingController();
    final phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackgroundImage(),
            RegisterTextField(
              usernameController: usernameController,
              emailController: emailController,
              passwordController: passwordController,
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              addressController: addressController,
              phoneController: phoneController,
            ),
            RegisterButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(
                  SignUpEvent(
                    user: NewUser(
                      userName: usernameController.text,
                      password: passwordController.text,
                      userInfo: UserInfo(
                        id: 0,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        phone: phoneController.text,
                        address: addressController.text,
                      ),
                    ),
                  ),
                );
              },
            ),
            TextSignIn()
          ],
        ),
      ),
    );
  }
}
