import 'package:flutter/material.dart';

extension IconDataExtensions on IconData {
  bool isMaterialIcon() {
    return this.fontFamily == "MaterialIcons";
  }
}
