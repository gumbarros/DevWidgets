import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../group.dart';

class EncodersGroup implements Group {
  const EncodersGroup() : super();

  @override
  IconData get icon => Icons.percent;

  @override
  String get name => "encoders_decoders".tr();
}
