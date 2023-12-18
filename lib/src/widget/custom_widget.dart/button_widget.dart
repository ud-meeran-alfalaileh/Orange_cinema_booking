import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/text_widget/form_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.onTap, required this.title})
      : super(key: key);
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 143.w,
        height: 60.h,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: ColorConstant.secondaryScaffoldBacground),
        child: Center(child: FormText.formLabelText(title)),
      ),
    );
  }
}
