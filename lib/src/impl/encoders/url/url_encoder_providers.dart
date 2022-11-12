import 'package:dev_widgets/src/impl/encoders/encode_conversion_mode.dart';
import 'package:dev_widgets/src/impl/encoders/url/url_encoder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputTextProvider = StateProvider<String>((ref) => "");

final conversionModeProvider =
    StateProvider<ConversionMode>((ref) => ConversionMode.encode);

final outputTextProvider = StateProvider<String>((ref) {
  final conversionMode = ref.watch(conversionModeProvider);
  final inputText = ref.watch(inputTextProvider);

  if (conversionMode == ConversionMode.encode) {
    return encodeUrl(inputText);
  } else {
    return decodeUrl(inputText);
  }
});
