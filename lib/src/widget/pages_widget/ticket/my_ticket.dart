import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/getx/ticket_controller.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/text_widget/movie_text.dart';
import 'package:cinema_booking_app/src/widget/text_widget/profiel_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTicketWidget extends StatelessWidget {
  const MyTicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TicketController());
    return FutureBuilder(
      future: controller.fetchTicket(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            final ticket = snapshot.data;
            return Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                itemCount: ticket!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return AppSizes.mediumHeightSizedBox;
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      width: 350.w,
                      height: 120.h,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorConstant.mainScaffoldBackgroundColor,
                        border: Border.all(color: ColorConstant.fadeColor),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            color: Colors.white.withOpacity(.2),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileText.secText(
                            "MOVIE: ${ticket[index]["movieName"]}",
                          ),
                          MovieText.fadeText(
                              "TIME: ${ticket[index]["movieName"]}th May,${ticket[index]["time"]}"),
                          MovieText.fadeText(
                            "YOUR SEATS: ${ticket[index]["seats"]}",
                          ),
                          MovieText.fadeText(
                            ticket[index]["movieName"],
                          ),
                        ],
                      ));
                },
              ),
            );
          } else {
            return const Text("Sapshot has Error");
          }
        }
      },
    );
  }
}
