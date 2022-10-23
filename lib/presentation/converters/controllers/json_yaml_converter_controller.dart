import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/domain/models/tools/converters/json_yaml_conversion_type.dart';
import 'package:dev_widgets/domain/models/tools/converters/json_yaml_converter_tool.dart';
import 'package:dev_widgets/domain/models/tools/formatters/indentation.dart';
import 'package:dev_widgets/presentation/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/yaml.dart';
import 'package:highlight/languages/json.dart';

class JsonYamlConverterController extends GetxController {
  final JsonYamlConverterTool tool;

  final Rx<JsonYamlConversionType> conversionType =
      JsonYamlConversionType.jsonToYaml.obs;

  final CodeController jsonToYamlInputController =
      CodeControllerFactory.getInstance(language: json);

  final CodeController jsonToYamlOutputController =
      CodeControllerFactory.getInstance(language: yaml);

  final CodeController yamlToJsonInputController =
      CodeControllerFactory.getInstance(language: yaml);
  final CodeController yamlToJsonOutputController =
      CodeControllerFactory.getInstance(language: json);

  Rx<Indentation?> indentation = Indentation.fourSpaces.obs;
  Rx<bool> sortAlphabetically = false.obs;

  JsonYamlConverterController(this.tool);

  @override
  void onInit() {
    jsonToYamlInputController.addListener(regenerateJsonToYamlOutput);
    yamlToJsonInputController.addListener(regenerateYamlToJsonOutput);

    ever(conversionType, (_) => swapInputAndOutput());

    everAll(
        [indentation, sortAlphabetically], (_) => regenerateYamlToJsonOutput());

    super.onInit();
  }

  void regenerateJsonToYamlOutput() {
    try {
      jsonToYamlOutputController.text =
          tool.converter.convertJsonToYaml(jsonToYamlInputController.text);
    } catch (_) {
      //Bug on code_text_field package.
    }
  }

  void regenerateYamlToJsonOutput() {
    try {
      yamlToJsonOutputController.text = tool.converter.convertYamlToJson(
          yamlToJsonInputController.text,
          indentation: indentation.value,
          sortAlphabetically: sortAlphabetically.value);
    } catch (_) {
      //Bug on code_text_field package.
    }
  }

  swapInputAndOutput() {
    if (conversionType.value == JsonYamlConversionType.jsonToYaml) {
      jsonToYamlInputController.text = yamlToJsonOutputController.text;
    } else {
      yamlToJsonInputController.text = jsonToYamlOutputController.text;
    }
  }
}
