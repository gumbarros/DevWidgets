import 'package:dev_widgets/src/models/tools/text/text_escape/escape_conversion_mode.dart';
import 'package:dev_widgets/presentation/text/controllers/text_escape_controller.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class TextEscapeView extends GetView<TextEscapeController> {
  const TextEscapeView({Key? key}) : super(key: key);

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
                        leadingWidget: const Icon(Icons.compare_arrows_sharp),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                              title: Text(
                                  StringTranslateExtension("conversion").tr()),
                              subtitle: Text(StringTranslateExtension(
                                      "conversion_description")
                                  .tr())),
                        ),
                        actionWidget: Obx(
                          () => DropdownButton<EscapeConversionMode>(
                              value: controller.conversionMode.value,
                              items: getDropdownMenuItems<EscapeConversionMode>(
                                  EscapeConversionMode.values),
                              onChanged: (selected) {
                                controller.conversionMode.value = selected;
                                controller.update();
                              }),
                        ),
                      )
                    ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: IOEditor(
                    usesCodeControllers: false,
                    inputController: controller.inputController,
                    outputController: controller.outputController,
                    isVerticalLayout: true,
                  )),
            ],
          ),
        ));
  }
}
