import 'package:devtoys/domain/models/tools/formatters/indentation.dart';
import 'package:devtoys/presentation/formatters/controllers/json_formatter_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/widgets/helpers.dart';
import 'package:devtoys/presentation/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class JSONFormatterView extends GetView<JSONFormatterController> {
  const JSONFormatterView({Key? key}) : super(key: key);

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
                      leadingWidget: FaIcon(FontAwesomeIcons.rightLong),
                      trailingWidget: Padding(
                        child: Text(
                          "indentation".tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        padding: const EdgeInsets.only(left: 8.0),
                      ),
                      actionWidget: Obx(
                        () => DropdownButton<Indentation>(
                            value: controller.indentation.value,
                            items: Helpers.getDropdownMenuItems<Indentation>(
                                Indentation.values),
                            onChanged: (selected) =>
                                controller.indentation.value = selected),
                      )),
                  YaruRow(
                    enabled: true,
                    leadingWidget: FaIcon(FontAwesomeIcons.arrowDownAZ),
                    trailingWidget: Padding(
                      child: Text(
                        "sort_json_properties_alphabetically".tr,
                        style: TextStyle(fontSize: 18),
                      ),
                      padding: const EdgeInsets.only(left: 8.0),
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
              Container(
                  height: Get.height / 1.2,
                  child: IOEditor(
                    inputController: controller.inputController,
                    outputController: controller.outputController,
                  )),
            ],
          ),
        ));
  }
}
