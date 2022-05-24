import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/size_config.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.screenWidth / 15.3),

      /// 27.0
      child: Container(
        alignment: Alignment.centerRight,
        child: const Text(
          'Forgot Password?',
          style: TextStyle(color: kSecondaryColor),
        ),
      ),
    );
  }
}
