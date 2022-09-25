import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'category.dart';

class FormattersGroup implements Group {
  static final FormattersGroup _singleton = FormattersGroup._internal();

  factory FormattersGroup() {
    return _singleton;
  }

  FormattersGroup._internal();

  @override
  IconData get icon => FontAwesomeIcons.box;

  @override
  String get name => "formatters".tr;
}
