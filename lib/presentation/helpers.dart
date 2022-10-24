import 'package:dev_widgets/domain/models/described_enum.dart';
import 'package:dev_widgets/infrastructure/global_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

List<DropdownMenuItem<T>> getDropdownMenuItems<T extends DescribedEnum>(
    List<T> enums) {
  return enums
      .map((e) => DropdownMenuItem<T>(value: e, child: Text(e.description.tr)))
      .toList();
}

bool isCompactLayout(BuildContext context) => GlobalSettings.compactMode.value;

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

successSnackbar(String message) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar("success".tr, message,
        icon: const Icon(Icons.check), backgroundColor: Colors.green);
  }
}

copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: applyWebSpaceFix(text)));
  successSnackbar("copied_to_the_clipboard".tr);
}
