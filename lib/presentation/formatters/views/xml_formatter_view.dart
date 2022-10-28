import 'package:dev_widgets/src/models/tools/formatters/indentation.dart';
import 'package:dev_widgets/presentation/formatters/controllers/xml_formatter_controller.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class XMLFormatterView extends GetView<XMLFormatterController> {
  const XMLFormatterView({Key? key}) : super(key: key);

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
                          ))
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
