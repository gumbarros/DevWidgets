import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/text/escape_conversion_mode.dart';
import 'package:devtoys/domain/models/tools/text/text_escape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_highlight/themes/vs.dart';

class TextEscapeController extends GetxController {
  final TextEscapeTool tool;
  late TextEditingController inputController;
  late TextEditingController outputController;

  Rx<EscapeConversionMode?> conversionMode = EscapeConversionMode.Escape.obs;

  String? result;

  TextEscapeController(this.tool);

  @override
  void onInit() {
    inputController =
        CodeController(theme: Get.isDarkMode ? vs2015Theme : vsTheme);

    outputController =
        CodeController(theme: Get.isDarkMode ? vs2015Theme : vsTheme);

    inputController.addListener(() {
      String result;

      if (conversionMode.value == EscapeConversionMode.Escape) {
        result = tool.escaper.escape(inputController.text);
      } else {
        result = tool.escaper.unescape(inputController.text);
      }

      outputController.text = result;
    });
    super.onInit();
  }
}
