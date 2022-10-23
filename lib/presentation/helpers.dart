import 'package:dev_widgets/domain/models/described_enum.dart';
import 'package:dev_widgets/infrastructure/global_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<DropdownMenuItem<T>> getDropdownMenuItems<T extends DescribedEnum>(
    List<T> enums) {
  return enums
      .map((e) => DropdownMenuItem<T>(value: e, child: Text(e.description.tr)))
      .toList();
}

bool isCompactLayout(BuildContext context) => GlobalSettings.compactMode.value;
