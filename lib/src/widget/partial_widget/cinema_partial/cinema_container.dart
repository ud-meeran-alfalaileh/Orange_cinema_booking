import 'package:cinema_booking_app/src/view/movie_pages/movies_page.dart';
import 'package:cinema_booking_app/src/widget/text_widget/cinema_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

cinemaContainer(cinemaImage, cinemaAddress) {
  return GestureDetector(
    onTap: () {
      Get.to(const MoviePage());
    },
    child: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        width: 150.w,
        height: 200.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150.w,
              height: 120.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                      image: NetworkImage(cinemaImage), fit: BoxFit.cover)),
            ),
            CinemaText.cinemaText(cinemaAddress)
          ],
        ),
      ),
    ),
  );
}
