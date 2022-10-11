import 'package:flutter/foundation.dart';

const kMiddleDot = '·';

//See https://github.com/flutter/flutter/issues/77929
String applyWebSpaceFix(String string) {
  if (kIsWeb) return string.replaceAll(kMiddleDot, " ");
  return string;
}
