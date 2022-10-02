import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/encoders/encode_conversion_mode.dart';
import 'package:devtoys/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/xml.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_highlight/themes/vs.dart';

class HTMLEncoderController extends GetxController {
  final HtmlEncoderTool tool;
  late CodeController inputController;
  late CodeController outputController;

  Rx<EncodeConversionMode?> conversionMode = EncodeConversionMode.Decode.obs;
  Rx<bool> sortAlphabetically = false.obs;

  String? result;

  HTMLEncoderController(this.tool);

  @override
  void onInit() {
    inputController = CodeController(
        language: xml, theme: Get.isDarkMode ? vs2015Theme : vsTheme);

    outputController = CodeController(
        language: xml, theme: Get.isDarkMode ? vs2015Theme : vsTheme);

    inputController.addListener(() {
      String result;

      if (conversionMode.value == EncodeConversionMode.Encode) {
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
    super.onInit();
  }
}
