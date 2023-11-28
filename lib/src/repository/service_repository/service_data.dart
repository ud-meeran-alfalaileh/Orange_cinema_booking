import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxController {
  final db = FirebaseFirestore.instance;
  Future<Map<String, List<DocumentSnapshot>>> fetchAds() async {
    final adsQuery = db.collection('ads').get();

    final results = await Future.wait([adsQuery]);

    List<DocumentSnapshot> ads = results[0].docs;

    return {
      'ads': ads,
    };
  }
}
