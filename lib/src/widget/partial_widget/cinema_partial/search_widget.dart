// ignore: must_be_immutable
import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({required this.search, Key? key}) : super(key: key);
  final SearchModel search;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
        )),
        child: TextFormField(
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: ColorConstant.subTextColor),
            ),
            cursorColor: Colors.grey[700],
            keyboardType: widget.search.type,
            onChanged: widget.search.onChange,
            controller: widget.search.searchController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle:
                  TextStyle(color: ColorConstant.mainScaffoldBackgroundColor),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[200]!,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              prefixIcon: widget.search.icon,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              prefixIconColor: Colors.grey[700],
              hintText: widget.search.hintText,
            )),
      ),
    );
  }
}
