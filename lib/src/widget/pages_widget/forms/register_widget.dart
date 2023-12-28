import 'package:cinema_booking_app/src/getx/register_controller.dart';
import 'package:cinema_booking_app/src/model/login_model.dart';
import 'package:cinema_booking_app/src/model/user_model.dart';
import 'package:cinema_booking_app/src/view/forms/login_page.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/button_widget.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/form_widget.dart';
import 'package:cinema_booking_app/src/widget/text_widget/cinema_text.dart';
import 'package:cinema_booking_app/src/widget/text_widget/form_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/color.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final controller = Get.put(RegisterController());

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: controller.fromKey,
        child: SizedBox(
          height: 700.h,
          width: double.infinity,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorConstant.secondaryScaffoldBacground,
                    )),
                AppSizes.largeWidthSizedBox,
                AppSizes.smallWidthSizedBox,
                CinemaText.appMainText("Register"),
              ]),
              AppSizes.smallHeightSizedBox,
              FormText.formLabelText("Email"),
              FormWidget(
                login: Login(
                  enableText: false,
                  controller: controller.email,
                  hintText: "Email",
                  invisible: false,
                  validator: (email) => controller.validateEmail(email),
                  type: TextInputType.emailAddress,
                  onChange: null,
                  inputFormat: null,
                  onTap: () {},
                ),
                color: ColorConstant.secondaryScaffoldBacground,
              ),
              AppSizes.smallHeightSizedBox,
              FormText.formLabelText("User Name"),
              FormWidget(
                login: Login(
                  enableText: false,
                  controller: controller.userName,
                  hintText: "User Name",
                  invisible: false,
                  validator: (password) =>
                      controller.vaildateUserName(password),
                  type: TextInputType.name,
                  onChange: null,
                  inputFormat: null,
                  onTap: () {},
                ),
                color: ColorConstant.secondaryScaffoldBacground,
              ),
              AppSizes.smallHeightSizedBox,
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
              AppSizes.smallHeightSizedBox,
              FormText.formLabelText("Confirm Password"),
              FormWidget(
                login: Login(
                  enableText: false,
                  controller: controller.confirmPassword,
                  hintText: "Confirm Password",
                  invisible: true,
                  validator: (password) =>
                      controller.validConfirmPassword(password),
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
                        controller.onSignup(UserModel(
                            email: controller.email.text.trim(),
                            name: controller.userName.text.trim(),
                            password: controller.password.text.trim(),
                            phone: controller.phoneNumber.text.trim(),
                            imageUrl: '')),
                      },
                  title: "Register"),
              TextButton(
                  onPressed: () {
                    Get.to(const LoginPage());
                  },
                  child: Text(
                    "Already Have An Account?Login",
                    style: TextStyle(color: ColorConstant.mainTextColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
