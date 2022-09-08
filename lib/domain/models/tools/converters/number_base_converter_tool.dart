import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaru_icons/yaru_icons.dart';

class NumberBaseConverterTool implements Tool{
  @override
  IconData get icon => YaruIcons.network_cellular_connected;

  @override
  String get name => "number_base".tr;
}