import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/text_widget/map_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container mapHeader(double screenWidth) {
  return Container(
      padding: const EdgeInsets.all(20),
      width: screenWidth,
      height: 0.2 * screenWidth,
      decoration: BoxDecoration(
          color: ColorConstant.mainScaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.r),
          )),
      child: Center(
        child: MapText.mainText("Movie Locator"),
      ));
}
