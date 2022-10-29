import 'package:dev_widgets/src/models/tools/generators/uuid/uuid_type.dart';
import 'package:dev_widgets/presentation/generators/controllers/uuid_generator_controller.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class UuidGeneratorView extends GetView<UuidGeneratorController> {
  const UuidGeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.homeTitle),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(
                    headline: StringTranslateExtension("configuration").tr(),
                    children: [
                      YaruRow(
                          enabled: true,
                          leadingWidget: const Icon(Icons.tag),
                          trailingWidget: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ListTile(
                              title: Text(
                                  StringTranslateExtension("uuid_type").tr()),
                              subtitle: Text(StringTranslateExtension(
                                      "uuid_type_description")
                                  .tr()),
                            ),
                          ),
                          actionWidget: Obx(
                            () => DropdownButton<UuidType>(
                                value: controller.uuidType.value,
                                items: getDropdownMenuItems<UuidType>(
                                    UuidType.values),
                                onChanged: (selected) =>
                                    controller.uuidType.value = selected),
                          )),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.remove),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            title:
                                Text(StringTranslateExtension("hyphens").tr()),
                          ),
                        ),
                        actionWidget: Obx(
                          () => Switch(
                            onChanged: (value) =>
                                controller.hyphens.value = value,
                            value: controller.hyphens.value,
                          ),
                        ),
                      ),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.format_color_text),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: ListTile(
                              title: Text(
                                  StringTranslateExtension("uppercase").tr())),
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
                        leadingWidget: const Icon(Icons.format_list_numbered),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                              title: Text(
                                  StringTranslateExtension("amount").tr())),
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
                                  initialValue:
                                      controller.count.value.toString(),
                                  onChanged: (value) {
                                    controller.count.value =
                                        int.tryParse(value) ??
                                            0; // e.g. if empty -> 0
                                  },
                                  decoration: const InputDecoration(
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
                                  child: Text(
                                      StringTranslateExtension("generate")
                                          .tr()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: OutputEditor(
                    outputController: controller.outputController,
                    actionButtons: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.clear),
                        label: Text(StringTranslateExtension("clear").tr()),
                        onPressed: () => controller.outputController.clear(),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
