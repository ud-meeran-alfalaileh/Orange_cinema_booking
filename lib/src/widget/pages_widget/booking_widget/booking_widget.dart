import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/getx/bookimg_controller.dart';
import 'package:cinema_booking_app/src/model/booking_model.dart';
import 'package:cinema_booking_app/src/model/movie_model.dart';
import 'package:cinema_booking_app/src/repository/auth/auth_repo.dart';
import 'package:cinema_booking_app/src/view/ticket/ticket_page.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/button_widget.dart';
import 'package:cinema_booking_app/src/widget/text_widget/booking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingWidget extends StatefulWidget {
  const BookingWidget({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  final controller = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    final authRepo = Get.put(AuthenticationRepository());

    final day = <int>[].obs;
    final time = <String>[].obs;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SeatsWidget(
                movieName: widget.movieModel.movieName,
              ),
              AppSizes.mediumHeightSizedBox,
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                height: 180.h,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BookingText.mainText("Select Day"),
                    AppSizes.xsmallHeightSizedBox,
                    daysWidget(day),
                    AppSizes.smallHeightSizedBox,
                    BookingText.mainText("Select Time"),
                    AppSizes.xsmallHeightSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 25.h,
                            width: 170.w,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (time.contains(
                                          widget.movieModel.showTime[index])) {
                                        time.remove(
                                            widget.movieModel.showTime[index]);
                                        controller.newSeats.clear();
                                      } else {
                                        time.clear();
                                        time.add(
                                            widget.movieModel.showTime[index]);
                                        controller.newSeats.clear();

                                        controller.times.value =
                                            widget.movieModel.showTime[index];
                                      }
                                      print(controller.times.value);
                                    },
                                    child: Obx(
                                      () => Container(
                                        padding: const EdgeInsets.all(5),
                                        width: 45.w,
                                        decoration: time.contains(widget
                                                .movieModel.showTime[index])
                                            ? BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                color: ColorConstant
                                                    .secondaryScaffoldBacground)
                                            : BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                color: ColorConstant.fadeColor),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              BookingText.secText(widget
                                                  .movieModel.showTime[index]),
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
                                itemCount: widget.movieModel.showTime.length)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                    onTap: () {
                      print(
                          "${controller.seats.length * widget.movieModel.price}");
                      controller.bookingInfo(BookingModel(
                          day: controller.days.value,
                          movieNmae: widget.movieModel.movieName,
                          price:
                              "${controller.seats.length * widget.movieModel.price}",
                          seats: controller.seats,
                          time: controller.times.value,
                          userEmail: authRepo.firebaseUser.value?.email));
                      Get.offAll(TicketPage(
                          bookingModel: BookingModel(
                              day: controller.days.value,
                              movieNmae: widget.movieModel.movieName,
                              price:
                                  "${controller.seats.length * widget.movieModel.price}",
                              seats: controller.seats,
                              time: controller.times.value,
                              userEmail: authRepo.firebaseUser.value?.email)));
                    },
                    title: "Book Now")))
      ],
    );
  }
}

class SeatsWidget extends StatefulWidget {
  const SeatsWidget({super.key, required this.movieName});
  final String movieName;
  @override
  State<SeatsWidget> createState() => _SeatsWidgetState();
}

class _SeatsWidgetState extends State<SeatsWidget> {
  final controller = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FutureBuilder(
        future: controller.fetchBookingData(
            widget.movieName, controller.days.value, controller.times.value),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: 48,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              if (controller.times.value == "") {
                                Get.snackbar(
                                    "Error", "CHOOSE A DAY & Time FIRST",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: ColorConstant
                                        .mainScaffoldBackgroundColor,
                                    backgroundColor: Colors.red);
                              } else {
                                if (controller.newSeats.contains(index)) {
                                  null;
                                } else {
                                  if (controller.seats.contains(index)) {
                                    controller.seats.remove(index);
                                  } else {
                                    controller.seats.add(index);
                                  }
                                }
                              }
                            },
                            child: Obx(
                              () => Container(
                                  height: 25.h,
                                  width: 25.w,
                                  decoration: controller.newSeats
                                          .contains(index)
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: ColorConstant.blueColor)
                                      : controller.seats.contains(index)
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              color: ColorConstant
                                                  .secondaryScaffoldBacground)
                                          : BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              border: Border.all(
                                                  width: 3.w,
                                                  color: ColorConstant
                                                      .secondaryScaffoldBacground))),
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 8,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bookingInfo(
                          "Selected",
                          BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: ColorConstant.secondaryScaffoldBacground)),
                      bookingInfo(
                          "Reserved",
                          BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: ColorConstant.blueColor)),
                      bookingInfo(
                          "Available",
                          BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                  width: 3.w,
                                  color: ColorConstant
                                      .secondaryScaffoldBacground))),
                    ],
                  )
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

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
