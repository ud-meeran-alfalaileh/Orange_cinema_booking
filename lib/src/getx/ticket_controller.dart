import 'package:cinema_booking_app/src/repository/auth/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  final authRepo = Get.put(AuthenticationRepository());

  final CollectionReference bookingsCollection =
      FirebaseFirestore.instance.collection('booking');

  Future<List<Map<String, dynamic>>> fetchTicket() async {
    List<Map<String, dynamic>> ticket = [];

    final email = authRepo.firebaseUser.value?.email;

    try {
      QuerySnapshot querySnapshot =
          await bookingsCollection.where('userEmail', isEqualTo: email).get();
      for (var doc in querySnapshot.docs) {
        ticket.add(doc.data() as Map<String, dynamic>);
      }
      return ticket;
    } catch (e) {
      print('Error getting bookings: $e');
      return [];
    }
  }
}
