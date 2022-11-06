import 'package:dev_widgets/src/group.dart';
import 'package:flutter/material.dart';

class HomeGroup implements Group {
  const HomeGroup() : super();

  @override
  IconData get icon => Icons.house;

  @override
  String get name => "home";
}
