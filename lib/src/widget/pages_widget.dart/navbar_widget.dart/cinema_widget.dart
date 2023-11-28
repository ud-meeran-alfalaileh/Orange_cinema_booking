import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/model/search_model.dart';
import 'package:cinema_booking_app/src/widget/custom_widget.dart/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/partial_widget/cinema_partial/cinema_container.dart';
import 'package:cinema_booking_app/src/widget/partial_widget/cinema_partial/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CinemaWidget extends StatefulWidget {
  const CinemaWidget({super.key});

  @override
  State<CinemaWidget> createState() => _CinemaWidgetState();
}

class _CinemaWidgetState extends State<CinemaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchWidget(
              search: SearchModel(
                  hintText: "Search",
                  icon: Icon(
                    Icons.search,
                    color: ColorConstant.secondaryScaffoldBacground,
                  ),
                  type: TextInputType.text,
                  onChange: (String) {}),
            ),
            AppSizes.mediumHeightSizedBox,
            SizedBox(
              width: 350.w,
              height: 600.h,
              child: const CinemaContainer(),
            )
          ],
        ),
      ),
    );
  }
}
