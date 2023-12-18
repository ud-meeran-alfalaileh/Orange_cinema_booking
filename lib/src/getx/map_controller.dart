import 'dart:async';

import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/widget/text_widget/map_text.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapController extends GetxController {
  GoogleMapController? mapController;
  Completer<GoogleMapController> controller = Completer();
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();

  RxList<Marker> markers = <Marker>[].obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString selectedCinemaId = ''.obs;
  RxMap selectedCinemaData = {}.obs;
  RxBool isExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadMarkers();
    getCurrentLocation();
  }

  Future<void> _loadMarkers() async {
    final newMarkers = await getMarkers();
    markers.assignAll(newMarkers);
  }

  Future<Set<Marker>> getMarkers() async {
    final collectionReference = firestore.collection('cinemas');
    final querySnapshot = await collectionReference.get();
    final newMarkers = <Marker>{};

    for (var doc in querySnapshot.docs) {
      final coordinate = doc['Coordinates'];
      final latLng = coordinate.split(',');
      final latitude = double.tryParse(latLng[0].trim()) ?? 0.0;
      final longitude = double.tryParse(latLng[1].trim()) ?? 0.0;

      newMarkers.add(
        Marker(
          markerId: MarkerId(doc.id),
          position: LatLng(latitude, longitude),
          onTap: () {
            customInfoWindowController.addInfoWindow!(
                Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          openGoogleMap(latitude, longitude);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorConstant.mainScaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child: MapText.mainText(doc['name']),
                          ),
                        ),
                      ),
                    ),
                    Triangle.isosceles(
                      edge: Edge.BOTTOM,
                      child: Container(
                        color: ColorConstant.mainScaffoldBackgroundColor,
                        width: 20.0,
                        height: 10.0,
                      ),
                    ),
                  ],
                ),
                LatLng(latitude, longitude));
          },
        ),
      );
    }

    return newMarkers;
  }

  void openGoogleMap(double latitude, double longitude) async {
    Uri mapUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (!await launchUrl(mapUrl)) {
      throw Exception('Could not launch $mapUrl');
    }
  }

  Future<void> onMarkerTapped(String cinemaId) async {
    final vendorDoc = await firestore.collection('cinemas').doc(cinemaId).get();
    if (vendorDoc.exists) {
      selectedCinemaId.value = cinemaId;
      selectedCinemaData.value = vendorDoc.data() as Map<String, dynamic>;
    }
  }

  void goToPosition(Position position) async {
    final GoogleMapController mapController = await controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15.0,
      ),
    ));
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
    } else if (permission == LocationPermission.deniedForever) {
    } else {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        goToPosition(position);
        // ignore: empty_catches
      } catch (e) {}
    }
  }

  CameraPosition initLocation = const CameraPosition(
    target: LatLng(31.953455, 35.888824),
    zoom: 10.4746,
  );
}
