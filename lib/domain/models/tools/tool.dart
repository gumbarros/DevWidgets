import 'package:devtoys/domain/models/categories/category.dart';
import 'package:flutter/material.dart';

abstract class Tool{
  final IconData icon;
  final String name;
  final String description;
  final Category category; 
  final String route;


  //TODO: searchTags

  Tool(this.icon, this.name,this.description,this.category, this.route);
}