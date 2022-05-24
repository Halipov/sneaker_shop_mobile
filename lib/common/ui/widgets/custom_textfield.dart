import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constants/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String enterText;
  final double sizeWidth;
  CustomTextField({
    Key? key,
    required this.enterText,
    required this.sizeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth / 41.1,

          /// 10.0
          0,
          SizeConfig.screenWidth / 82.2,

          /// 5.0
          SizeConfig.screenHeight / 85.37

          /// 8.0
          ),
      child: Container(
        width: SizeConfig.screenWidth / sizeWidth,
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
