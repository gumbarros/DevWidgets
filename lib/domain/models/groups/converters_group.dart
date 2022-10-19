import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'group.dart';

class ConvertersGroup implements Group {
  static final ConvertersGroup _singleton = ConvertersGroup._internal();

  factory ConvertersGroup() {
    return _singleton;
  }

  ConvertersGroup._internal();

  @override
  IconData get icon => Icons.compare_arrows;

  @override
  String get name => "converters".tr;
}
