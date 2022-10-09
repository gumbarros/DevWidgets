import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'group.dart';

class EncodersGroup implements Group {
  static final EncodersGroup _singleton = EncodersGroup._internal();

  factory EncodersGroup() {
    return _singleton;
  }

  EncodersGroup._internal();

  @override
  IconData get icon => FontAwesomeIcons.percent;

  @override
  String get name => "encoders_decoders".tr;
}