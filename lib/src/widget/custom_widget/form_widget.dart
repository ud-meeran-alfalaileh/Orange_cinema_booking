import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FormWidget extends StatefulWidget {
  FormWidget({required this.login, Key? key, required this.color})
      : super(key: key);
  Login login;
  Color color;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        child: TextFormField(
            cursorColor: ColorConstant.mainTextColor,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(color: ColorConstant.mainTextColor)),
            readOnly: widget.login.enableText,
            inputFormatters: widget.login.inputFormat,
            keyboardType: widget.login.type,
            onChanged: widget.login.onChange,
            validator: widget.login.validator,
            obscureText: widget.login.invisible,
            controller: widget.login.controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: ColorConstant.fadeColor,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorConstant.fadeColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstant.fadeColor),
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
                hintText: widget.login.hintText,
                hintStyle: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: ColorConstant.fadeColor, fontSize: 20)))),
      ),
    );
  }
}
