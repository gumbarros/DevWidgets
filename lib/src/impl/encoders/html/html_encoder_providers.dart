import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/encoders/base64_text/base64_encoding_type.dart';
import 'package:dev_widgets/src/impl/encoders/encode_conversion_mode.dart';
import 'package:dev_widgets/src/impl/encoders/html/html_encoder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/xml.dart';

final inputTextProvider = StateProvider<String>((ref) => "");

final conversionModeProvider =
    StateProvider<ConversionMode>((ref) => ConversionMode.encode);

final encodingTypeProvider =
    StateProvider<Base64EncodingType>((ref) => Base64EncodingType.utf8);

final inputControllerProvider = StateProvider.autoDispose<CodeController>((ref) {
  final controller = CodeController(language: xml);

  controller.addListener(() {
    ref.read(inputTextProvider.notifier).state = controller.text;
  });

  return controller;
});

final outputTextProvider = StateProvider<String>((ref) {
  final conversionMode = ref.watch(conversionModeProvider);

  final inputText = ref.watch(inputTextProvider);

  if (conversionMode == ConversionMode.encode) {
    return encodeHtml(inputText);
  } else {
    return decodeHtml(inputText);
  }
});
