import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/getx/profile_controller.dart';
import 'package:cinema_booking_app/src/getx/register_controller.dart';
import 'package:cinema_booking_app/src/model/login_model.dart';
import 'package:cinema_booking_app/src/model/user_model.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/button_widget.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/form_widget.dart';
import 'package:cinema_booking_app/src/widget/text_widget/form_text.dart';
import 'package:cinema_booking_app/src/widget/text_widget/profiel_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  final profileController = Get.put(ProfileController());
  final controller = Get.put(RegisterController());
  @override
  dispose() {
    super.dispose();
    controller.dispose();
    profileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: profileController.getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Container();
        } else {
          UserModel userData = snapshot.data as UserModel;
          final id = TextEditingController(text: userData.id);
          final email = TextEditingController(text: userData.email);
          final userName = TextEditingController(text: userData.name);
          final phoneNumber = TextEditingController(text: userData.phone);
          final password = TextEditingController(text: userData.password);

          return Container(
            margin: const EdgeInsets.all(20),
            child: Form(
              key: controller.updatKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: ColorConstant.secondaryScaffoldBacground,
                          ),
                        ),
                        AppSizes.mediumWidthSizedBox,
                        ProfileText.mainText("Edit Your Profile"),
                      ],
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          profileController.pickImage(userData.id);
                        },
                        child: userData.imageUrl != null
                            ? CircleAvatar(
                                radius: 80,
                                backgroundImage:
                                    NetworkImage(userData.imageUrl!))
                            : Container(
                                decoration: BoxDecoration(
                                    color: ColorConstant.mainTextColor,
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  "assets/profileIcon.svg",
                                  width: 150.w,
                                  height: 150.h,
                                ),
                              ),
                      ),
                    ),
                    AppSizes.smallHeightSizedBox,
                    FormText.formLabelText("Email"),
                    FormWidget(
                      login: Login(
                        enableText: true,
                        controller: email,
                        hintText: userData.email,
                        invisible: false,
                        validator: null,
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
                        controller: userName,
                        hintText: userData.name,
                        invisible: false,
                        validator: null,
                        type: TextInputType.name,
                        onChange: null,
                        inputFormat: null,
                        onTap: () {},
                      ),
                      color: ColorConstant.secondaryScaffoldBacground,
                    ),
                    AppSizes.smallHeightSizedBox,
                    FormText.formLabelText("Phone number"),
                    FormWidget(
                      login: Login(
                        enableText: false,
                        controller: phoneNumber,
                        hintText: userData.phone,
                        invisible: false,
                        validator: null,
                        type: TextInputType.phone,
                        onChange: null,
                        inputFormat: [controller.maskFormatterPhone],
                        onTap: () {},
                      ),
                      color: ColorConstant.secondaryScaffoldBacground,
                    ),
                    AppSizes.mediumHeightSizedBox,
                    // FormText.formLabelText("Password"),
                    // FormWidget(
                    //   login: Login(
                    //     enableText: false,
                    //     controller: password,
                    //     hintText: "Password",
                    //     invisible: true,
                    //     validator: null,
                    //     type: TextInputType.visiblePassword,
                    //     onChange: null,
                    //     inputFormat: null,
                    //     onTap: () {},
                    //   ),
                    // color: ColorConstant.secondaryScaffoldBacground,
                    // ),
                    SizedBox(
                        width: double.infinity,
                        child: ButtonWidget(
                            onTap: () async {
                              if ((controller.updatKey.currentState!
                                  .validate())) {
                                final userData = UserModel(
                                  email: email.text.trim(),
                                  id: id.text.trim(),
                                  name: userName.text.trim(),
                                  password: password.text.trim(),
                                  phone: phoneNumber.text.trim(),
                                  imageUrl: profileController.image.toString(),
                                );
                                await profileController.updateRecord(userData);
                              }
                            },
                            title: "Update"))
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
