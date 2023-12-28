import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/model/login_model.dart';
import 'package:cinema_booking_app/src/repository/user_repo/user_repo.dart';
import 'package:cinema_booking_app/src/view/forms/register_page.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/button_widget.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/form_widget.dart';
import 'package:cinema_booking_app/src/widget/text_widget/cinema_text.dart';
import 'package:cinema_booking_app/src/widget/text_widget/form_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../getx/login_controller.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final controller = Get.put(LoginController());
  final userRepo = Get.put(UserRepo());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: controller.formkey,
        child: SizedBox(
          height: 500.h,
          width: 400.w,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
              AppSizes.mediumHeightSizedBox,
              CinemaText.appMainText("Login"),
              AppSizes.mediumHeightSizedBox,
              FormText.formLabelText("Email"),
              FormWidget(
                login: Login(
                  enableText: false,
                  controller: controller.email,
                  hintText: "Email",
                  invisible: false,
                  validator: (email) => controller.validEmail(email),
                  type: TextInputType.emailAddress,
                  onChange: null,
                  inputFormat: null,
                  onTap: () {},
                ),
                color: ColorConstant.secondaryScaffoldBacground,
              ),
              AppSizes.mediumHeightSizedBox,
              FormText.formLabelText("Password"),
              FormWidget(
                login: Login(
                  enableText: false,
                  controller: controller.password,
                  hintText: "Password",
                  invisible: true,
                  validator: (password) =>
                      controller.vaildatePassword(password),
                  type: TextInputType.visiblePassword,
                  onChange: null,
                  inputFormat: null,
                  onTap: () {},
                ),
                color: ColorConstant.secondaryScaffoldBacground,
              ),
              AppSizes.largeHeightSizedBox,
              ButtonWidget(
                  onTap: () => {
                        controller.onLogin(),
                        userRepo.getUserDetails(controller.email.text.trim())
                      },
                  title: "Login"),
              TextButton(
                  onPressed: () {
                    Get.to(RegisterPage());
                  },
                  child: Text(
                    "Don't Have An Account?Create one",
                    style: TextStyle(color: ColorConstant.mainTextColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
