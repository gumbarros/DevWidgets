import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'group.dart';

class TextGroup implements Group {
  static final TextGroup _singleton = TextGroup._internal();

  factory TextGroup() {
    return _singleton;
  }

  TextGroup._internal();

  @override
  IconData get icon => Icons.format_size;

  @override
  String get name => "text".tr();
}
