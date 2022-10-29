import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/models/tools/formatters/indentation.dart';
import 'package:dev_widgets/src/models/tools/formatters/xml_formatter_tool.dart';
import 'package:dev_widgets/src/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:highlight/languages/xml.dart';

class XMLFormatterController extends GetxController {
  final XmlFormatterTool tool;
  late CodeController inputController;
  late CodeController outputController;

  Rx<Indentation?> indentation = Indentation.fourSpaces.obs;

  String? result;

  XMLFormatterController(this.tool);

  @override
  void onInit() {
    inputController = CodeControllerFactory.getInstance(language: xml);

    outputController = CodeControllerFactory.getInstance(language: xml);

    inputController.addListener(regenerateOutput);

    ever(indentation, (_) => regenerateOutput());

    super.onInit();
  }

  regenerateOutput() {
    var formattedText = tool.formatter
        .format(inputController.text, indentation: indentation.value!);

    try {
      outputController.text = formattedText;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }
}
