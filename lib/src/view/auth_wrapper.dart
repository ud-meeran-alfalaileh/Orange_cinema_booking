import 'package:cinema_booking_app/src/view/intro_page.dart';
import 'package:cinema_booking_app/src/widget/pages_widget.dart/navbar_widget.dart/navbar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return const NavBarWidget();
        } else {
          return const IntroPgae();
        }
      },
    );
  }
}
