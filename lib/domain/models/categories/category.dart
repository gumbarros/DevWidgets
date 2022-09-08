
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';

abstract class Category{
  final IconData icon;
  final String name;
  final List<Tool> tools;
  
  Category(this.name,this.icon, this.tools);
}