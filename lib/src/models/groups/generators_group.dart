import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'group.dart';

class GeneratorsGroup implements Group {
  static final GeneratorsGroup _singleton = GeneratorsGroup._internal();

  factory GeneratorsGroup() {
    return _singleton;
  }

  GeneratorsGroup._internal();

  @override
  IconData get icon => Icons.copy;

  @override
  String get name => "generators".tr();
}
