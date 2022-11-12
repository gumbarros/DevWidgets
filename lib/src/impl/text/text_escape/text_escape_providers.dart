import 'package:dev_widgets/src/impl/text/text_escape/text_escape.dart'
    as escape;
import 'package:dev_widgets/src/impl/text/text_escape/escape_conversion_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final escapeConversionModeProvider = StateProvider<EscapeConversionMode>((ref) {
  return EscapeConversionMode.escape;
});

final inputTextProvider = StateProvider((ref) => "");
final outputTextProvider = StateProvider((ref) {
  final inputText = ref.watch(inputTextProvider);
  final escapeConversionMode = ref.watch(escapeConversionModeProvider);

  if (escapeConversionMode == EscapeConversionMode.escape) {
    return escape.escape(inputText);
  } else {
    return escape.unescape(inputText);
  }
});
