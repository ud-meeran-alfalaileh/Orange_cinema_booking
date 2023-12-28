import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

mainAppBar() {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
    elevation: 0,
    leading: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorConstant.secondaryScaffoldBacground,
            ))
      ],
    ),
  );
}

topRatedAppBar(String title) {
  return AppBar(
    leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorConstant.mainTextColor,
        )),
    backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: ColorConstant.mainTextColor)),
    ),
  );
}
