import 'package:devtoys/domain/helpers/encoders/base_64_text_encoder.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/encoders_group.dart';
import 'package:devtoys/domain/models/tools/encoders/encoder_tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../tool.dart';

class Base64TextEncoderTool extends EncoderTool implements Tool {
  Base64TextEncoderTool(this.encoder) : super(encoder);

  @override
  IconData get icon => FontAwesomeIcons.hashtag;

  @override
  String get homeTitle => "base64_text_encoder".tr;

  @override
  String get route => Routes.base64TextEncoder;

  @override
  String get description => "base64_text_encoder_description".tr;

  @override
  Group get group => EncodersGroup();

  @override
  String get commandLineArgName => "base64text";

  @override
  String get menuName => "base64_text_encoder_menu_name".tr;

  @override
  final Base64TextEncoder encoder;
}
