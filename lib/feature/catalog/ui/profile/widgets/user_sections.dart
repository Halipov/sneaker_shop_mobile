import 'package:flutter/material.dart';
import '../../../../../constants/size_config.dart';

class UserSection extends StatelessWidget {
  final IconData iconName;
  final String sectionText;
  final VoidCallback? onTap;
  UserSection({required this.iconName, required this.sectionText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth / 13.7,
        0,
        SizeConfig.screenWidth / 27.4,
        SizeConfig.screenHeight / 34.15,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              iconName,
              color: Colors.black54,
            ),
            SizedBox(
              width: SizeConfig.screenWidth / 41.1,
            ),
            Text(
              sectionText,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: SizeConfig.screenHeight / 42.68),
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black45,
              size: SizeConfig.screenHeight / 21.34,
            )
          ],
        ),
      ),
    );
  }
}
