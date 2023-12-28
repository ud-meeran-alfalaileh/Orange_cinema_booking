import 'package:cinema_booking_app/src/model/movie_model.dart';
import 'package:cinema_booking_app/src/view/booking_page/booking_page.dart';
import 'package:cinema_booking_app/src/view/forms/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return BookingPage(
            movieModel: movieModel,
          );
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
