import 'package:devtoys/domain/models/groups/category.dart';
import 'package:flutter/material.dart';

abstract class Tool {
  final IconData icon;
  final String name;
  final String description;
  final Group group;
  final String route;

  //TODO: searchTags

  Tool(this.icon, this.name, this.description, this.group, this.route);
}
