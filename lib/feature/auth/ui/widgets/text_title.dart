import 'package:flutter/material.dart';

import '../../../../constants/size_config.dart';

class TextTitle extends StatelessWidget {
  final String title;
  TextTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeConfig.screenHeight / 22.77,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
