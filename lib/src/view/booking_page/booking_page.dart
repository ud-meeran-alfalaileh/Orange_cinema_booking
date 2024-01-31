import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/model/movie_model.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/header_widget/app_bar.dart';
import 'package:cinema_booking_app/src/widget/pages_widget/booking_widget/booking_widget.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: mainAppBar(context),
        backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
        body: BookingWidget(
          movieModel: movieModel,
        ),
      ),
    );
  }
}
