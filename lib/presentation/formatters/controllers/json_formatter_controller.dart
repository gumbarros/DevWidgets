import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/domain/models/tools/formatters/indentation.dart';
import 'package:dev_widgets/domain/models/tools/formatters/json_formatter_tool.dart';
import 'package:dev_widgets/presentation/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/json.dart';

class JsonFormatterController extends GetxController {
  final JsonFormatterTool tool;
  late CodeController inputController;
  late CodeController outputController;

  Rx<Indentation?> indentation = Indentation.fourSpaces.obs;
  Rx<bool> sortAlphabetically = false.obs;

  String? result;

  JsonFormatterController(this.tool);

  @override
  void onInit() {
    inputController = CodeControllerFactory.getInstance(language: json);

    outputController = CodeControllerFactory.getInstance(language: json);

    inputController.addListener(regenerateOutput);

    everAll([indentation, sortAlphabetically], (_) => regenerateOutput());

    super.onInit();
  }

  void regenerateOutput() {
    var formattedText = tool.formatter.format(inputController.text,
        indentation: indentation.value!,
        sortAlphabetically: sortAlphabetically.value);

    try {
      outputController.text = formattedText;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }
}
