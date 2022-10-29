import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../group.dart';

class BrazilGroup implements Group {
  static const BrazilGroup _singleton = BrazilGroup._internal();

  factory BrazilGroup() => _singleton;

  const BrazilGroup._internal();

  @override
  IconData get icon => Icons.public;

  @override
  String get name => "brazil".tr();
}
