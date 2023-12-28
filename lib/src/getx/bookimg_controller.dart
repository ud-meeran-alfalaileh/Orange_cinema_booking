import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/model/booking_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  List<dynamic> newSeats = [].obs;
  final seats = <int>[].obs;
  final days = "".obs;
  final times = "".obs;

  // final CollectionReference bookingsCollection =
  //     FirebaseFirestore.instance.collection('booking');

  // Future<void> getBookings(String movieName, List<int> day) async {
  //   try {
  //     QuerySnapshot querySnapshot = await bookingsCollection
  //         .where('movieName', isEqualTo: movieName)
  //         .where('day', isEqualTo: [3]).get();

  //     for (var document in querySnapshot.docs) {
  //       List<dynamic> documentSeats = document['seats'];

  //       newSeats.addAll(documentSeats);
  //     }
  //     print(newSeats);
  //   } catch (e) {
  //     print('Error getting bookings: $e');
  //   }
  // }

  Future<void> fetchBookingData(
      String movieName, String day, String time) async {
    try {
      CollectionReference bookingCollection =
          FirebaseFirestore.instance.collection('booking');

      QuerySnapshot querySnapshot = await bookingCollection
          .where('movieName', isEqualTo: movieName)
          .where('day', isEqualTo: day)
          .where('time', isEqualTo: time)
          .get();

      for (var document in querySnapshot.docs) {
        List<dynamic> documentSeats = document['seats'];

        newSeats.addAll(documentSeats);
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching booking data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchBookingInfo(movieName) async {
    List<Map<String, dynamic>> booking = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('booking')
        .where("movieName", isEqualTo: movieName)
        .get();

    for (var doc in querySnapshot.docs) {
      booking.add(doc.data() as Map<String, dynamic>);
    }
    return booking;
  }

  Future<void> bookingInfo(BookingModel bookingModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('booking')
          .add(bookingModel.toJson());
      Get.snackbar("Success", "Booking Successful! 🎉",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstant.secondaryScaffoldBacground,
          backgroundColor: ColorConstant.mainScaffoldBackgroundColor);
    } catch (e) {
      Get.snackbar("Error", "Failed to add farm",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstant.mainScaffoldBackgroundColor,
          backgroundColor: Colors.red);
    }
  }
}
