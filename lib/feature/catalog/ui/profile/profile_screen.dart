import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_shop/feature/catalog/ui/profile/widgets/body.dart';

import '../../../auth/service/user_service.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<UserService>().user.username),
      ),
      body: Body(),
    );
  }
}
