import 'package:devtoys/domain/models/tools/converters/cron_parser_tool.dart';
import 'package:devtoys/domain/models/tools/converters/json_yaml_converter_tool.dart';
import 'package:devtoys/domain/models/tools/converters/number_base_converter_tool.dart';
import 'package:devtoys/domain/models/tools/converters/timestamp_converter_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'category.dart';

class ConvertersCategory implements Category{

  static final ConvertersCategory _singleton = ConvertersCategory._internal();

  factory ConvertersCategory() {
    return _singleton;
  }

  ConvertersCategory._internal();
  
  @override
  IconData get icon => YaruIcons.network_cellular_connected;

  @override
  String get name => "converters".tr;

  @override
  List<Tool> get tools => [JsonYamlConverterTool(), CronParserTool(), NumberBaseConverterTool(), TimestampConverterTool()];
}