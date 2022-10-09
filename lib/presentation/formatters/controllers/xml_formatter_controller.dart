import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/formatters/indentation.dart';
import 'package:devtoys/domain/models/tools/formatters/xml_formatter.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/xml.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_highlight/themes/vs.dart';

class XMLFormatterController extends GetxController {
  final XmlFormatterTool tool;
  late CodeController inputController;
  late CodeController outputController;

  Rx<Indentation?> indentation = Indentation.fourSpaces.obs;

  String? result;

  XMLFormatterController(this.tool);

  @override
  void onInit() {
    inputController = CodeController(
        language: xml, theme: Get.isDarkMode ? vs2015Theme : vsTheme);

    outputController = CodeController(
        language: xml, theme: Get.isDarkMode ? vs2015Theme : vsTheme);

    inputController.addListener(() {
      var formattedText = tool.formatter
          .format(inputController.text, indentation: indentation.value!);

      try {
        outputController.text = formattedText;
      } catch (_) {
        //Bug on code_text_field package.
      }
    });
    super.onInit();
  }
}
