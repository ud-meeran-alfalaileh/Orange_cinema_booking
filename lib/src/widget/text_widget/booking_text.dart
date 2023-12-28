import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingText {
  static secText(title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          textStyle:
              TextStyle(color: ColorConstant.mainTextColor, fontSize: 12.sp)),
    );
  }

  static mainText(title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: ColorConstant.mainTextColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500)),
    );
  }

  static ticketMainText(title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: ColorConstant.mainTextColor,
              fontSize: 27.sp,
              fontWeight: FontWeight.w600)),
    );
  }

  static ticketsecText(title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: ColorConstant.mainTextColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600)),
    );
  }

  static fadeText(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorConstant.subTextColor,
              fontSize: 20.sp)),
    );
  }
}
