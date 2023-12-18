import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroText {
  static mainText(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          textStyle:
              TextStyle(fontSize: 25.sp, color: ColorConstant.mainTextColor)),
    );
  }

  static secText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontSize: 15.sp,
              color: ColorConstant.secondaryScaffoldBacground)),
    );
  }
}
