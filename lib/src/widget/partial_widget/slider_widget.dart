import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({required this.item, Key? key}) : super(key: key);
  final List<Widget> item;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.item,
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
        height: 580.0.h,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex.value = index;
          });
        },
      ),
    );
  }
}
