import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/header_widget/app_bar.dart';
import 'package:cinema_booking_app/src/widget/pages_widget/ticket/my_ticket.dart';
import 'package:flutter/material.dart';

class MyTicketPage extends StatelessWidget {
  const MyTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: topRatedAppBar("My Ticket"),
      backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
      body: MyTicketWidget(),
    ));
  }
}
