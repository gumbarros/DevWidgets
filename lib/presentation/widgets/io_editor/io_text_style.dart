import 'package:dev_widgets/infrastructure/global_settings.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

TextStyle getTextStyleFromSettings() => TextStyle(
    fontFamily: GlobalSettings.getTextEditorFontFamily(),
    fontSize: GlobalSettings.getTextEditorFontSize(),
    color: Get.theme.textTheme.bodyMedium!.color,
    inherit: false,
    textBaseline: TextBaseline.alphabetic);
