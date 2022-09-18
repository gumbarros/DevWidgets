import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/formatters/sql_formatter.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/sql.dart';
import 'package:flutter_highlight/themes/vs2015.dart';

class SQLFormatterController extends GetxController {

  final SQLFormatterTool tool;
  late CodeController inputController;
  late CodeController resultController;
  String? result;

  SQLFormatterController(this.tool);

  @override
  void onInit()
  {
    inputController = CodeController(
      language: sql,
      theme: vs2015Theme
    );

    resultController = CodeController(
      language: sql,
      theme: vs2015Theme
    );

    inputController.addListener(() {
        try {
          resultController.text = tool.formatter.format(inputController.text);
        } catch(_){
          //Bug on code_text_field package.
        }
    });
    super.onInit();
  }
}
