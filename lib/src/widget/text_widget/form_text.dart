import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FormText {
  static formLabelText(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          textStyle:
              TextStyle(color: ColorConstant.mainTextColor, fontSize: 18.sp)),
    );
  }
}
