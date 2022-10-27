import 'package:dev_widgets/src/models/tools/encoders/encode_conversion_mode.dart';
import 'package:dev_widgets/presentation/encoders/controllers/html_encoder_controller.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class HTMLEncoderView extends GetView<HTMLEncoderController> {
  const HTMLEncoderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.homeTitle),
        body: SizedBox(
          height: Get.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(headline: "configuration".tr, children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.compare_arrows_sharp),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ListTile(
                          title: Text("conversion".tr),
                          subtitle: Text("conversion_mode".tr)),
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
                  )
                ]),
              ),
              SizedBox(
                  height: Get.height / 1.2,
                  child: IOEditor(
                    inputController: controller.inputController,
                    outputController: controller.outputController,
                    isVerticalLayout: true,
                  )),
            ],
          ),
        ));
  }
}
