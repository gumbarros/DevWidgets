import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/models/tools/formatters/sql_formatter/sql_dialect.dart';
import 'package:dev_widgets/src/models/tools/formatters/sql_formatter/sql_formatter_tool.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:highlight/languages/sql.dart';

class SqlFormatterController extends GetxController {
  final SqlFormatterTool tool;
  late CodeController inputController;
  late CodeController outputController;
  String? result;

  final Rx<SqlDialect> dialect = SqlDialect.generic.obs;

  SqlFormatterController(this.tool);

  @override
  void onInit() {
    inputController = CodeControllerFactory.getInstance(language: sql);

    outputController = CodeControllerFactory.getInstance(language: sql);

    inputController.addListener(() {
      try {
        outputController.text =
            tool.formatter.format(inputController.text, dialect: dialect.value);
      } catch (_) {
        //Bug on code_text_field package.
      }
    });
    super.onInit();
  }
}
