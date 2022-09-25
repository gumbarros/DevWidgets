import 'package:devtoys/domain/models/groups/category.dart';
import 'package:devtoys/domain/models/groups/encoders_group.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../tool.dart';

class HtmlEncoderTool implements Tool {
  @override
  IconData get icon => Icons.code;

  @override
  String get name => "html_encoder".tr;

  @override
  String get route => Routes.htmlEncoder;

  @override
  String get description => "html_encoder_description".tr;

  @override
  Group get group => EncodersGroup();
}
