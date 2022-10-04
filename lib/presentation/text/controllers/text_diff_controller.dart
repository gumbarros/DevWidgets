import 'package:devtoys/domain/models/tools/text/text_diff_tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_diff_text/pretty_diff_text.dart';

class TextDiffController extends GetxController {
  final TextDiffTool tool;

  late TextEditingController oldTextController;
  late TextEditingController newTextController;

  Rx<DiffCleanupType?> diffCleanupType = DiffCleanupType.SEMANTIC.obs;
  Rx<int> editCost = 4.obs;
  Rx<String> oldText = "".obs;
  Rx<String> newText = "".obs;

  TextDiffController(this.tool);

  @override
  void onInit() {
    oldTextController = TextEditingController();
    oldTextController.addListener(() {
      oldText.value = oldTextController.text;
    });

    newTextController = TextEditingController();
    newTextController.addListener(() {
      newText.value = newTextController.text;
    });
    super.onInit();
  }
}
