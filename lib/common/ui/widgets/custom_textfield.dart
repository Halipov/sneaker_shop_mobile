import 'package:flutter/material.dart';

import '../../../constants/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String enterText;
  final TextEditingController controller;
  final double sizeWidth;
  CustomTextField({
    Key? key,
    required this.enterText,
    required this.controller,
    required this.sizeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth / 43.1,
        0,
        SizeConfig.screenWidth / 43.2,
        SizeConfig.screenHeight / 85.37,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: TextField(
          style: const TextStyle(
            color: Color(0xFFf2ac29),
          ),
          cursorColor: const Color(0xFFf2ac29),
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: enterText,
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
          ),
        ),
      ),
    );
  }
}
