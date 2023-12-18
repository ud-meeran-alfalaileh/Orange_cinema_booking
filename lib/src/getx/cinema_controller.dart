import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CinemaController extends GetxController {
  Future<List<Map<String, dynamic>>> getCinemas() async {
    List<Map<String, dynamic>> cinemas = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('cinemas').get();

    for (var doc in querySnapshot.docs) {
      cinemas.add(doc.data() as Map<String, dynamic>);
    }
    return cinemas;
  }

  final CollectionReference cinemas =
      FirebaseFirestore.instance.collection('cinemas');

  Future<List<CinemasModel>> searchCinemas(String keyword) async {
    QuerySnapshot querySnapshot =
        await cinemas.where('name', isEqualTo: keyword).get();
    return querySnapshot.docs.map((doc) {
      return CinemasModel(
        name: doc['name'],
        address: doc['address'],
        coordinates: doc['Coordinates'],
        image: doc['image'],
      );
    }).toList();
  }
}

class CinemasModel {
  String coordinates;
  String address;
  String image;
  String name;

  CinemasModel(
      {required this.name,
      required this.address,
      required this.coordinates,
      required this.image});
}
