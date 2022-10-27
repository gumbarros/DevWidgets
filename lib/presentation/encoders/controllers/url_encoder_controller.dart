import 'package:dev_widgets/src/models/tools/encoders/encode_conversion_mode.dart';
import 'package:dev_widgets/src/models/tools/encoders/url_encoder_tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UrlEncoderController extends GetxController {
  final UrlEncoderTool tool;
  late TextEditingController inputController;
  late TextEditingController outputController;

  Rx<EncodeConversionMode?> conversionMode = EncodeConversionMode.encode.obs;

  String? result;

  UrlEncoderController(this.tool);

  @override
  void onInit() {
    inputController = TextEditingController();

    outputController = TextEditingController();

    inputController.addListener(() {
      String result;

      if (conversionMode.value == EncodeConversionMode.encode) {
        result = tool.encoder.encode(inputController.text);
      } else {
        result = tool.encoder.decode(inputController.text);
      }

      try {
        outputController.text = result;
      } catch (_) {
        //Bug on code_text_field package.
      }
    });

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

    if (conversionMode.value == EncodeConversionMode.encode) {
      result = tool.encoder.encode(inputController.text);
    } else {
      result = tool.encoder.decode(inputController.text);
    }

    try {
      outputController.text = result;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }
}
