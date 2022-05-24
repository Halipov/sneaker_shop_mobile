import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/size_config.dart';
import '../../../bloc/auth_bloc.dart';

class RegisterButton extends StatelessWidget {
  final void Function() onPressed;

  RegisterButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth / 20.55,
            SizeConfig.screenHeight / 17.075,
            SizeConfig.screenWidth / 20.55,
            SizeConfig.screenHeight / 45.54,
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 5.0,
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.0, 1.0],
                colors: state is AuthLoadingState
                    ? [
                        kPrimaryColor.withOpacity(0.7),
                        kSecondaryColor.withOpacity(0.7)
                      ]
                    : [
                        kPrimaryColor,
                        kSecondaryColor.withOpacity(0.5),
                      ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(
                    SizeConfig.screenWidth / 1.37,
                    SizeConfig.screenHeight / 13.66,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: onPressed,
              child: state is AuthLoadingState
                  ? Text(
                      'Registration',
                      style: TextStyle(
                        fontSize: SizeConfig.screenHeight / 42.68,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: SizeConfig.screenHeight / 42.68,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
