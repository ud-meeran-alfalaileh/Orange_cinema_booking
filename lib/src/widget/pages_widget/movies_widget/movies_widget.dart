import 'package:cinema_booking_app/src/getx/movie_controller.dart';
import 'package:cinema_booking_app/src/model/movie_model.dart';
import 'package:cinema_booking_app/src/view/movie_pages/movie_detail_page.dart';
import 'package:cinema_booking_app/src/widget/constant_widgets/sizes/sized_box.dart';
import 'package:cinema_booking_app/src/widget/text_widget/movie_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MovieController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: controller.getMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Container();
        } else {
          final movies = snapshot.data!;

          return Center(
            child: SizedBox(
              width: 0.95 * screenWidth,
              height: 0.9 * screenHeight,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final genre = List<String>.from(
                      movies[index]['Genre'],
                    );
                    final cast = List<String>.from(
                      movies[index]['Cast'],
                    );
                    final showTime = List<String>.from(
                      movies[index]['ShowTime'],
                    );
                    final director = movies[index]["Director"];
                    final duration = movies[index]["Duration"];
                    final synopsis = movies[index]["Synopsis"];
                    final movieName = movies[index]["MovieName"];
                    final image = movies[index]["poster"];
                    final days = movies[index]["Days"];
                    final video = movies[index]["VideoId"];
                    final price = movies[index]["price"];

                    return GestureDetector(
                      onTap: () {
                        Get.to(MovieDetailPage(
                            movieModel: MovieModel(
                                director: director,
                                price: price,
                                synopsis: synopsis,
                                cast: cast,
                                image: image,
                                genre: genre,
                                duration: duration,
                                movieName: movieName,
                                showTime: showTime,
                                days: days,
                                videoId: video)));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 0.4 * screenWidth,
                            height: 0.3 * screenHeight,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover)),
                          ),
                          AppSizes.smallWidthSizedBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSizes.mediumHeightSizedBox,
                              SizedBox(
                                width: 0.5 * screenWidth,
                                child: MovieText.mainText(movieName),
                              ),
                              SizedBox(
                                height: 0.05 * screenHeight,
                                width: 0.5 * screenWidth,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: genre.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width: 0.2 * screenWidth,
                                        child: MovieText.fadeText(
                                          genre[index],
                                        ),
                                      );
                                    }),
                              ),
                              MovieText.fadeText(
                                "RUNNING TIME: $duration",
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return AppSizes.mediumHeightSizedBox;
                  },
                  itemCount: movies.length),
            ),
          );
        }
      },
    );
  }

  // Row movieContainer(BuildContext context, List<Map<String, dynamic>> movies, int index, List<String> genre,String imge) {
  //    final screenWidth = MediaQuery.of(context).size.width;
  //   final screenHeight = MediaQuery.of(context).size.height;
  //   return Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Container(
  //                       width: 0.4 * screenWidth,
  //                       height: 0.3 * screenHeight,
  //                       decoration: BoxDecoration(
  //                           image: DecorationImage(
  //                               image: NetworkImage(imge),
  //                               fit: BoxFit.cover)),
  //                     ),
  //                     AppSizes.smallWidthSizedBox,
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         AppSizes.mediumHeightSizedBox,
  //                         SizedBox(
  //                           width: 0.5 * screenWidth,
  //                           child: MovieText.mainText(
  //                               movies[index]["MovieName"]),
  //                         ),
  //                         SizedBox(
  //                           height: 0.05 * screenHeight,
  //                           width: 0.5 * screenWidth,
  //                           child: ListView.builder(
  //                               scrollDirection: Axis.horizontal,
  //                               itemCount: genre.length,
  //                               itemBuilder: (context, index) {
  //                                 return SizedBox(
  //                                   width: 0.15 * screenWidth,
  //                                   child: Center(
  //                                     child: MovieText.fadeText(
  //                                       genre[index],
  //                                     ),
  //                                   ),
  //                                 );
  //                               }),
  //                         ),
  //                         MovieText.fadeText(
  //                           "RUNNING TIME: ${movies[index]["Duration"]}",
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 );
  // }
}
