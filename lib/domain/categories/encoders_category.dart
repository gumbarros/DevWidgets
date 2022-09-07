import 'package:devtoys/domain/tools/html_encoder_tool.dart';
import 'package:devtoys/domain/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category.dart';

class EncodersCategory implements Category{

  static final EncodersCategory _singleton = EncodersCategory._internal();

  factory EncodersCategory() {
    return _singleton;
  }

  EncodersCategory._internal();
  
  @override
  IconData get icon => Icons.abc;

  @override
  String get name => "encoders_decoders".tr;

  @override
  List<Tool> get tools => <Tool>[HtmlEncoderTool()];
}