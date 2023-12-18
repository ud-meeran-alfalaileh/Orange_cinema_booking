import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/getx/dashboard_controller.dart';
import 'package:cinema_booking_app/src/repository/auth/auth_repo.dart';
import 'package:cinema_booking_app/src/repository/service_repository/service_data.dart';
import 'package:cinema_booking_app/src/widget/partial_widget/slider_widget.dart';
import 'package:cinema_booking_app/src/widget/text_widget/dashboard_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final controller = Get.put(DashboardController());
  final firebaseservice = Get.put(FirebaseService());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebaseservice.fetchAds(),
        builder: (context, snpshot) {
          if (snpshot.connectionState == ConnectionState.done) {
            if (snpshot.hasData) {
              final ads = snpshot.data!['ads'];
              List<Widget> convertSnapshotsToWidgets(
                  List<DocumentSnapshot<Object?>>? documentSnapshots) {
                List<Widget> widgetsList = [];

                if (documentSnapshots != null) {
                  for (DocumentSnapshot<Object?> snapshot
                      in documentSnapshots) {
                    var data = snapshot.data() as Map<String, dynamic>?;

                    if (data != null) {
                      Widget documentWidget = Column(
                        children: [
                          Container(
                            width: 350,
                            height: 450.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(data['image']))),
                          ),
                          DashboardText.sliderText(
                            data['name'],
                          )
                        ],
                      );

                      widgetsList.add(documentWidget);
                    }
                  }
                }

                return widgetsList;
              }

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          AuthenticationRepository().logout();
                        },
                        child: Icon(
                          Icons.logout,
                          color: ColorConstant.mainTextColor,
                        )),
                    DashboardText.sliderText("Coming Soon..."),
                    SliderWidget(
                      item: convertSnapshotsToWidgets(ads),
                    ),
                  ],
                ),
              );
            } else if (snpshot.hasError) {
              return Text('Erorr${snpshot.error}');
            } else {
              return const Text("somthing went wrong");
            }
          } else if (snpshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else {
            return const Text("somthing went wrong");
          }
        });
  }
}
