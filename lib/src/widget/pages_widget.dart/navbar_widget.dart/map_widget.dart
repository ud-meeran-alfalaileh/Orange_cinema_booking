import 'package:cinema_booking_app/src/getx/map_controller.dart';
import 'package:cinema_booking_app/src/widget/custom_widget.dart/header_widget.dart/map_header.dart';
import 'package:cinema_booking_app/src/widget/partial_widget/map_partial.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final mapController = Get.put(MapController());
  @override
  void dispose() {
    mapController.customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenhight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Obx(
          () => GoogleMap(
            onTap: (position) {
              mapController.customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              mapController.customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              mapController.customInfoWindowController.googleMapController =
                  controller;
            },
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: mapController.markers.toSet(),
            mapType: MapType.normal,
            initialCameraPosition: mapController.initLocation,
          ),
        ),
        CustomInfoWindow(
          controller: mapController.customInfoWindowController,
          height: 75,
          width: 150,
          offset: 50,
        ),
        mapHeader(screenWidth),
        MapContainer(
          screenWidth: screenWidth,
          screenhight: screenhight,
        )
      ],
    );
  }
}
