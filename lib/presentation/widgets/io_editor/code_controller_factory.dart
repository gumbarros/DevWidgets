// ignore_for_file: depend_on_referenced_packages

import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/infrastructure/global_settings.dart';
import 'package:dev_widgets/presentation/widgets/io_editor/themes.dart';
import 'package:get/get.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_highlight/themes/vs.dart';

class CodeControllerFactory {
  static _getCodeControllerTheme() {
    final theme = GlobalSettings.getTextEditorTheme();

    if (theme == null) {
      return (Get.isDarkMode ? vs2015Theme : vsTheme);
    }

    return textEditorThemes[theme];
  }

  static CodeController getInstance(
          {required language, bool useWebFix = true}) =>
      CodeController(
          language: language,
          // ignore: deprecated_member_use
          theme: _getCodeControllerTheme(),
          webSpaceFix: useWebFix);
}
