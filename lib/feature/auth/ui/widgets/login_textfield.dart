import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String prefix;
  final bool isPassword;
  final TextEditingController textController;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.prefix,
    required this.textController,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isSelected = false;
  bool isEmpty = true;
  bool isVisible = false;
  @override
  void initState() {
    isEmpty = widget.textController.text.isNotEmpty ? false : true;
    isSelected = false;
    super.initState();
  }

  void onFocuse() {
    setState(() {
      isSelected = true;
    });
  }

  void onFocuseDismissed() {
    setState(() {
      isEmpty = widget.textController.text.isNotEmpty ? false : true;
      isSelected = false;
    });
  }

  void showPassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(63, 169, 250, 1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? const Color.fromRGBO(255, 255, 255, 0.5)
              : const Color.fromRGBO(63, 169, 250, 1),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Focus(
        onFocusChange: (focus) {
          focus ? onFocuse() : onFocuseDismissed();
        },
        child: Row(
          children: [
            //AnimatedText
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSelected || !isEmpty ? 60 : 0,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.prefix,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            //TextField
            Expanded(
              child: TextField(
                controller: widget.textController,
                obscureText: widget.isPassword ? !isVisible : false,
                decoration: InputDecoration(
                  suffixIcon: widget.isPassword
                      ? InkWell(
                          onTap: showPassword,
                          child: Icon(
                            !isVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                        )
                      : null,
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintText: isSelected ? '' : widget.title,
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                  ),
                ),
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
