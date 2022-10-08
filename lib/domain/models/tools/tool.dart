import 'package:devtoys/domain/models/groups/group.dart';

import 'package:flutter/material.dart';

abstract class Tool {
  final IconData icon;
  final String homeTitle;
  final String menuName;
  final String description;
  final Group group;
  final String route;
  final String commandLineArgName;

  Tool(this.icon, this.homeTitle, this.description, this.group, this.route,
      this.commandLineArgName, this.menuName);
}
