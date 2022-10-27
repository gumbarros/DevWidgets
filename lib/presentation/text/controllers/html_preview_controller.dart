import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/models/tools/text/html_preview.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/xml.dart';

class HtmlPreviewController extends GetxController {
  final HtmlPreviewTool tool;
  late CodeController inputController;
  Rx<String> output = "".obs;

  HtmlPreviewController(this.tool);

  @override
  void onInit() {
    inputController =
        CodeControllerFactory.getInstance(language: xml, useWebFix: false);
    inputController.addListener(() {
      output.value = inputController.text;
    });
    super.onInit();
  }
}
