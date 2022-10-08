import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'group.dart';

class TextGroup implements Group {
  static final TextGroup _singleton = TextGroup._internal();

  factory TextGroup() {
    return _singleton;
  }

  TextGroup._internal();

  @override
  IconData get icon => FontAwesomeIcons.quoteRight;

  @override
  String get name => "text".tr;
}
