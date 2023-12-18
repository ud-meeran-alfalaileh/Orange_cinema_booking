import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/getx/cinema_controller.dart';
import 'package:cinema_booking_app/src/model/search_model.dart';
import 'package:cinema_booking_app/src/widget/partial_widget/cinema_partial/cinema_container.dart';
import 'package:cinema_booking_app/src/widget/partial_widget/cinema_partial/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CinemaWidget extends StatefulWidget {
  const CinemaWidget({super.key});

  @override
  State<CinemaWidget> createState() => _CinemaWidgetState();
}

class _CinemaWidgetState extends State<CinemaWidget> {
  final controllar = Get.put(CinemaController());
  List<CinemasModel> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: controllar.getCinemas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Container();
        } else {
          final cinems = snapshot.data;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                  width: 320.w,
                  child: SearchWidget(
                    search: SearchModel(
                        hintText: "Search",
                        icon: Icon(
                          Icons.search,
                          color: ColorConstant.secondaryScaffoldBacground,
                        ),
                        type: TextInputType.text,
                        onChange: null),
                    color: ColorConstant.mainScaffoldBackgroundColor,
                  ),
                ),
                SizedBox(
                  width: 500.w,
                  height: 550.h,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cinems!.length,
                      itemBuilder: (context, index) {
                        final cinemaImage = cinems[index]['image'];
                        final cinemaAddress = cinems[index]['address'];

                        return cinemaContainer(cinemaImage, cinemaAddress);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      )),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
