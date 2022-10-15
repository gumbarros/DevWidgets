import 'package:devtoys/presentation/encoders/controllers/base64_image_encoder_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/widgets/io_editor/io_editor.dart';
import 'package:devtoys/presentation/widgets/io_editor/io_toolbar.dart';
import 'package:devtoys/presentation/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class Base64ImageEncoderView extends GetView<Base64ImageEncoderController> {
  const Base64ImageEncoderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.homeTitle),
        body: Container(
            height: Get.height - kToolbarHeight,
            child: Container(
              height: Get.height / 1.2,
              child: IOEditor(
                  usesCodeControllers: false,
                  inputController: controller.inputController,
                  outputChild: Column(
                    children: [
                      IOToolbar(
                        title: "output".tr,
                        actions: [
                          ElevatedButton.icon(
                              onPressed: controller.uploadImage,
                              icon: FaIcon(FontAwesomeIcons.image),
                              label: Text("upload_image".tr)),
                          Visibility(
                            visible: !GetPlatform.isWeb,
                            child: ElevatedButton.icon(
                                onPressed: controller.downloadImage,
                                icon: FaIcon(FontAwesomeIcons.download),
                                label: Text("download_image".tr)),
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
                                    SizedBox.shrink()),
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
