import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/domain/models/tools/generators/uuid_generator_tool.dart';
import 'package:devtoys/domain/models/tools/generators/uuid_type.dart';
import 'package:devtoys/presentation/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/json.dart';

class UuidGeneratorController extends GetxController {
  final UuidGeneratorTool tool;
  late CodeController outputController;

  Rx<UuidType?> uuidType = UuidType.v4.obs;
  Rx<bool> uppercase = false.obs;
  Rx<bool> hyphens = true.obs;
  Rx<int> count = 1.obs;

  UuidGeneratorController(this.tool);

  /// Generates [count] UUIDs with the specified settings and appends them to the output
  void generateUuid() {
    String result = "";

    for (int i = 0; i < count.value; i++) {
      String uuid = tool.generator.generate(
        type: uuidType.value!,
        uppercase: uppercase.value,
        hyphens: hyphens.value,
      );
      result += "$uuid\n";
    }

    try {
      outputController.text += result;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }

  @override
  void onInit() {
    outputController = CodeControllerFactory.getInstance(language: json);
    super.onInit();
  }
}
