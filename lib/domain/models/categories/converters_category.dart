import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'category.dart';

class ConvertersCategory implements Category {

  static final ConvertersCategory _singleton = ConvertersCategory._internal();

  factory ConvertersCategory() {
    return _singleton;
  }

  ConvertersCategory._internal();

  @override
  IconData get icon => FontAwesomeIcons.box;

  @override
  String get name => "converters".tr;
}