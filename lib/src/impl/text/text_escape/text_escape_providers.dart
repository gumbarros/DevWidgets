import 'package:dev_widgets/src/models/tools/text/text_escape/escape_conversion_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final escapeConversionModeProvider =
    StateProvider<EscapeConversionMode>((ref) => EscapeConversionMode.escape);
