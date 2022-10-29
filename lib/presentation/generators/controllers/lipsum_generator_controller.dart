import 'package:dev_widgets/src/generators/lipsum/lipsum_generator_tool.dart';
import 'package:dev_widgets/src/generators/lipsum/lipsum_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class LipsumGeneratorController extends GetxController {
  final LipsumGeneratorTool tool;
  late TextEditingController outputController;

  Rx<LipsumType?> lipsumType = LipsumType.words.obs;
  Rx<bool> startWithLorem = true.obs;
  Rx<int> count = 5.obs;

  LipsumGeneratorController(this.tool);

  void _regenerateLipsum() {
    String generatedText = tool.generator.generate(
      type: lipsumType.value ?? LipsumType.words,
      count: count.value,
      startWithLorem: startWithLorem.value,
    );

    try {
      outputController.text = generatedText;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }

  @override
  void onInit() {
    outputController = TextEditingController();

    everAll([startWithLorem, lipsumType, count], (_) => _regenerateLipsum());

    /// Generate initial text
    _regenerateLipsum();

    super.onInit();
  }
}
