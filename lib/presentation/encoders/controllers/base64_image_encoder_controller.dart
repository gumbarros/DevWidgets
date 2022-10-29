import 'package:dev_widgets/src/impl/presentation/helpers.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';
import 'package:dev_widgets/src/models/tools/encoders/base64_image_encoder_tool.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'dart:io' as io;

class Base64ImageEncoderController extends GetxController {
  final Base64ImageEncoderTool tool;

  late TextEditingController inputController;
  final ScreenshotController screenshotController = ScreenshotController();

  Base64ImageEncoderController(this.tool);

  Rx<Uint8List> imageBytes = (Uint8List(0)).obs;

  @override
  void onInit() {
    inputController = TextEditingController();

    inputController.addListener(regenerateImage);

    super.onInit();
  }

  void regenerateImage() {
    try {
      imageBytes.value = tool.encoder.decode(inputController.text);
    } catch (_) {
      //Bug on code_text_field package.
    }
  }

  void uploadImage() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      Uint8List? bytes;
      if (GetPlatform.isWeb) {
        bytes = result.files.single.bytes;
      } else {
        final file = io.File(result.files.single.path!);
        bytes = await file.readAsBytes();
      }
      imageBytes.value = bytes!;
      inputController.text = tool.encoder.encode(bytes);
    }
  }

  void downloadImage() async {
    var docsFolder =
        (await path_provider.getApplicationDocumentsDirectory()).path;

    var devWidgetsFolder = path.join(docsFolder, 'DevWidgets');

    await screenshotController.captureAndSave(devWidgetsFolder,
        pixelRatio: Get.pixelRatio,
        fileName: "DevWidgetsBase64Encoder_${DateTime.now()}");
    successSnackbar(StringTranslateExtension("file_saved_to_documents").tr());
  }
}
