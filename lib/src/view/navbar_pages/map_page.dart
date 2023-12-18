import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/pages_widget.dart/navbar_widget.dart/map_widget.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
        body: const MapWidget(),
      ),
    );
  }
}
