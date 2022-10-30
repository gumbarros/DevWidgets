import 'package:dev_widgets/src/impl/described_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

List<DropdownMenuItem<T>> getDropdownMenuItems<T extends DescribedEnum>(
    List<T> enums) {
  return enums
      .map((e) => DropdownMenuItem<T>(
          value: e, child: Text(StringTranslateExtension(e.description).tr())))
      .toList();
}

const List<String> supportedFontFamilies = [
  "FiraCode",
  "Hack",
  "Monocraft",
  "JetBrains Mono"
];

const _middleDot = '·';

//See https://github.com/flutter/flutter/issues/77929
String applyWebSpaceFix(String string) {
  if (kIsWeb) return string.replaceAll(_middleDot, " ");
  return string;
}

copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: applyWebSpaceFix(text)));
}
