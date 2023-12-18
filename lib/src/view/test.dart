// // // // ignore: must_be_immutable
// // // import 'package:cinema_booking_app/src/constant/color.dart';
// // // import 'package:cinema_booking_app/src/model/search_model.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_fonts/google_fonts.dart';

// // // class Cinema {
// // //   final String name;
// // //   final String location;

// // //   Cinema({required this.name, required this.location});
// // // }

// // // class CinemaService {
// // //   final CollectionReference cinemas =
// // //       FirebaseFirestore.instance.collection('cinemas');

// // //   Future<List<Cinema>> searchCinemas(String keyword) async {
// // //     QuerySnapshot querySnapshot =
// // //         await cinemas.where('name', isGreaterThanOrEqualTo: keyword).get();
// // //     return querySnapshot.docs.map((doc) {
// // //       return Cinema(
// // //         name: doc['name'],
// // //         location: doc['location'],
// // //       );
// // //     }).toList();
// // //   }
// // // }

// // // class testWidget extends StatefulWidget {
// // //   const testWidget({required this.search, Key? key}) : super(key: key);
// // //   final SearchModel search;

// // //   @override
// // //   State<testWidget> createState() => _testWidgetState();
// // // }

// // // class _testWidgetState extends State<testWidget> {
// // //   final CinemaService _cinemaService = CinemaService();
// // //   List<Cinema> _searchResults = [];

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Center(
// // //       child: Theme(
// // //         data: Theme.of(context).copyWith(
// // //             inputDecorationTheme: InputDecorationTheme(
// // //           filled: true,
// // //           fillColor: ColorConstant.mainScaffoldBackgroundColor,
// // //         )),
// // //         child: Column(
// // //           children: [
// // //             TextFormField(
// // //               style: GoogleFonts.roboto(
// // //                 textStyle: TextStyle(color: ColorConstant.mainTextColor),
// // //               ),
// // //               cursorColor: Colors.white,
// // //               keyboardType: widget.search.type,
// // //               onChanged: (keyword) async {
// // //                 List<Cinema> results =
// // //                     await _cinemaService.searchCinemas(keyword);
// // //                 setState(() {
// // //                   _searchResults = results;
// // //                 });
// // //               },
// // //               controller: widget.search.searchController,
// // //               decoration: InputDecoration(
// // //                 floatingLabelBehavior: FloatingLabelBehavior.always,
// // //                 floatingLabelStyle:
// // //                     TextStyle(color: ColorConstant.mainTextColor),
// // //                 focusedBorder: OutlineInputBorder(
// // //                     borderSide: BorderSide(
// // //                       color: Colors.grey[200]!,
// // //                     ),
// // //                     borderRadius: const BorderRadius.all(Radius.circular(20))),
// // //                 prefixIcon: widget.search.icon,
// // //                 enabledBorder: OutlineInputBorder(
// // //                     borderSide: BorderSide(
// // //                         color: ColorConstant.mainScaffoldBackgroundColor),
// // //                     borderRadius: const BorderRadius.all(Radius.circular(20))),
// // //                 prefixIconColor: ColorConstant.mainTextColor,
// // //                 hintText: widget.search.hintText,
// // //               ),
// // //             ),
// // //             Expanded(
// // //               child: ListView.builder(
// // //                 itemCount: _searchResults.length,
// // //                 itemBuilder: (context, index) {
// // //                   Cinema cinema = _searchResults[index];
// // //                   return ListTile(
// // //                     title: Text(cinema.name),
// // //                     subtitle: Text(cinema.location),
// // //                     // Add onTap or any other interactions you want
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';

// // class CinemasSearchScreen extends StatefulWidget {
// //   @override
// //   _CinemasSearchScreenState createState() => _CinemasSearchScreenState();
// // }

// // class _CinemasSearchScreenState extends State<CinemasSearchScreen> {
// //   TextEditingController _searchController = TextEditingController();
// //   QuerySnapshot? _searchResults;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Cinemas Search'),
// //       ),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: TextField(
// //               controller: _searchController,
// //               decoration: InputDecoration(
// //                 labelText: 'Search Cinemas',
// //                 suffixIcon: IconButton(
// //                   icon: Icon(Icons.search),
// //                   onPressed: () => _searchCinemas(),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Expanded(
// //             child: _buildSearchResults(),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _searchCinemas() async {
// //     String query = _searchController.text.trim();

// //     if (query.isNotEmpty) {
// //       QuerySnapshot snapshot = await FirebaseFirestore.instance
// //           .collection('cinemas')
// //           .where('name', isGreaterThanOrEqualTo: query)
// //           .get();

// //       setState(() {
// //         _searchResults = snapshot;
// //       });
// //     }
// //   }

// //   Widget _buildSearchResults() {
// //     if (_searchResults == null) {
// //       return Center(
// //         child: Text('Enter a search query'),
// //       );
// //     }

// //     if (_searchResults!.docs.isEmpty) {
// //       return Center(
// //         child: Text('No results found'),
// //       );
// //     }

// //     return ListView.builder(
// //       itemCount: _searchResults!.docs.length,
// //       itemBuilder: (context, index) {
// //         DocumentSnapshot cinema = _searchResults!.docs[index];
// //         return ListTile(
// //           title: Text(cinema['name']),
// //           subtitle: Text(cinema['address']),
// //           // Add more fields as needed
// //         );
// //       },
// //     );
// //   }
// // }
// import 'package:clippy_flutter/triangle.dart';
// import 'package:custom_info_window/custom_info_window.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() {
//   runApp(
//     MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CustomInfoWindowExample(),
//     );
//   }
// }

// class CustomInfoWindowExample extends StatefulWidget {
//   const CustomInfoWindowExample({super.key});

//   @override
//   _CustomInfoWindowExampleState createState() =>
//       _CustomInfoWindowExampleState();
// }

// class _CustomInfoWindowExampleState extends State<CustomInfoWindowExample> {
//   CustomInfoWindowController _customInfoWindowController =
//       CustomInfoWindowController();

//   final LatLng _latLng = LatLng(28.7041, 77.1025);
//   final double _zoom = 15.0;

//   @override
//   void dispose() {
//     _customInfoWindowController.dispose();
//     super.dispose();
//   }

//   Set<Marker> _markers = {};

//   @override
//   Widget build(BuildContext context) {
//     _markers.add(
//       Marker(
//         markerId: MarkerId("marker_id"),
//         position: _latLng,
//         onTap: () {
//           _customInfoWindowController.addInfoWindow!(
//             Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.account_circle,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             width: 8.0,
//                           ),
//                           Text(
//                             "I am here",
//                           )
//                         ],
//                       ),
//                     ),
//                     width: double.infinity,
//                     height: double.infinity,
//                   ),
//                 ),
//                 Triangle.isosceles(
//                   edge: Edge.BOTTOM,
//                   child: Container(
//                     color: Colors.blue,
//                     width: 20.0,
//                     height: 10.0,
//                   ),
//                 ),
//               ],
//             ),
//             _latLng,
//           );
//         },
//       ),
//     );
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Info Window Example'),
//         backgroundColor: Colors.red,
//       ),
//       body: Stack(
//         children: <Widget>[
//           GoogleMap(
//             onTap: (position) {
//               _customInfoWindowController.hideInfoWindow!();
//             },
//             onCameraMove: (position) {
//               _customInfoWindowController.onCameraMove!();
//             },
//             onMapCreated: (GoogleMapController controller) async {
//               _customInfoWindowController.googleMapController = controller;
//             },
//             markers: _markers,
//             initialCameraPosition: CameraPosition(
//               target: _latLng,
//               zoom: _zoom,
//             ),
//           ),
//           CustomInfoWindow(
//             controller: _customInfoWindowController,
//             height: 75,
//             width: 150,
//             offset: 50,
//           ),
//         ],
//       ),
//     );
//   }
// }
