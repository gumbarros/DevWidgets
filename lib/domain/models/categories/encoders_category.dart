import 'package:devtoys/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'category.dart';

class EncodersCategory implements Category{

  static final EncodersCategory _singleton = EncodersCategory._internal();

  factory EncodersCategory() {
    return _singleton;
  }

  EncodersCategory._internal();
  
  @override
  IconData get icon => FontAwesomeIcons.codepen;

  @override
  String get name => "encoders_decoders".tr;
}