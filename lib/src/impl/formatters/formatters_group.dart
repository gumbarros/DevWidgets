import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../group.dart';

class FormattersGroup implements Group {
  const FormattersGroup() : super();

  @override
  IconData get icon => Icons.notes;

  @override
  String get name => "formatters".tr();
}
