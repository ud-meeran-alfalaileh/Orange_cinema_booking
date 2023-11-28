import 'package:cinema_booking_app/src/getx/cinema_controller.dart';
import 'package:cinema_booking_app/src/widget/text_widget/cinema_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CinemaContainer extends StatelessWidget {
  const CinemaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controllar = Get.put(CinemaController());

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: controllar.getCinemas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Container();
        } else {
          final cinems = snapshot.data;
          return Column(
            children: [
              SizedBox(
                width: 500.w,
                height: 700.h,
                child: GridView.builder(
                  itemCount: cinems!.length,
                  itemBuilder: (context, index) {
                    final cinemaImage = cinems[index]['image'];
                    final cinemaAddress = cinems[index]['address'];

                    return GestureDetector(
                      onTap: () {},
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0.h, horizontal: 6.0.w),
                              width: 150.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  image: DecorationImage(
                                      image: NetworkImage(cinemaImage),
                                      fit: BoxFit.cover)),
                            ),
                            CinemaText.cinemaText(cinemaAddress)
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 350,
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
