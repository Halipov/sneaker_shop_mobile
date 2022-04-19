import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final double? borderRadius;
  final String? text;
  final Function()? onPressed;
  final double? fontSize;
  final bool isLoading;

  const CustomButton({
    Key? key,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.height,
    this.width,
    this.borderRadius,
    this.text,
    this.onPressed,
    this.fontSize,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(textColor ?? Colors.white),
          minimumSize:
              MaterialStateProperty.all(Size(width ?? 100, height ?? 48)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? Colors.white),
        ),
        onPressed: onPressed,
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      color: Color(0xff1890FF),
                      strokeWidth: 2.0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Signing in',
                    style: TextStyle(
                      color: const Color(0xff1890FF),
                      fontSize: fontSize ?? 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'RobotoCondensed',
                    ),
                  ),
                ],
              )
            : Text(
                text ?? '',
                style: TextStyle(
                  color: const Color(0xff1890FF),
                  fontSize: fontSize ?? 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
      ),
    );
  }
}
