import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/pages_widget.dart/navbar_widget.dart/cinema_widget.dart';
import 'package:flutter/material.dart';

class CinemaPage extends StatelessWidget {
  const CinemaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
      body: const Center(
        child: CinemaWidget(),
      ),
    ));
  }
}
