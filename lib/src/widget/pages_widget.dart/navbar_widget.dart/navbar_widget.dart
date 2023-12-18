import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/repository/auth/auth_repo.dart';
import 'package:cinema_booking_app/src/view/navbar_pages/cinema_page.dart';
import 'package:cinema_booking_app/src/view/navbar_pages/dashboard_page.dart';
import 'package:cinema_booking_app/src/view/navbar_pages/map_page.dart';
import 'package:cinema_booking_app/src/view/navbar_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() => Scaffold(
            body: Center(
              child: widgetList[selectedIndex.value],
            ),
            bottomNavigationBar: BottomNavigationBar(
                fixedColor: ColorConstant.mainScaffoldBackgroundColor,
                backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
                currentIndex: selectedIndex.value,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: ColorConstant.mainScaffoldBackgroundColor,
                    icon: IconButton(
                      onPressed: () {
                        selectedIndex.value = 0;
                      },
                      icon: Icon(
                        Icons.home_outlined,
                        size: 25,
                        color: ColorConstant.secondaryScaffoldBacground,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        selectedIndex.value = 1;
                      },
                      icon: Icon(
                        size: 25,
                        Icons.movie_outlined,
                        color: ColorConstant.secondaryScaffoldBacground,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        selectedIndex.value = 2;
                      },
                      icon: Icon(
                        size: 25,
                        Icons.location_on_outlined,
                        color: ColorConstant.secondaryScaffoldBacground,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        selectedIndex.value = 3;
                      },
                      icon: Icon(
                        size: 25,
                        Icons.person_2_outlined,
                        color: ColorConstant.secondaryScaffoldBacground,
                      ),
                    ),
                    label: "",
                  )
                ]))));
  }
}
