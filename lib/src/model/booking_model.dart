class BookingModel {
  String movieNmae;
  String? userEmail;
  List<int> seats;
  String day;
  String time;
  String price;
  BookingModel(
      {required this.day,
      required this.movieNmae,
      required this.userEmail,
      required this.price,
      required this.seats,
      required this.time});

  toJson() {
    return {
      "movieName": movieNmae,
      "seats": seats,
      "day": day,
      "time": time,
      "price": price,
      "userEmail": userEmail,
    };
  }
}
