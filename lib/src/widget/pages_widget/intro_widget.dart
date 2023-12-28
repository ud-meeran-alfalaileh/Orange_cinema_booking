import 'package:cinema_booking_app/src/view/forms/login_page.dart';
import 'package:cinema_booking_app/src/view/forms/register_page.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/button_widget.dart';
import 'package:cinema_booking_app/src/widget/text_widget/intro_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          IntroText.mainText("Cinema Booking App"),
          AppSizes.smallHeightSizedBox,
          IntroText.secText("Your cinematic journey starts here! "),
          SizedBox(
            height: 150.h,
          ),
          SizedBox(
            width: 300.w,
            height: 70.h,
            child: ButtonWidget(
              onTap: () {
                Get.to(const LoginPage());
              },
              title: 'Login',
            ),
          ),
          AppSizes.smallHeightSizedBox,
          SizedBox(
            width: 300.w,
            height: 70.h,
            child: ButtonWidget(
              onTap: () {
                Get.to(const RegisterPage());
              },
              title: 'Register',
            ),
          )
        ],
      ),
    );
  }
}
