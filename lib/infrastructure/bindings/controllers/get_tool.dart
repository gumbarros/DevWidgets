import 'package:dev_widgets/src/models/tool.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

T getTool<T>() {
  return Get.find<List<Tool>>()
      .firstWhere((element) => element.runtimeType == T) as T;
}
