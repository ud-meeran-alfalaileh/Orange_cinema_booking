import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/pages_widget/intro_widget.dart';
import 'package:flutter/material.dart';

class IntroPgae extends StatelessWidget {
  const IntroPgae({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
        body: const IntroWidget(),
      ),
    );
  }
}
