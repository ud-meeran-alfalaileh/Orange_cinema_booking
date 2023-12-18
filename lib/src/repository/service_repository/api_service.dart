// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MovieListScreen extends StatefulWidget {
//   @override
//   _MovieListScreenState createState() => _MovieListScreenState();
// }

// class _MovieListScreenState extends State<MovieListScreen> {
//   Future<List<Movie>> fetchMovies() async {
//     final response =
//         await http.get(Uri.parse('http://localhost:3000/api/movies'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body)['movies'];
//       return data.map((json) => Movie.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load movies');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Movie List'),
//       ),
//       body: FutureBuilder<List<Movie>>(
//         future: fetchMovies(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data?.length,
//               itemBuilder: (context, index) {
//                 Movie movie = snapshot.data![index];
//                 return ListTile(
//                   title: Text(movie.movieName),
//                   subtitle: Text(movie.description),
//                   // Add more details or widgets as needed
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class Movie {
//   final int id;
//   final String movieName;
//   final List<String> cast;
//   final String director;
//   final String producer;
//   final String description;
//   final double ratings;
//   final List<String> genre;
//   final String poster;
//   final String releaseDate;
//   final int runtime;

//   Movie({
//     required this.id,
//     required this.movieName,
//     required this.cast,
//     required this.director,
//     required this.producer,
//     required this.description,
//     required this.ratings,
//     required this.genre,
//     required this.poster,
//     required this.releaseDate,
//     required this.runtime,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       id: json['id'],
//       movieName: json['movie_name'],
//       cast: List<String>.from(json['cast']),
//       director: json['director'],
//       producer: json['producer'],
//       description: json['description'],
//       ratings: json['ratings'].toDouble(),
//       genre: List<String>.from(json['genre']),
//       poster: json['poster'],
//       releaseDate: json['release_date'],
//       runtime: json['runtime'],
//     );
//   }
// }
