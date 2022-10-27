import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedToolProvider = StateProvider<String>((ref) {
  return "home";
});
