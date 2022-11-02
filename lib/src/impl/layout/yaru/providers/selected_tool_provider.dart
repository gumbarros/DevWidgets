import 'package:dev_widgets/src/impl/tools.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedToolProvider = StateProvider<Tool>((ref) {
  return getToolByName("home");
});
