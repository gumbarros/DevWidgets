import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/formatters/indentation.dart';
import 'package:devtoys/domain/models/tools/formatters/json_formatter.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/json.dart';
import 'package:flutter_highlight/themes/vs2015.dart';

class JSONFormatterController extends GetxController {
  final JSONFormatterTool tool;
  late CodeController inputController;
  late CodeController outputController;

  Rx<Indentation> indentation = Indentation.FourSpaces.obs;
  Rx<bool> sortAlphabetically = false.obs;

  String? result;

  JSONFormatterController(this.tool);

  @override
  void onInit() {
    inputController = CodeController(language: json, theme: vs2015Theme);

    outputController = CodeController(language: json, theme: vs2015Theme);

    inputController.addListener(() {
      var formattedText = tool.formatter.format(inputController.text,
          indentation: indentation.value,
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
