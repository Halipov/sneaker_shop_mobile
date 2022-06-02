import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/constants/size_config.dart';

import '../../../constants/constants.dart';
import '../../auth/bloc/auth_bloc.dart';

class GuestContainer extends StatelessWidget {
  const GuestContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth / 20.55,
        SizeConfig.screenHeight / 40.59,
        SizeConfig.screenWidth / 20.55,
        SizeConfig.screenHeight / 90.54,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'You need to sign in',
              style: TextStyle(
                fontSize: 22,
                color: kTextColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 0.1,
                    color: kSecondaryColor,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Open sign in page',
                    style: TextStyle(
                      fontSize: 15,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
