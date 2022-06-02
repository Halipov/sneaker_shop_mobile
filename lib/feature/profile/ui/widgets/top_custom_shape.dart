import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../constants/size_config.dart';
import '../../../../constants/products_consants.dart';
import '../../../auth/service/user_service.dart';
import 'custom_shape.dart';

class TopCustomShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = UserService().user.userInfo;
    String initText;
    if (HardCodeConstants().isGuest) {
      initText = 'Guest';
    } else if (HardCodeConstants().isAdmin) {
      initText = 'Admin';
    } else {
      initText = '${userInfo.lastName} ${userInfo.firstName}';
    }
    return SizedBox(
      height: SizeConfig.screenHeight / 2.84,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: SizeConfig.screenHeight / 4.56,
              color: Colors.orange,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: SizeConfig.screenHeight / 4.88,
                  width: SizeConfig.screenWidth / 2.93,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: SizeConfig.screenWidth / 51.37,
                    ),
                    color: Colors.white,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Profile Image.png'),
                    ),
                  ),
                ),
                Text(
                  initText,
                  style: const TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight / 136.6,
                ),
                Text(
                  userInfo.phone,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
