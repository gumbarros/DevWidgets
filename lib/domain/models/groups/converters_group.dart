import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'category.dart';

class ConvertersGroup implements Group {
  static final ConvertersGroup _singleton = ConvertersGroup._internal();

  factory ConvertersGroup() {
    return _singleton;
  }

  ConvertersGroup._internal();

  @override
  IconData get icon => FontAwesomeIcons.box;

  @override
  String get name => "converters".tr;
}
