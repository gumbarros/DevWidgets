import 'package:flutter/material.dart';

abstract class Group {
  final String name;
  final IconData icon;

  const Group(this.name, this.icon);
}
