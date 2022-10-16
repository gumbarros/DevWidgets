import 'package:devtoys/domain/models/tools/converters/json_yaml_conversion_type.dart';
import 'package:devtoys/domain/models/tools/formatters/indentation.dart';
import 'package:devtoys/presentation/converters/controllers/json_yaml_converter_controller.dart';
import 'package:devtoys/presentation/helpers.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class JsonYamlConverterView extends GetView<JsonYamlConverterController> {
  const JsonYamlConverterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.homeTitle),
        body: Container(
          height: Get.height - kToolbarHeight,
          child: Obx(
            () => ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: YaruSection(headline: "configuration".tr, children: [
                    YaruRow(
                      enabled: true,
                      leadingWidget: Icon(
                        Icons.data_array,
                        size: 25,
                      ),
                      trailingWidget: Padding(
                        child: Text(
                          "conversion_type".tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        padding: const EdgeInsets.only(left: 8.0),
                      ),
                      actionWidget: DropdownButton<JsonYamlConversionType>(
                          value: controller.conversionType.value,
                          items: getDropdownMenuItems<JsonYamlConversionType>(
                              JsonYamlConversionType.values),
                          onChanged: (selected) =>
                              controller.conversionType.value = selected!),
                    ),
                    Visibility(
                        visible: controller.conversionType.value ==
                            JsonYamlConversionType.yamlToJson,
                        child: Column(children: [
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
                                    items: getDropdownMenuItems<Indentation>(
                                        Indentation.values),
                                    onChanged: (selected) => controller
                                        .indentation.value = selected),
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
                        ]))
                  ]),
                ),
                Container(
                    height: Get.height / 1.2,
                    child: controller.conversionType.value ==
                            JsonYamlConversionType.yamlToJson
                        ? IOEditor(
                            inputController:
                                controller.yamlToJsonInputController,
                            outputController:
                                controller.yamlToJsonOutputController,
                          )
                        : Container(
                            //I don't know why this needs a Container to work, maybe I need to open a issue at Flutter.
                            child: IOEditor(
                              inputController:
                                  controller.jsonToYamlInputController,
                              outputController:
                                  controller.jsonToYamlOutputController,
                            ),
                          )),
              ],
            ),
          ),
        ));
  }
}
