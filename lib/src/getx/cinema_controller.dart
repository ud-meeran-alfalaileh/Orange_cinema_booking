import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CinemaController extends GetxController {
  Future<List<Map<String, dynamic>>> getCinemas() async {
    List<Map<String, dynamic>> cinemas = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('cinemas').get();

    querySnapshot.docs.forEach((doc) {
      cinemas.add(doc.data() as Map<String, dynamic>);
    });
    return cinemas;
  }
}
