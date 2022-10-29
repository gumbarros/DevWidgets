import 'package:dev_widgets/src/group.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TextGroup implements Group {
  static const TextGroup _singleton = TextGroup._internal();

  factory TextGroup() {
    return _singleton;
  }

  const TextGroup._internal();

  @override
  IconData get icon => Icons.format_size;

  @override
  String get name => "text".tr();
}
