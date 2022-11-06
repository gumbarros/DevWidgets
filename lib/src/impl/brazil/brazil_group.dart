import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../group.dart';

class BrazilGroup implements Group {
  const BrazilGroup() : super();

  @override
  IconData get icon => Icons.public;

  @override
  String get name => "brazil".tr();
}
