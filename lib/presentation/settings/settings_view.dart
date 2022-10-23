import 'package:dev_widgets/domain/models/tools/settings/settings_tool.dart';
import 'package:dev_widgets/infrastructure/locale/translations.dart';
import 'package:dev_widgets/infrastructure/global_settings.dart';
import 'package:dev_widgets/presentation/settings/settings_controller.dart';
import 'package:dev_widgets/presentation/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: SettingsTool().homeTitle),
        body: SizedBox(
          height: Get.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.public),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "language".tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: DropdownButton<String>(
                        value: DevWidgetsTranslations.supportedLocales.any(
                                (e) =>
                                    e.localeKey.toString() ==
                                    Get.locale.toString())
                            ? Get.locale.toString()
                            : "en_US",
                        items: controller.getLanguageDropdownMenuItems(),
                        onChanged: controller.updateLocale),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.dark_mode),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "brightness".tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: Obx(
                      () => DropdownButton<ThemeMode>(
                          value: controller.getThemeMode(),
                          items: [
                            DropdownMenuItem(
                              value: ThemeMode.system,
                              child: Text("system".tr),
                            ),
                            DropdownMenuItem(
                              value: ThemeMode.light,
                              child: Text("light".tr),
                            ),
                            DropdownMenuItem(
                              value: ThemeMode.dark,
                              child: Text("dark".tr),
                            ),
                          ],
                          onChanged: controller.setThemeMode),
                    ),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.accessibility),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "high_contrast".tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: Obx(
                      () => Switch(
                        onChanged: controller.setHighContrast,
                        value: controller.getHighContrast(),
                      ),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: !controller.getHighContrast(),
                      child: YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.brush),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "primary_color".tr,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        actionWidget: Obx(
                          () => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var variant in yaruVariantList)
                                YaruColorDisk(
                                  onPressed: () =>
                                      controller.setYaruVariant(variant),
                                  color: variant.color,
                                  selected:
                                      controller.getYaruVariant() == variant,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(headline: "text_editor".tr, children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.edit),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "theme".tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: Obx(
                      () => DropdownButton<String?>(
                          value: controller.getTextEditorTheme(),
                          items:
                              controller.getTextEditorThemeDropdownMenuItems(),
                          onChanged: controller.setTextEditorTheme),
                    ),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.format_size),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "font_size".tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: SizedBox(
                        width: Get.width / 20,
                        height: Get.height / 20,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: TextEditingController(
                              text: controller
                                  .getTextEditorFontSize()
                                  .toString()),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.setTextEditorFontSize(
                                  double.tryParse(value));
                            }
                          },
                        )),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.house),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "font_family".tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: Obx(
                      () => DropdownButton<String?>(
                          value: controller.getTextEditorFontFamily(),
                          items: controller
                              .getTextEditorFontFamilyDropdownMenuItems(),
                          onChanged: controller.setTextEditorFontFamily),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
