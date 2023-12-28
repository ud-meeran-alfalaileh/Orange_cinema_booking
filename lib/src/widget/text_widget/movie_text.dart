import 'package:auto_size_text/auto_size_text.dart';
import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieText {
  static mainText(String title) {
    return AutoSizeText(
      title,
      maxLines: 2,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorConstant.mainTextColor,
              fontSize: 25.sp)),
    );
  }

  static fadeText(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorConstant.subTextColor,
              fontSize: 15.sp)),
    );
  }

  static yellowText(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: ColorConstant.secondaryScaffoldBacground,
              fontSize: 20.sp)),
    );
  }

  static blackText(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: ColorConstant.mainScaffoldBackgroundColor,
              fontSize: 20.sp)),
    );
  }

  static whiteText(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorConstant.mainTextColor,
              fontSize: 20.sp)),
    );
  }
}
