import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/text/markdown_preview.dart';
import 'package:devtoys/presentation/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/markdown.dart';

class MarkdownPreviewController extends GetxController {
  final MarkdownPreviewTool tool;
  late CodeController inputController;
  Rx<String?> output = "".obs;

  MarkdownPreviewController(this.tool);

  @override
  void onInit() {
    inputController =
        CodeControllerFactory.getInstance(language: markdown, useWebFix: false);
    inputController.addListener(() {
      output.value = inputController.text;
    });
    super.onInit();
  }
}
