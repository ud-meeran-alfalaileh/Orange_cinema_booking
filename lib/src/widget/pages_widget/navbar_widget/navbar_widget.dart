import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/repository/auth/auth_repo.dart';
import 'package:cinema_booking_app/src/view/navbar_pages/cinema_page.dart';
import 'package:cinema_booking_app/src/view/navbar_pages/dashboard_page.dart';
import 'package:cinema_booking_app/src/view/navbar_pages/map_page.dart';
import 'package:cinema_booking_app/src/view/navbar_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  final _authRepo = Get.put(AuthenticationRepository());
  late final email = _authRepo.firebaseUser.value?.email;

  final List<Widget> widgetList = const [
    DashboardPage(),
    CinemaPage(),
    MapPage(),
    ProfilePage(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
              child: widgetList[selectedIndex],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: ColorConstant.mainScaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConstant.mainScaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8),
                    child: GNav(
                      rippleColor: Colors.grey[300]!,
                      hoverColor: Colors.grey[100]!,
                      gap: 5,
                      activeColor: ColorConstant.mainTextColor,
                      iconSize: 24,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      duration: const Duration(milliseconds: 400),
                      color: ColorConstant.mainTextColor,
                      tabs: const [
                        GButton(
                          icon: Icons.home_outlined,
                        ),
                        GButton(
                          icon: Icons.movie_outlined,
                        ),
                        GButton(
                          icon: Icons.location_on_outlined,
                        ),
                        GButton(
                          icon: Icons.person_2_outlined,
                        ),
                      ],
                      selectedIndex: selectedIndex,
                      onTabChange: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            )));
  }
}
