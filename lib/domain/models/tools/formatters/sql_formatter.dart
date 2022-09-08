import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaru_icons/yaru_icons.dart';
import '../tool.dart';

class SqlFormatterTool implements Tool{
  @override
  IconData get icon => YaruIcons.network_cellular_connected;

  @override
  String get name => "sql_formatter".tr;
}