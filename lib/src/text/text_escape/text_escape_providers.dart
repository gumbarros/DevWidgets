import 'package:dev_widgets/src/text/text_escape/text_escape.dart' as escape;
import 'package:dev_widgets/src/text/text_escape/escape_conversion_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final escapeConversionModeProvider = StateProvider<EscapeConversionMode>((ref) {
  return EscapeConversionMode.escape;
});

final inputControllerProvider =
    StateProvider.autoDispose<TextEditingController>((ref) {
  final inputController = TextEditingController();

  final escapeConversionMode = ref.watch(escapeConversionModeProvider);

  inputController.addListener(() {
    String result;

    if (escapeConversionMode == EscapeConversionMode.escape) {
      result = escape.escape(inputController.text);
    } else {
      result = escape.unescape(inputController.text);
    }

    ref.read(outputControllerProvider.notifier).state =
        TextEditingController(text: result);
  });

  return inputController;
});

final outputControllerProvider =
    StateProvider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
