import 'package:flutter/material.dart';

class SearchModel {
  TextEditingController? searchController = TextEditingController();
  String hintText;
  Icon icon;

  TextInputType type;
  void Function(String?)? onChange;

  SearchModel({
    this.searchController,
    required this.hintText,
    required this.icon,
    required this.type,
    required this.onChange,
  });
}
