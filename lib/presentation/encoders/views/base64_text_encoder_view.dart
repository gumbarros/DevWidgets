import 'package:devtoys/domain/models/tools/encoders/base64_encoding_type.dart';
import 'package:devtoys/domain/models/tools/encoders/encode_conversion_mode.dart';
import 'package:devtoys/presentation/encoders/controllers/base64_text_encoder_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/helpers.dart';
import 'package:devtoys/presentation/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class Base64TextEncoderView extends GetView<Base64TextEncoderController> {
  const Base64TextEncoderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.homeTitle),
        body: Container(
          height: Get.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(headline: "configuration".tr, children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: Icon(Icons.compare_arrows_sharp),
                    trailingWidget: Padding(
                      child: ListTile(
                          title: Text("conversion".tr),
                          subtitle: Text("conversion_mode".tr)),
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    actionWidget: Obx(
                      () => DropdownButton<EncodeConversionMode>(
                          value: controller.conversionMode.value,
                          items: getDropdownMenuItems<EncodeConversionMode>(
                              EncodeConversionMode.values),
                          onChanged: (selected) {
                            controller.conversionMode.value = selected;
                            controller.update();
                          }),
                    ),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: Icon(Icons.grid_3x3),
                    trailingWidget: Padding(
                      child: ListTile(
                          title: Text("encoding".tr),
                          subtitle: Text("encoding_description".tr)),
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    actionWidget: Obx(
                      () => DropdownButton<Base64EncodingType>(
                          value: controller.encodingType.value,
                          items: getDropdownMenuItems<Base64EncodingType>(
                              Base64EncodingType.values),
                          onChanged: (selected) {
                            controller.encodingType.value = selected;
                            controller.update();
                          }),
                    ),
                  )
                ]),
              ),
              Container(
                  height: Get.height / 1.2,
                  child: IOEditor(
                    inputController: controller.inputController,
                    usesCodeControllers: false,
                    outputController: controller.outputController,
                    isVerticalLayout: true,
                  )),
            ],
          ),
        ));
  }
}
