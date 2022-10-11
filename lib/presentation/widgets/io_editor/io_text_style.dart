import 'package:devtoys/presentation/global_settings.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO: I need help, the font family is not applying because of Yaru theme.
TextStyle getTextStyleFromSettings() =>
    GoogleFonts.getFont(GlobalSettings.getTextEditorFontFamily(),
        fontSize: GlobalSettings.getTextEditorFontSize());
