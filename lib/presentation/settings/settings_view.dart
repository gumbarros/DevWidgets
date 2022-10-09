import 'package:devtoys/domain/models/tools/settings/settings_tool.dart';
import 'package:devtoys/infrastructure/locale/translations.dart';
import 'package:devtoys/presentation/global_variables.dart';
import 'package:devtoys/presentation/settings/settings_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: SettingsTool().homeTitle),
        body: Container(
          height: Get.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: FaIcon(FontAwesomeIcons.globe),
                    trailingWidget: Padding(
                      child: Text(
                        "language".tr,
                        style: TextStyle(fontSize: 18),
                      ),
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    actionWidget: DropdownButton<String>(
                        value: DevToysTranslations.supportedLocales.any((e) =>
                                e.locale.toString() == Get.locale.toString())
                            ? Get.locale.toString()
                            : "en_US",
                        items: controller.getLanguageDropdownMenuItems(),
                        onChanged: controller.updateLocale),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: FaIcon(FontAwesomeIcons.moon),
                    trailingWidget: Padding(
                      child: Text(
                        "brightness".tr,
                        style: TextStyle(fontSize: 18),
                      ),
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    actionWidget: Obx(
                      () => DropdownButton<ThemeMode>(
                          value: GlobalVariables.themeMode.value,
                          items: [
                            DropdownMenuItem(
                              child: Text("system".tr),
                              value: ThemeMode.system,
                            ),
                            DropdownMenuItem(
                              child: Text("light".tr),
                              value: ThemeMode.light,
                            ),
                            DropdownMenuItem(
                              child: Text("dark".tr),
                              value: ThemeMode.dark,
                            ),
                          ],
                          onChanged: controller.updateThemeMode),
                    ),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: FaIcon(FontAwesomeIcons.brush),
                    trailingWidget: Padding(
                      child: Text(
                        "primary_color".tr,
                        style: TextStyle(fontSize: 18),
                      ),
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    actionWidget: Obx(
                      () => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var variant in yaruVariantList)
                            YaruColorDisk(
                              onPressed: () => controller.updateYaruVariant(variant),
                              color: variant.color,
                              selected:
                                  GlobalVariables.yaruVariant.value == variant,
                            ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
