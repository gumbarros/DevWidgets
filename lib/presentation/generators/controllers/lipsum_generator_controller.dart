import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/generators/lipsum_generator_tool.dart';
import 'package:devtoys/domain/models/tools/generators/lipsum_type.dart';
import 'package:devtoys/presentation/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/json.dart';

class LipsumGeneratorController extends GetxController {
  final LipsumGeneratorTool tool;
  late CodeController outputController;

  Rx<LipsumType?> lipsumType = LipsumType.words.obs;
  Rx<bool> startWithLorem = true.obs;
  Rx<int> count = 5.obs;

  LipsumGeneratorController(this.tool);

  /// Regenerates the lorem ipsum text with passed in params
  /// [lipsumType] [count] [startWithLorem]
  ///
  /// TODO: If the class fields are always up to date even when using a listener, these parameters could be removed
  /// and the fields could be used. I've never used Getx before but in e.g. React,
  /// the useState fields aren't updated until rebuild so you need to use the `prev` callback
  void _regenerateLipsum({
    required LipsumType lipsumType,
    required int count,
    required bool startWithLorem,
  }) {
    String generatedText = tool.generator.generate(
      type: lipsumType,
      count: count,
      startWithLorem: startWithLorem,
    );

    try {
      outputController.text = generatedText;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }

  @override
  void onInit() {
    outputController = CodeControllerFactory.getInstance(language: json);

    count.listen((newCount) {
      _regenerateLipsum(
        count: newCount,
        lipsumType: lipsumType.value!,
        startWithLorem: startWithLorem.value,
      );
    });

    lipsumType.listen((newType) {
      _regenerateLipsum(
        count: count.value,
        lipsumType: newType ?? LipsumType.words,
        startWithLorem: startWithLorem.value,
      );
    });

    startWithLorem.listen((newStart) {
      _regenerateLipsum(
        count: count.value,
        lipsumType: lipsumType.value!,
        startWithLorem: newStart,
      );
    });

    /// Generate initial text
    _regenerateLipsum(
      count: count.value,
      lipsumType: lipsumType.value!,
      startWithLorem: startWithLorem.value,
    );

    super.onInit();
  }
}
