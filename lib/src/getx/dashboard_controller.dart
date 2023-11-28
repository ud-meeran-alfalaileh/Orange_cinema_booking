import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<Map<String, dynamic>> ads = [];
  Future<List<Map<String, dynamic>>> getAds() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('ads').get();

    querySnapshot.docs.forEach((doc) {
      ads.add(doc.data() as Map<String, dynamic>);
    });
    return ads;
  }
}
