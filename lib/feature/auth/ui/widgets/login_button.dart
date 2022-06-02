import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/size_config.dart';
import '../../bloc/auth_bloc.dart';

class LoginButonColor extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  LoginButonColor({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth / 20.55,
            SizeConfig.screenHeight / 40.59,
            SizeConfig.screenWidth / 20.55,
            SizeConfig.screenHeight / 90.54,
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
                        Colors.orange,
                        Colors.orangeAccent,
                      ]
                    : [
                        Colors.orange,
                        Colors.orangeAccent,
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
              child: Text(
                text,
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
