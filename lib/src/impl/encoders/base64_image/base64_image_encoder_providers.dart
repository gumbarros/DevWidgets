import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screenshot/screenshot.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'dart:io' as io;

void downloadImage(BuildContext context, WidgetRef ref) async {
  var docsFolder =
      (await path_provider.getApplicationDocumentsDirectory()).path;

  var devWidgetsFolder = path.join(docsFolder, 'DevWidgets');

  await ref.read(screenshotControllerProvider).captureAndSave(devWidgetsFolder,
      pixelRatio: 2.0, fileName: "DevWidgetsBase64Encoder_${DateTime.now()}");
}

void uploadImage(WidgetRef ref) async {
  final result = await FilePicker.platform.pickFiles(type: FileType.image);

  if (result != null) {
    Uint8List? bytes;
    if (kIsWeb) {
      bytes = result.files.single.bytes;
    } else {
      final file = io.File(result.files.single.path!);
      bytes = await file.readAsBytes();
    }
    ref.read(outputImageProvider.notifier).state = bytes!;

    final text = const Base64Encoder().convert(bytes);

    ref.read(inputTextProvider.notifier).state = text;
  }
}

final inputTextProvider = StateProvider<String>((ref) => "");

final screenshotControllerProvider =
    Provider.autoDispose<ScreenshotController>((ref) => ScreenshotController());

final outputImageProvider = StateProvider<Uint8List>((ref) => Uint8List(0));
