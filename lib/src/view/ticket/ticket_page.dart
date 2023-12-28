import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/model/booking_model.dart';
import 'package:cinema_booking_app/src/widget/pages_widget/ticket/ticket_widget.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key, required this.bookingModel});
  final BookingModel bookingModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
      body: Center(
          child: TicketWidget(
        bookingModel: bookingModel,
      )),
    ));
  }
}
