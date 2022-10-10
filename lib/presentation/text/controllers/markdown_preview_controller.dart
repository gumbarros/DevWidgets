import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/text/markdown_preview.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/markdown.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_highlight/themes/vs.dart';

class MarkdownPreviewController extends GetxController {
  final MarkdownPreviewTool tool;
  late CodeController inputController;
  Rx<String?> output = "".obs;

  MarkdownPreviewController(this.tool);

  @override
  void onInit() {
    inputController = CodeController(
        language: markdown,
        theme: Get.isDarkMode ? vs2015Theme : vsTheme,
        webSpaceFix: false);
    inputController.addListener(() {
      output.value = inputController.text;
    });
    super.onInit();
  }
}
