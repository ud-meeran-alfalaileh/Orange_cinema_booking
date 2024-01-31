import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/header_widget/app_bar.dart';
import 'package:cinema_booking_app/src/widget/pages_widget/movies_widget/movies_widget.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: mainAppBar(context),
      backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
      body: const MoviesWidget(),
    ));
  }
}
