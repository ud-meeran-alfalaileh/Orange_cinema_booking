import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  Future<List<Map<String, dynamic>>> getMovies() async {
    List<Map<String, dynamic>> movies = [];

    final QuerySnapshot<Map<String, dynamic>> result =
        await FirebaseFirestore.instance.collection('Movies').get();
    for (var doc in result.docs) {
      movies.add(doc.data());
    }
    return movies;
  }
}
