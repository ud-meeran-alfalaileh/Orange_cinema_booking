import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/pages_widget.dart/forms/edit_profile_widget.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
        body: const EditProfileWidget(),
      ),
    );
  }
}
