import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/pages_widget.dart/forms/register_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
      body: const RegisterWidget(),
    ));
  }
}
