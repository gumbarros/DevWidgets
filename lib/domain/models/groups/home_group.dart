import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'category.dart';

class HomeGroup implements Group {
  static final HomeGroup _singleton = HomeGroup._internal();

  factory HomeGroup() {
    return _singleton;
  }

  HomeGroup._internal();

  @override
  IconData get icon => FontAwesomeIcons.house;

  @override
  String get name => "text".tr;
}
