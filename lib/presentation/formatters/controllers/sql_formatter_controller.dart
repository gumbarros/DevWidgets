import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/formatters/sql_formatter.dart';
import 'package:devtoys/presentation/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/sql.dart';

class SQLFormatterController extends GetxController {
  final SQLFormatterTool tool;
  late CodeController inputController;
  late CodeController outputController;
  String? result;

  SQLFormatterController(this.tool);

  @override
  void onInit() {
    inputController = CodeControllerFactory.getInstance(language: sql);

    outputController = CodeControllerFactory.getInstance(language: sql);

    inputController.addListener(() {
      try {
        outputController.text = tool.formatter.format(inputController.text);
      } catch (_) {
        //Bug on code_text_field package.
      }
    });
    super.onInit();
  }
}
