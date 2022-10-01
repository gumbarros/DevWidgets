import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/formatters/indentation.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/xml.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_highlight/themes/vs.dart';

class HTMLEncoderController extends GetxController {
  final HtmlEncoderTool tool;
  late CodeController inputController;
  late CodeController outputController;

  Rx<Indentation> indentation = Indentation.FourSpaces.obs;
  Rx<bool> sortAlphabetically = false.obs;

  String? result;

  HTMLEncoderController(this.tool);

  @override
  void onInit() {
    inputController = CodeController(theme: Get.isDarkMode ? vs2015Theme : vsTheme);

    outputController = CodeController(
        language: xml, theme: Get.isDarkMode ? vs2015Theme : vsTheme);

    inputController.addListener(() {
      var formattedText = tool.encoder.encode("");

      try {
        outputController.text = formattedText;
      } catch (_) {
        //Bug on code_text_field package.
      }
    });
    super.onInit();
  }
}
