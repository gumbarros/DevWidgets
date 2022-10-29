import 'package:dev_widgets/src/encoders/base64_image/base64_image_encoder_providers.dart';
import 'package:dev_widgets/src/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/widgets/io_editor/io_editor.dart';
import 'package:dev_widgets/src/widgets/io_editor/io_toolbar.dart';
import 'package:dev_widgets/src/widgets/io_editor/output_editor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:screenshot/screenshot.dart';

class Base64ImageEncoderPage extends ConsumerWidget {
  const Base64ImageEncoderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: DefaultAppBar(title: "base64_image_encoder".tr()),
        body: SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: IOEditor(
                  usesCodeControllers: false,
                  inputController: ref.watch(inputControllerProvider),
                  outputChild: Column(
                    children: [
                      IOToolbar(
                        title: "output".tr(),
                        actions: [
                          ElevatedButton.icon(
                              onPressed: () => uploadImage(ref),
                              icon: const Icon(Icons.image),
                              label: Text(
                                StringTranslateExtension("upload_image").tr(),
                              )),
                          Visibility(
                            visible: !kIsWeb,
                            child: ElevatedButton.icon(
                                onPressed: () => downloadImage(ref),
                                icon: const Icon(Icons.download),
                                label: Text("download_image".tr())),
                          )
                        ],
                      ),
                      OutputEditor(
                          outputController: TextEditingController(),
                          outputChild: Screenshot(
                            controller: ref.watch(screenshotControllerProvider),
                            child: Image.memory(
                              ref.watch(outputImageProvider),
                              errorBuilder: ((_, __, ___) =>
                                  const SizedBox.shrink()),
                            ),
                          ),
                          usesCodeControllers: false,
                          isVerticalLayout: false),
                    ],
                  )),
            )));
  }
}
