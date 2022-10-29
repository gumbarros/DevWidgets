import 'package:dev_widgets/src/models/tools/formatters/indentation.dart';
import 'package:dev_widgets/presentation/formatters/controllers/json_formatter_controller.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class JsonFormatterView extends GetView<JsonFormatterController> {
  const JsonFormatterView({Key? key}) : super(key: key);

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
                          leadingWidget: const Icon(Icons.arrow_right_alt),
                          trailingWidget: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              StringTranslateExtension("indentation").tr(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          actionWidget: Obx(
                            () => DropdownButton<Indentation>(
                                value: controller.indentation.value,
                                items: getDropdownMenuItems<Indentation>(
                                    Indentation.values),
                                onChanged: (selected) =>
                                    controller.indentation.value = selected),
                          )),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.sort_by_alpha),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            StringTranslateExtension(
                                    "sort_json_properties_alphabetically")
                                .tr(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        actionWidget: Obx(
                          () => Switch(
                            onChanged: (value) =>
                                controller.sortAlphabetically.value = value,
                            value: controller.sortAlphabetically.value,
                          ),
                        ),
                      )
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
