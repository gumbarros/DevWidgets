import 'package:brazil/brazil.dart';
import 'package:dev_widgets/domain/models/tools/brazil/cpf_generator_tool.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CpfGeneratorController extends GetxController {
  final CpfTool tool;
  late TextEditingController generatorOutputController;
  late TextEditingController validatorInputController;

  RxInt count = 1.obs;
  RxBool format = true.obs;
  RxBool isCpfValid = false.obs;

  CpfGeneratorController(this.tool);

  void generateCpfs() {
    String result = "";

    for (int i = 0; i < count.value; i++) {
      String cpfs = generateCpf(isFormatted: format.value);
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
    validatorInputController = TextEditingController();

    validatorInputController.addListener(() {
      isCpfValid.value = validateCpf(validatorInputController.text);
    });

    super.onInit();
  }
}
