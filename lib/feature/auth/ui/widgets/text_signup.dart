import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/size_config.dart';
import '../register_page/register_page_view.dart';

class TextSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth / 20.55,
        SizeConfig.screenHeight / 136.6,
        SizeConfig.screenWidth / 20.55,
        0,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(
                color: kSecondaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPageView(),
                  ),
                );
              },
              child: Text(
                ' Sign up',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.screenHeight / 45.54

                    /// 15
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
