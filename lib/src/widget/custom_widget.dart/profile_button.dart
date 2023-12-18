import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets.dart/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/text_widget/profiel_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

profileButton(ProfileButton profile) {
  return GestureDetector(
    onTap: profile.ontap,
    child: Container(
      padding: const EdgeInsets.all(15),
      height: 60.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: ColorConstant.fadeColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(profile.icon),
          AppSizes.smallWidthSizedBox,
          ProfileText.secText(profile.title),
          const Spacer(),
          Icon(
            Icons.play_arrow_rounded,
            color: ColorConstant.mainTextColor,
            size: 40,
          ),
        ],
      ),
    ),
  );
}

class ProfileButton {
  String icon;
  String title;
  VoidCallback ontap;
  ProfileButton({required this.icon, required this.title, required this.ontap});
}
