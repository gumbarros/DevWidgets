import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../group.dart';

class GeneratorsGroup implements Group {
  const GeneratorsGroup() : super();

  @override
  IconData get icon => Icons.copy;

  @override
  String get name => "generators".tr();
}
