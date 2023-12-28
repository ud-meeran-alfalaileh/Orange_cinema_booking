import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/getx/movie_controller.dart';
import 'package:cinema_booking_app/src/model/movie_model.dart';
import 'package:cinema_booking_app/src/view/auth_wrapper.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/button_widget.dart';
import 'package:cinema_booking_app/src/widget/pages_widget/movies_widget/movie_video_widget.dart';
import 'package:cinema_booking_app/src/widget/text_widget/movie_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MovieController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: controller.getMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return Stack(
            children: [
              Form(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VideoWidget(videoId: movieModel.videoId),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.05 * screenHeight,
                              width: 0.9 * screenWidth,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movieModel.genre.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      width: 0.2 * screenWidth,
                                      child: Center(
                                        child: MovieText.yellowText(
                                            "${movieModel.genre[index]},"),
                                      ),
                                    );
                                  }),
                            ),
                            AppSizes.smallHeightSizedBox,
                            MovieText.whiteText(movieModel.movieName),
                            AppSizes.smallHeightSizedBox,
                            MovieText.yellowText("Duration"),
                            MovieText.whiteText(movieModel.duration),
                            AppSizes.smallHeightSizedBox,
                            MovieText.yellowText(movieModel.days),
                            SizedBox(
                              height: 0.05 * screenHeight,
                              width: 0.9 * screenWidth,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return AppSizes.smallWidthSizedBox;
                                  },
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: movieModel.showTime.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        width: 0.2 * screenWidth,
                                        height: 0.08 * screenHeight,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorConstant.mainTextColor),
                                        child: Center(
                                          child: MovieText.blackText(
                                              movieModel.showTime[index]),
                                        ));
                                  }),
                            ),
                            AppSizes.smallHeightSizedBox,
                            MovieText.yellowText("Cast"),
                            SizedBox(
                              height: 0.15 * screenHeight,
                              width: 0.5 * screenWidth,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: movieModel.cast.length,
                                itemBuilder: (context, index) {
                                  return MovieText.whiteText(
                                      "-${movieModel.cast[index]}");
                                },
                              ),
                            ),
                            AppSizes.smallHeightSizedBox,
                            MovieText.yellowText("Director"),
                            MovieText.whiteText(movieModel.director),
                            AppSizes.smallHeightSizedBox,
                            MovieText.yellowText("Synopsis"),
                            MovieText.whiteText(movieModel.synopsis),
                            AppSizes.largeHeightSizedBox,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: screenWidth,
                      child: ButtonWidget(
                          onTap: () {
                            Get.to(
                                AuthWrapper(
                                  movieModel: MovieModel(
                                      price: movieModel.price,
                                      director: movieModel.director,
                                      synopsis: movieModel.synopsis,
                                      cast: movieModel.cast,
                                      videoId: movieModel.videoId,
                                      image: movieModel.image,
                                      genre: movieModel.genre,
                                      duration: movieModel.duration,
                                      movieName: movieModel.movieName,
                                      days: movieModel.days,
                                      showTime: movieModel.showTime),
                                ),
                                transition: Transition.downToUp,
                                duration: const Duration(seconds: 1));
                          },
                          title: "Book Now")))
            ],
          );
        }
      },
    );
  }
}
