import 'package:flutter/material.dart';

import '../../../../constants/size_config.dart';
import 'text_title.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Container(
          height: SizeConfig.screenHeight / 2.732,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/main/background_image.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: SizeConfig.screenWidth / 2.74,
                  height: SizeConfig.screenHeight / 7.762,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/main/logo.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight / 68.3,
                  ),
                  child: TextTitle(title: 'Welcome Back'),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
