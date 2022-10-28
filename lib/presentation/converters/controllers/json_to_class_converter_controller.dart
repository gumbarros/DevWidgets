import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/models/tools/converters/programming_language.dart';
import 'package:dev_widgets/src/models/tools/converters/json_to_class_converter_tool.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/json.dart';

class JsonToClassConverterController extends GetxController {
  final JsonToClassConverterTool tool;

  final Rx<ProgrammingLanguage> programmingLanguage =
      ProgrammingLanguage.dart.obs;
  final Rx<String> className = "Root".obs;
  final CodeController inputController =
      CodeControllerFactory.getInstance(language: json);
  final CodeController outputController =
      CodeControllerFactory.getInstance(language: dart);

  JsonToClassConverterController(this.tool);

  @override
  void onInit() {
    inputController.addListener(regenerateOutput);

    ever(className, (_) => regenerateOutput());

    super.onInit();
  }

  void regenerateOutput() {
    try {
      outputController.text = tool.converter.convert(inputController.text,
          className: className.value, language: programmingLanguage.value);
    } catch (_) {
      //Bug on code_text_field package.
    }
  }
}
