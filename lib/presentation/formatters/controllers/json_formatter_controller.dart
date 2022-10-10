import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/formatters/indentation.dart';
import 'package:devtoys/domain/models/tools/formatters/json_formatter.dart';
import 'package:devtoys/presentation/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/json.dart';

class JSONFormatterController extends GetxController {
  final JSONFormatterTool tool;
  late CodeController inputController;
  late CodeController outputController;

  Rx<Indentation?> indentation = Indentation.fourSpaces.obs;
  Rx<bool> sortAlphabetically = false.obs;

  String? result;

  JSONFormatterController(this.tool);

  @override
  void onInit() {
    inputController = CodeControllerFactory.getInstance(language: json);

    outputController = CodeControllerFactory.getInstance(language: json);

    inputController.addListener(() {
      var formattedText = tool.formatter.format(inputController.text,
          indentation: indentation.value!,
          sortAlphabetically: sortAlphabetically.value);

      try {
        outputController.text = formattedText;
      } catch (_) {
        //Bug on code_text_field package.
      }
    });
    super.onInit();
  }
}
