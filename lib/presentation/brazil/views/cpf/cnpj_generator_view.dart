import 'package:dev_widgets/presentation/brazil/controllers/cnpj_generator_controller.dart';
import 'package:dev_widgets/presentation/widgets/default_app_bar.dart';
import 'package:dev_widgets/presentation/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class CnpjGeneratorView extends GetView<CnpjGeneratorController> {
  const CnpjGeneratorView({Key? key}) : super(key: key);

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
                    leadingWidget: const Icon(Icons.more_horiz),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ListTile(title: Text("cnpj_format".tr)),
                    ),
                    actionWidget: Obx(
                      () => Switch(
                        onChanged: (value) => controller.format.value = value,
                        value: controller.format.value,
                      ),
                    ),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.format_list_numbered),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ListTile(title: Text("amount".tr)),
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
                                controller.count.value =
                                    int.tryParse(value) ?? 0;
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
                              onPressed: controller.generateCpfs,
                              child: Text("generate".tr),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                  height: Get.height / 1.2,
                  child: OutputEditor(
                    outputController: controller.generatorOutputController,
                    usesCodeControllers: false,
                    actionButtons: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.clear),
                        label: Text("clear".tr),
                        onPressed: () =>
                            controller.generatorOutputController.clear(),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
