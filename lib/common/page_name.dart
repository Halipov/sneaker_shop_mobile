import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/size_config.dart';

class PageName extends StatelessWidget {
  final String textName;
  PageName({required this.textName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth / 27.4,
        SizeConfig.screenHeight / 341.5,
        SizeConfig.screenWidth / 20.55,
        SizeConfig.screenHeight / 200.3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textName,
            style: TextStyle(
              fontSize: SizeConfig.screenHeight / 40.18,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
