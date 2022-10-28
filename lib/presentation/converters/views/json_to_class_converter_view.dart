import 'package:dev_widgets/src/models/tools/converters/programming_language.dart';
import 'package:dev_widgets/presentation/converters/controllers/json_to_class_converter_controller.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class JsonToClassConverterView extends GetView<JsonToClassConverterController> {
  const JsonToClassConverterView({Key? key}) : super(key: key);

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
                          leadingWidget: const Icon(
                            Icons.title,
                            size: 25,
                          ),
                          trailingWidget: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              StringTranslateExtension("class_name").tr(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          actionWidget: Obx(
                            () => SizedBox(
                              width: MediaQuery.of(context).size.width / 10,
                              child: TextFormField(
                                textAlign: TextAlign.end,
                                initialValue: controller.className.value,
                                onChanged: (value) {
                                  controller.className.value = value;
                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          )),
                      YaruRow(
                          enabled: true,
                          leadingWidget: const Icon(
                            Icons.code,
                            size: 25,
                          ),
                          trailingWidget: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              StringTranslateExtension("programming_language")
                                  .tr(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          actionWidget: Obx(
                            () => DropdownButton<ProgrammingLanguage>(
                                value: controller.programmingLanguage.value,
                                items:
                                    getDropdownMenuItems<ProgrammingLanguage>(
                                        ProgrammingLanguage.values),
                                onChanged: (selected) =>
                                    controller.programmingLanguage.value =
                                        selected ?? ProgrammingLanguage.dart),
                          )),
                    ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: IOEditor(
                    inputController: controller.inputController,
                    outputController: controller.outputController,
                  )),
            ],
          ),
        ));
  }
}
