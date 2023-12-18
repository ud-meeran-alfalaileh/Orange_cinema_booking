import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<Map<String, dynamic>> ads = [];
  Future<List<Map<String, dynamic>>> getAds() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('ads').get();

    for (var doc in querySnapshot.docs) {
      ads.add(doc.data() as Map<String, dynamic>);
    }
    return ads;
  }
}
