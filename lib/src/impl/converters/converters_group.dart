import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../group.dart';

class ConvertersGroup implements Group {
  const ConvertersGroup() : super();

  @override
  IconData get icon => Icons.compare_arrows;

  @override
  String get name => "converters".tr();
}
