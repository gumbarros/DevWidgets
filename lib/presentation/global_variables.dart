import 'package:devtoys/domain/models/tools/home_tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yaru/yaru.dart';

class GlobalVariables {
  static final Rx<bool> compactMode = false.obs;
  static final Rx<String> selectedToolName = (HomeTool).toString().obs;

  //TODO: private this variables and create a method to read only one time these values.

  static final Rx<ThemeMode> themeMode = (ThemeMode
          .values[GetStorage().read("themeMode") ?? ThemeMode.system.index])
      .obs;
  static final Rx<YaruVariant> yaruVariant =
      (GetStorage().read("yaruVariant") ?? YaruVariant.orange.obs);
}

const List<YaruVariant> yaruVariantList = [
  YaruVariant.orange,
  YaruVariant.sage,
  YaruVariant.bark,
  YaruVariant.olive,
  YaruVariant.viridian,
  YaruVariant.prussianGreen,
  YaruVariant.blue,
  YaruVariant.purple,
  YaruVariant.magenta,
  YaruVariant.red,
];
