import 'package:dev_widgets/src/group.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TextGroup implements Group {
  const TextGroup() : super();
  @override
  IconData get icon => Icons.format_size;

  @override
  String get name => "text".tr();
}
