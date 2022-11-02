import 'package:dev_widgets/src/group.dart';

import 'package:flutter/material.dart';

abstract class Tool {
  ///Used to be a unique identifier in the application and open the tool via command-line.
  final String name;
  final IconData icon;
  final String fullTitle;
  final String shortTitle;
  final String description;
  final Group group;
  final String route;
  final Widget page;

  const Tool(
      {required this.icon,
      required this.fullTitle,
      required this.description,
      required this.group,
      required this.route,
      required this.name,
      required this.shortTitle,
      required this.page});
}
