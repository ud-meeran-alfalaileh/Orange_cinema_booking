import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/model/booking_model.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/button_widget.dart';
import 'package:cinema_booking_app/src/widget/pages_widget/navbar_widget/navbar_widget.dart';
import 'package:cinema_booking_app/src/widget/text_widget/booking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key, required this.bookingModel});
  final BookingModel bookingModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BookingText.ticketMainText(
                  "Thank you for purchasing your movie ticket with us. We hope you enjoy your movie experience."),
              AppSizes.smallHeightSizedBox,
              Container(
                padding: const EdgeInsets.all(20),
                width: 350.w,
                height: 350.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: ColorConstant.fadeColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BookingText.ticketsecText(bookingModel.movieNmae),
                        BookingText.fadeText(
                            "${bookingModel.day}th May,${bookingModel.time}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            BookingText.ticketsecText("Tickets"),
                            BookingText.fadeText("${bookingModel.seats.length}")
                          ],
                        ),
                        Column(
                          children: [
                            BookingText.ticketsecText("Seating"),
                            BookingText.fadeText("${bookingModel.seats}")
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        BookingText.ticketsecText("Price"),
                        BookingText.fadeText(bookingModel.price),
                      ],
                    ),
                    Row(
                      children: List.generate(
                          150 ~/ 10,
                          (index) => Expanded(
                                child: Container(
                                  color: index % 2 == 0
                                      ? Colors.transparent
                                      : ColorConstant
                                          .mainScaffoldBackgroundColor,
                                  height: 2,
                                ),
                              )),
                    ),
                    Image.asset(
                      "assets/CodeBars.png",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 410.h,
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.mainScaffoldBackgroundColor),
          ),
        ),
        Positioned(
          top: 410.h,
          left: 310.w,
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.mainScaffoldBackgroundColor),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                    onTap: () {
                      Get.offAll(const NavBarWidget());
                    },
                    title: "Back To Main Page")))
      ],
    );
  }
}
