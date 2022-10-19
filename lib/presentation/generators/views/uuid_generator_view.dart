import 'package:devtoys/domain/models/tools/generators/uuid_type.dart';
import 'package:devtoys/presentation/generators/controllers/uuid_generator_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/helpers.dart';
import 'package:devtoys/presentation/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class UuidGeneratorView extends GetView<UuidGeneratorController> {
  const UuidGeneratorView({Key? key}) : super(key: key);

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
                      leadingWidget: Icon(Icons.tag),
                      trailingWidget: Padding(
                        child: ListTile(
                          title: Text("uuid_type".tr),
                          subtitle: Text("uuid_type_description".tr),
                        ),
                        padding: const EdgeInsets.only(left: 8.0),
                      ),
                      actionWidget: Obx(
                        () => DropdownButton<UuidType>(
                            value: controller.uuidType.value,
                            items:
                                getDropdownMenuItems<UuidType>(UuidType.values),
                            onChanged: (selected) =>
                                controller.uuidType.value = selected),
                      )),
                  YaruRow(
                    enabled: true,
                    leadingWidget: Icon(Icons.remove),
                    trailingWidget: Padding(
                      child: ListTile(
                        title: Text("hyphens".tr),
                      ),
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    actionWidget: Obx(
                      () => Switch(
                        onChanged: (value) => controller.hyphens.value = value,
                        value: controller.hyphens.value,
                      ),
                    ),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: Icon(Icons.format_color_text),
                    trailingWidget: Padding(
                      child: ListTile(title: Text("uppercase".tr)),
                      padding: const EdgeInsets.only(left: 2.0),
                    ),
                    actionWidget: Obx(
                      () => Switch(
                        onChanged: (value) =>
                            controller.uppercase.value = value,
                        value: controller.uppercase.value,
                      ),
                    ),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: Icon(Icons.format_list_numbered),
                    trailingWidget: Padding(
                      child: ListTile(title: Text("amount".tr)),
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    actionWidget: Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.end,
                              initialValue: controller.count.value.toString(),
                              onChanged: (value) {
                                controller.count.value = int.tryParse(value) ??
                                    0; // e.g. if empty -> 0
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () => controller.generateUuid(),
                              child: Text("generate".tr),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                  height: Get.height / 1.2,
                  child: OutputEditor(
                    outputController: controller.outputController,
                    actionButtons: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.clear),
                        label: Text("clear".tr),
                        onPressed: () => controller.outputController.clear(),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
