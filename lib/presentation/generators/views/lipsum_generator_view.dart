import 'package:dev_widgets/src/models/tools/generators/lipsum/lipsum_type.dart';
import 'package:dev_widgets/presentation/generators/controllers/lipsum_generator_controller.dart';
import 'package:dev_widgets/src/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/helpers.dart';
import 'package:dev_widgets/src/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class LipsumGeneratorView extends GetView<LipsumGeneratorController> {
  const LipsumGeneratorView({Key? key}) : super(key: key);

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
                          leadingWidget: const Icon(Icons.width_normal),
                          trailingWidget: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ListTile(
                                title: Text(StringTranslateExtension(
                                        "lipsum_generator_mode")
                                    .tr()),
                                subtitle: Text(StringTranslateExtension(
                                        "lipsum_generator_mode_description")
                                    .tr())),
                          ),
                          actionWidget: Obx(
                            () => DropdownButton<LipsumType>(
                                value: controller.lipsumType.value,
                                items: getDropdownMenuItems<LipsumType>(
                                    LipsumType.values),
                                onChanged: (selected) =>
                                    controller.lipsumType.value = selected),
                          )),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.fork_right),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            title: Text(
                                StringTranslateExtension("lipsum_start").tr()),
                          ),
                        ),
                        actionWidget: Obx(
                          () => Switch(
                            onChanged: (value) =>
                                controller.startWithLorem.value = value,
                            value: controller.startWithLorem.value,
                          ),
                        ),
                      ),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.tag),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            title:
                                Text(StringTranslateExtension("amount").tr()),
                            subtitle: Text(StringTranslateExtension(
                                    "lipsum_amount_description")
                                .tr()),
                          ),
                        ),
                        actionWidget: Obx(
                          () => Flexible(
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
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: OutputEditor(
                    outputController: controller.outputController,
                  )),
            ],
          ),
        ));
  }
}
