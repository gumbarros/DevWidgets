import 'package:devtoys/presentation/global_settings.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyleFromSettings() =>
    GoogleFonts.getFont(GlobalSettings.getTextEditorFontFamily(),
        textStyle: TextStyle(
            fontSize: GlobalSettings.getTextEditorFontSize(),
            color: Get.theme.textTheme.bodyMedium!.color,
            inherit: false,
            textBaseline: TextBaseline.alphabetic));
