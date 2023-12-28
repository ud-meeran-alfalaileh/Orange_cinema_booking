// import 'package:cinema_booking_app/src/constant/color.dart';
// import 'package:cinema_booking_app/src/getx/bookimg_controller.dart';
// import 'package:cinema_booking_app/src/widget/pages_widget/booking_widget/partial_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class SeatsWidget extends StatefulWidget {
//   const SeatsWidget({super.key, required this.movieName});
//   final String movieName;
//   @override
//   State<SeatsWidget> createState() => _SeatsWidgetState();
// }

// class _SeatsWidgetState extends State<SeatsWidget> {
//   final controller = Get.put(BookingController());
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => FutureBuilder(
//         future: controller.fetchBookingData(
//             'The Dark Knight', controller.days.value),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Container(
//               padding: const EdgeInsets.all(20),
//               width: double.infinity,
//               height: 300.h,
//               decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(20.r)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: GridView.builder(
//                       itemCount: 48,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Center(
//                           child: GestureDetector(
//                             onTap: () {
//                               if (controller.days.value == "") {
//                                 Get.snackbar("Error", "CHOOSE A DAY FIRST",
//                                     snackPosition: SnackPosition.BOTTOM,
//                                     colorText: ColorConstant
//                                         .mainScaffoldBackgroundColor,
//                                     backgroundColor: Colors.red);
//                               } else {
//                                 if (controller.newSeats.contains(index)) {
//                                   null;
//                                 } else {
//                                   if (controller.seats.contains(index)) {
//                                     controller.seats.remove(index);
//                                   } else {
//                                     controller.seats.add(index);
//                                   }
//                                 }
//                               }
//                             },
//                             child: Obx(
//                               () => Container(
//                                   height: 25.h,
//                                   width: 25.w,
//                                   decoration: controller.newSeats
//                                           .contains(index)
//                                       ? BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5.r),
//                                           color: ColorConstant.blueColor)
//                                       : controller.seats.contains(index)
//                                           ? BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(5.r),
//                                               color: ColorConstant
//                                                   .secondaryScaffoldBacground)
//                                           : BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(5.r),
//                                               border: Border.all(
//                                                   width: 3.w,
//                                                   color: ColorConstant
//                                                       .secondaryScaffoldBacground))),
//                             ),
//                           ),
//                         );
//                       },
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 8,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       bookingInfo(
//                           "Selected",
//                           BoxDecoration(
//                               borderRadius: BorderRadius.circular(5.r),
//                               color: ColorConstant.secondaryScaffoldBacground)),
//                       bookingInfo(
//                           "Reserved",
//                           BoxDecoration(
//                               borderRadius: BorderRadius.circular(5.r),
//                               color: ColorConstant.blueColor)),
//                       bookingInfo(
//                           "Available",
//                           BoxDecoration(
//                               borderRadius: BorderRadius.circular(5.r),
//                               border: Border.all(
//                                   width: 3.w,
//                                   color: ColorConstant
//                                       .secondaryScaffoldBacground))),
//                     ],
//                   )
//                 ],
//               ),
//             );
//           } else {
//             return const CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
