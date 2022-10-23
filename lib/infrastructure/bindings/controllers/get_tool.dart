import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:get/get.dart';

T getTool<T>() {
  return Get.find<List<Tool>>()
      .firstWhere((element) => element.runtimeType == T) as T;
}
