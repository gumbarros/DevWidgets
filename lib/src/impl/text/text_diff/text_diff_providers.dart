import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_diff_text/pretty_diff_text.dart';

final diffCleanupTypeProvider = StateProvider<DiffCleanupType>((ref) {
  return DiffCleanupType.EFFICIENCY;
});

final editCostProvider = StateProvider<int>((ref) {
  return 4;
});

final newTextProvider = StateProvider<String>((ref) {
  return "";
});

final oldTextProvider = StateProvider<String>((ref) {
  return "";
});
