import 'package:dev_widgets/src/group.dart';

import 'package:flutter/material.dart';

abstract class Tool {
  ///Used to be a unique identifier in the application and open the tool via command-line.
  final String name;
  final IconData icon;
  final String homeTitle;
  final String menuTitle;
  final String description;
  final Group group;
  final String route;
  final Widget page;

  const Tool(this.icon, this.homeTitle, this.description, this.group,
      this.route, this.name, this.menuTitle, this.page);
}
