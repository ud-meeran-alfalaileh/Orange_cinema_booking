import 'package:cinema_booking_app/src/getx/register_controller.dart';
import 'package:cinema_booking_app/src/widget/text_widget/form_text.dart';
import 'package:cinema_booking_app/src/widget/text_widget/profiel_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        ProfileText.mainText("Edit Your Profile"),
        FormText.formLabelText("Password"),
        // FormWidget(
        //   login: Login(
        //     enableText: false,
        //     controller: controller.password,
        //     hintText: "Password",
        //     invisible: true,
        //     validator: (password) => controller.vaildatePassword(password),
        //     type: TextInputType.visiblePassword,
        //     onChange: null,
        //     inputFormat: null,
        //     onTap: () {},
        //   ),
        //   color: ColorConstant.secondaryScaffoldBacground,
        // ),
      ],
    ));
  }
}
