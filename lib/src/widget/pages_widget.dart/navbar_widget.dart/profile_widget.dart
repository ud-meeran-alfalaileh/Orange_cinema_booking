import 'package:cinema_booking_app/src/getx/profile_controller.dart';
import 'package:cinema_booking_app/src/model/user_model.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets.dart/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/custom_widget.dart/profile_button.dart';
import 'package:cinema_booking_app/src/widget/text_widget/profiel_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return FutureBuilder(
      future: controller.getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Container();
        } else {
          UserModel userData = snapshot.data as UserModel;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.pickImage(userData.id);
                    },
                    child: Obx(() => CircleAvatar(
                          radius: 80,
                          backgroundImage: controller.iimage != null
                              ? NetworkImage(userData.imageUrl!)
                              : null,
                        )),
                  ),
                  AppSizes.smallWidthSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileText.secText("Hi! ${userData.name}"),
                      ProfileText.mainText("Welcome")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 0.15 * MediaQuery.of(context).size.height,
              ),
              SizedBox(
                height: 300.h,
                width: 300.w,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return profileButton(controller.profile[index]);
                    },
                    separatorBuilder: (context, index) {
                      return AppSizes.smallHeightSizedBox;
                    },
                    itemCount: controller.profile.length),
              )
            ],
          );
        }
      },
    );
  }
}
