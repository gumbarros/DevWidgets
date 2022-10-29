import 'package:dev_widgets/src/impl/presentation/helpers.dart';
import 'package:flutter/material.dart';
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

final newTextControllerProvider = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();

  controller.addListener(() {
    ref.read(newTextProvider.notifier).state =
        applyWebSpaceFix(controller.text);
  });

  return controller;
});

final oldTextControllerProvider = StateProvider<TextEditingController>((ref) {
  final controller = TextEditingController();

  controller.addListener(() {
    ref.read(oldTextProvider.notifier).state =
        applyWebSpaceFix(controller.text);
  });

  return controller;
});
