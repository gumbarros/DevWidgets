import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'group.dart';

class HomeGroup implements Group {
  static final HomeGroup _singleton = HomeGroup._internal();

  factory HomeGroup() {
    return _singleton;
  }

  HomeGroup._internal();

  @override
  IconData get icon => Icons.house;

  @override
  String get name => "all_tools".tr();
}
