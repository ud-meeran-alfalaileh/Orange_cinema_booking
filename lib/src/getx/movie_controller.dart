import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  Future<List<Map<String, dynamic>>> getMovies() async {
    List<Map<String, dynamic>> movies = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Movies').get();

    for (var doc in querySnapshot.docs) {
      movies.add(doc.data() as Map<String, dynamic>);
    }
    return movies;
  }
}
