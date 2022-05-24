import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/size_config.dart';

class TextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  const TextFieldPassword({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool passwordObscure = true;

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
          obscureText: passwordObscure,
          style: const TextStyle(color: kPrimaryColor),
          cursorColor: kPrimaryColor,
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordObscure = !passwordObscure;
                });
              },
              icon: Icon(
                  passwordObscure ? Icons.visibility_off : Icons.visibility),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                width: SizeConfig.screenWidth / 205.5,
                color: kSecondaryColor,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 1, color: kSecondaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'password',
            hintStyle: TextStyle(
              color: kSecondaryColor.withOpacity(0.3),
            ),
            labelText: 'Password',
            labelStyle: TextStyle(
              color: kSecondaryColor.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
