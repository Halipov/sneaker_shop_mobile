import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/default_button.dart';
import '../../../common/page_name.dart';
import '../../../common/ui/widgets/custom_textfield.dart';
import '../../auth/model/user_info.dart';
import '../../auth/service/user_service.dart';
import '../bloc/profile_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = UserService().user.userInfo;
    final firstNameController = TextEditingController(text: userInfo.firstName);
    final lastNameController = TextEditingController(text: userInfo.lastName);
    final addressController = TextEditingController(text: userInfo.address);
    final phoneController = TextEditingController(text: userInfo.phone);
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoadedState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User info'),
        ),
        body: Stack(
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                    right: 10.0,
                    left: 10.0,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        return DefaultButton(
                          text:
                              state is ProfileLoadingState ? 'Saving' : 'Save',
                          press: () {
                            BlocProvider.of<ProfileBloc>(context).add(
                              ProfileSaveEvent(
                                userInfo: UserInfo(
                                  id: userInfo.id,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  phone: phoneController.text,
                                  address: addressController.text,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageName(textName: 'First Name'),
                  CustomTextField(
                    enterText: 'Enter your first name',
                    sizeWidth: 1.18,
                    controller: firstNameController,
                  ),
                  PageName(textName: 'Last Name'),
                  CustomTextField(
                    enterText: 'Enter your last name',
                    sizeWidth: 1.18,
                    controller: lastNameController,
                  ),
                  PageName(textName: 'Phone'),
                  CustomTextField(
                    enterText: 'Enter your phone number',
                    sizeWidth: 1.18,
                    controller: phoneController,
                  ),
                  PageName(textName: 'Address'),
                  CustomTextField(
                    enterText: 'Type your home address',
                    sizeWidth: 1.18,
                    controller: addressController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
