import 'package:dev_widgets/presentation/encoders/controllers/base64_image_encoder_controller.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_toolbar.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:screenshot/screenshot.dart';

class Base64ImageEncoderView extends GetView<Base64ImageEncoderController> {
  const Base64ImageEncoderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.homeTitle),
        body: SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: IOEditor(
                  usesCodeControllers: false,
                  inputController: controller.inputController,
                  outputChild: Column(
                    children: [
                      IOToolbar(
                        title: StringTranslateExtension("output").tr(),
                        actions: [
                          ElevatedButton.icon(
                              onPressed: controller.uploadImage,
                              icon: const Icon(Icons.image),
                              label: Text(
                                StringTranslateExtension("upload_image").tr(),
                              )),
                          Visibility(
                            visible: !GetPlatform.isWeb,
                            child: ElevatedButton.icon(
                                onPressed: controller.downloadImage,
                                icon: const Icon(Icons.download),
                                label: Text(
                                    StringTranslateExtension("download_image")
                                        .tr())),
                          )
                        ],
                      ),
                      Obx(
                        () => OutputEditor(
                            outputController: TextEditingController(),
                            outputChild: Screenshot(
                              controller: controller.screenshotController,
                              child: Image.memory(
                                controller.imageBytes.value,
                                errorBuilder: ((_, __, ___) =>
                                    const SizedBox.shrink()),
                              ),
                            ),
                            usesCodeControllers: false,
                            isVerticalLayout: false),
                      ),
                    ],
                  )),
            )));
  }
}
