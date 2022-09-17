import 'package:flutter/material.dart';

abstract class Category{
  final String name;
  final IconData icon;
  
  Category(this.name,this.icon);
}