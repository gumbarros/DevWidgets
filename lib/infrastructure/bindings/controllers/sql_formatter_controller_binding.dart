import 'package:devtoys/domain/models/tools/formatters/sql_formatter.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/tools/controllers/sql_formatter_controller.dart';
import 'package:get/get.dart';

class SQLFormatterBinding extends Bindings {
  @override
  void dependencies() {

    var tool = Get.find<List<Tool>>().firstWhere((element) => element.runtimeType == SQLFormatterTool) as SQLFormatterTool;

    Get.lazyPut<SQLFormatterController>(
      () => SQLFormatterController(tool)
    );
  }
}
