import 'package:dev_widgets/src/group.dart';
import 'package:flutter/material.dart';

class HomeGroup implements Group {
  static const HomeGroup _singleton = HomeGroup._internal();

  factory HomeGroup() {
    return _singleton;
  }

  const HomeGroup._internal();

  @override
  IconData get icon => Icons.house;

  @override
  String get name => "home";
}
