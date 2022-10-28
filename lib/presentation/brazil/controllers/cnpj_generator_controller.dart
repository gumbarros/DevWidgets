import 'package:brazil/brazil.dart';
import 'package:dev_widgets/src/models/tools/brazil/cnpj_generator_tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class CnpjGeneratorController extends GetxController {
  final CnpjGeneratorTool tool;
  late TextEditingController generatorOutputController;

  RxInt count = 1.obs;
  RxBool format = true.obs;

  CnpjGeneratorController(this.tool);

  void generateCpfs() {
    String result = "";

    for (int i = 0; i < count.value; i++) {
      String cpfs = generateCnpj(isFormatted: format.value);
      result += "$cpfs\n";
    }
    try {
      generatorOutputController.text += result;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }

  @override
  void onInit() {
    generatorOutputController = TextEditingController();

    super.onInit();
  }
}
