import 'package:dev_widgets/domain/models/tools/formatters/sql_formatter/sql_formatter_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/formatters/controllers/sql_formatter_controller.dart';
import 'package:get/get.dart';

class SQLFormatterControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<SqlFormatterTool>();

    Get.lazyPut<SqlFormatterController>(() => SqlFormatterController(tool));
  }
}
