import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/size_config.dart';

class TextSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth / 20.55,
        0,
        SizeConfig.screenWidth / 20.55,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account? ',
            style: TextStyle(
              color: kSecondaryColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Sign in',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.screenHeight / 45.54,
              ),
            ),
          )
        ],
      ),
    );
  }
}
