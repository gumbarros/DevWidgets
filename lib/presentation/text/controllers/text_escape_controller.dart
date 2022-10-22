import 'package:devtoys/domain/models/tools/text/text_escape/escape_conversion_mode.dart';
import 'package:devtoys/domain/models/tools/text/text_escape/text_escape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextEscapeController extends GetxController {
  final TextEscapeTool tool;
  late TextEditingController inputController;
  late TextEditingController outputController;

  Rx<EscapeConversionMode?> conversionMode = EscapeConversionMode.escape.obs;

  String? result;

  TextEscapeController(this.tool);

  @override
  void onInit() {
    inputController = TextEditingController();
    outputController = TextEditingController();

    inputController.addListener(regenerateOutput);

    ever(conversionMode, (_) {
      String input = inputController.text;
      String output = outputController.text;
      inputController.text = output;
      outputController.text = input;

      regenerateOutput();
    });

    super.onInit();
  }

  void regenerateOutput() {
    String result;

    if (conversionMode.value == EscapeConversionMode.escape) {
      result = tool.escaper.escape(inputController.text);
    } else {
      result = tool.escaper.unescape(inputController.text);
    }

    try {
      outputController.text = result;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }
}
