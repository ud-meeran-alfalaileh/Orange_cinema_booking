import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/getx/cinema_controller.dart';
import 'package:cinema_booking_app/src/getx/map_controller.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets.dart/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/text_widget/map_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MapContainer extends StatelessWidget {
  const MapContainer(
      {super.key, required this.screenWidth, required this.screenhight});
  final double screenWidth;
  final double screenhight;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CinemaController());
    final mapController = Get.put(MapController());

    return FutureBuilder<List<Map<String, dynamic>>>(
        future: controller.getCinemas(),
        builder: (context, snapshot) {
          {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final cinema = snapshot.data!;
                return Obx(() {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      width: mapController.isExpanded.value == true
                          ? screenhight
                          : 0.8 * screenWidth,
                      height: mapController.isExpanded.value == true
                          ? screenhight
                          : 0.07 * screenhight,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(50.r)),
                          color: ColorConstant.mainScaffoldBackgroundColor),
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                mapController.isExpanded.value =
                                    !mapController.isExpanded.value;
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: ColorConstant.mainTextColor,
                              )),
                          mapController.isExpanded.value == true
                              ? mapMovieList(cinema)
                              : Container(),
                        ],
                      ),
                    ),
                  );
                });
              } else if (snapshot.hasError) {
                return Center(child: Text('Error${snapshot.error}'));
              } else {
                return const Text("something went wrong1");
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            } else {
              return const Text("somthing went wrong3");
            }
          }
        });
  }
}

mapMovieList(List<Map<String, dynamic>> cinema) {
  final mapController = Get.put(MapController());

  return Expanded(
    child: ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            final coordinate = cinema[index]['Coordinates'];
            final latLng = coordinate.split(',');
            final latitude = double.tryParse(latLng[0].trim()) ?? 0.0;
            final longitude = double.tryParse(latLng[1].trim()) ?? 0.0;
            mapController.openGoogleMap(latitude, longitude);
          },
          child: Row(
            children: [
              Container(
                  height: 70.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    image: DecorationImage(
                        image: NetworkImage(cinema[index]['image']),
                        fit: BoxFit.cover),
                  )),
              AppSizes.smallWidthSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MapText.mainText(cinema[index]['name']),
                  MapText.mainText(cinema[index]['address']),
                  AppSizes.xsmallHeightSizedBox,
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return AppSizes.mediumHeightSizedBox;
      },
      itemCount: cinema.length,
    ),
  );
}
