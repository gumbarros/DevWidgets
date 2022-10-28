import 'package:dev_widgets/src/models/tools/encoders/base64_encoding_type.dart';
import 'package:dev_widgets/src/models/tools/encoders/base64_text_encoder_tool.dart';
import 'package:dev_widgets/src/models/tools/encoders/encode_conversion_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class Base64TextEncoderController extends GetxController {
  final Base64TextEncoderTool tool;
  late TextEditingController inputController;
  late TextEditingController outputController;

  Rx<EncodeConversionMode?> conversionMode = EncodeConversionMode.encode.obs;
  Rx<Base64EncodingType?> encodingType = Base64EncodingType.ascii.obs;

  String? result;

  Base64TextEncoderController(this.tool);

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

    ever(encodingType, (_) {
      inputController.text = "";
      outputController.text = "";
    });

    super.onInit();
  }

  void regenerateOutput() {
    String result;

    if (conversionMode.value == EncodeConversionMode.encode) {
      result = tool.encoder
          .encode(inputController.text, encodingType: encodingType.value);
    } else {
      result = tool.encoder
          .decode(inputController.text, encodingType: encodingType.value);
    }

    try {
      outputController.text = result;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }
}
