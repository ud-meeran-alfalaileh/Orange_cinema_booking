class MovieModel {
  String movieName;
  String duration;
  List<String> showTime;
  List<String> cast;
  List<String> genre;
  String director;
  String synopsis;
  String image;
  int price;
  String days;
  String videoId;

  MovieModel(
      {required this.director,
      required this.synopsis,
      required this.cast,
      required this.price,
      required this.videoId,
      required this.image,
      required this.genre,
      required this.duration,
      required this.movieName,
      required this.days,
      required this.showTime});

  toJason() {
    return {
      "Director": director,
      "Synopsis": synopsis,
      "Cast": cast,
      "price": price,
      "Genre": genre,
      "Duration": duration,
      "MovieName": movieName,
      "poster": image,
      "ShowTime": showTime
    };
  }

  // factory MovieModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
  //   final data = documentSnapshot.data()!;
  //   return MovieModel(
  //       director: data["Director"],
  //       synopsis: data["Synopsis"],
  //       cast: data["Cast"],
  //       image: data["poster"],
  //       videoId: data["VideoId"],
  //       genre: data["Genre"],
  //       duration: data["Dur"],
  //       movieName: data["MovieName"],
  //       showTime: data["ShowTime"],
  //       days: data["Days"]);
  // }
}
