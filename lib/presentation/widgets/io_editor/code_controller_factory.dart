import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/presentation/global_settings.dart';
import 'package:devtoys/presentation/widgets/io_editor/themes.dart';
import 'package:get/get.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_highlight/themes/vs.dart';

class CodeControllerFactory {
  static _getCodeControllerTheme() {
    var settingsRx = GlobalSettings.getTextEditorTheme();

    if (settingsRx == null) {
      return (Get.isDarkMode ? vs2015Theme : vsTheme);
    }

    return kTextEditorThemes[settingsRx];
  }

  static CodeController getInstance(
      {required language, bool useWebFix = true}) {
    return CodeController(
        language: language,
        theme: _getCodeControllerTheme(),
        webSpaceFix: useWebFix);
  }
}
