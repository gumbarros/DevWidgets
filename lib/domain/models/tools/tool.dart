import 'package:devtoys/domain/models/groups/group.dart';

import 'package:flutter/material.dart';

abstract class Tool {
  final IconData icon;
  final String title;
  final String description;
  final Group group;
  final String route;
  final String commandLineArgName;
  //TODO: searchTags

  Tool(this.icon, this.title, this.description, this.group, this.route,
      this.commandLineArgName);
}
