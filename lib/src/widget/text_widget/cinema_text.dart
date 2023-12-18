import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CinemaText {
  static appMainText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
          textStyle:
              TextStyle(fontSize: 35.sp, color: ColorConstant.mainTextColor)),
    );
  }

  static cinemaText(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
          textStyle:
              TextStyle(fontSize: 17.sp, color: ColorConstant.mainTextColor)),
    );
  }
}
