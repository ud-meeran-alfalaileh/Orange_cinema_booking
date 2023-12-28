import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/text_widget/booking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../getx/bookimg_controller.dart';

daysWidget(RxList<dynamic> day) {
  final controller = Get.put(BookingController());

  return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (day.contains(index + 1)) {
                  day.remove(index + 1);
                } else {
                  day.clear();
                  day.add(index + 1);
                  controller.newSeats.clear();

                  controller.days.value = "${index + 1}";
                }
              },
              child: Obx(
                () => Container(
                  padding: const EdgeInsets.all(5),
                  width: 45.w,
                  decoration: day.contains(index + 1)
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: ColorConstant.secondaryScaffoldBacground)
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: ColorConstant.fadeColor),
                  child: Center(
                    child: Column(
                      children: [
                        BookingText.secText("May"),
                        BookingText.mainText("${index + 1}")
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return AppSizes.smallWidthSizedBox;
          },
          itemCount: 5));
}

bookingInfo(title, decoration) {
  return SizedBox(
    width: 90,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(height: 25.h, width: 25.w, decoration: decoration),
        BookingText.secText(title)
      ],
    ),
  );
}
