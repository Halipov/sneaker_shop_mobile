import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/size_config.dart';

class TextFieldInput extends StatelessWidget {
  final String text;
  final IconData iconName;
  final String ltext;
  final TextEditingController controller;
  TextFieldInput({
    required this.text,
    required this.iconName,
    required this.ltext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth / 20.55,
          SizeConfig.screenHeight / 68.3,
          SizeConfig.screenWidth / 20.55,
          SizeConfig.screenHeight / 34.15,
        ),
        child: TextField(
          style: const TextStyle(color: kPrimaryColor),
          cursorColor: kPrimaryColor,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(iconName),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              borderSide: BorderSide(
                width: SizeConfig.screenWidth / 205.5,
                color: kPrimaryColor,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(width: 1, color: kTextColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: text,
            hintStyle: TextStyle(
              color: kTextColor.withOpacity(0.3),
            ),
            labelText: ltext,
            labelStyle: TextStyle(
              color: kTextColor.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
