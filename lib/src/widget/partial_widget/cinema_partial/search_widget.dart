// ignore: must_be_immutable
import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/getx/cinema_controller.dart';
import 'package:cinema_booking_app/src/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget(
      {this.ontap, required this.search, required this.color, Key? key})
      : super(key: key);
  final SearchModel search;
  final Color color;
  final VoidCallback? ontap;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = Get.put(CinemaController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorConstant.mainScaffoldBackgroundColor,
        )),
        child: TextFormField(
            style: GoogleFonts.roboto(
              textStyle: TextStyle(color: ColorConstant.mainTextColor),
            ),
            onTap: widget.ontap,
            cursorColor: Colors.white,
            keyboardType: widget.search.type,
            onChanged: widget.search.onChange,
            controller: widget.search.searchController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle: TextStyle(color: ColorConstant.mainTextColor),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.color,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              prefixIcon: widget.search.icon,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.color),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              prefixIconColor: ColorConstant.mainTextColor,
              hintText: widget.search.hintText,
            )),
      ),
    );
  }
}
