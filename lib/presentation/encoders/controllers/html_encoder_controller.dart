import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/models/tools/encoders/encode_conversion_mode.dart';
import 'package:dev_widgets/src/models/tools/encoders/html_encoder_tool.dart';
import 'package:dev_widgets/src/widgets/io_editor/code_controller_factory.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:highlight/languages/xml.dart';

class HTMLEncoderController extends GetxController {
  final HtmlEncoderTool tool;
  late CodeController inputController;
  late CodeController outputController;

  Rx<EncodeConversionMode?> conversionMode = EncodeConversionMode.encode.obs;

  String? result;

  HTMLEncoderController(this.tool);

  @override
  void onInit() {
    inputController = CodeControllerFactory.getInstance(language: xml);

    outputController = CodeControllerFactory.getInstance(language: xml);

    inputController.addListener(regenerateOutput);

    ever(conversionMode, (_) {
      String input = inputController.text;
      String output = outputController.text;
      inputController.text = output;
      outputController.text = input;

      regenerateOutput();
    });
    super.onInit();
  }

  void regenerateOutput() {
    String result;

    if (conversionMode.value == EncodeConversionMode.encode) {
      result = tool.encoder.encode(inputController.text);
    } else {
      result = tool.encoder.decode(inputController.text);
    }

    try {
      outputController.text = result;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }
}
