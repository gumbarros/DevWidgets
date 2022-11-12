import 'package:dev_widgets/src/impl/formatters/indentation.dart';
import 'package:dev_widgets/src/impl/formatters/xml_formatter/xml_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indentationProvider = StateProvider<Indentation>((ref) {
  return Indentation.fourSpaces;
});
final inputTextProvider = StateProvider<String>((ref) => "");

final outputTextProvider = StateProvider<String>((ref) => formatXml(
    ref.watch(inputTextProvider),
    indentation: ref.watch(indentationProvider)));
