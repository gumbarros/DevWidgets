import 'package:dev_widgets/domain/models/tools/settings/settings_tool.dart';
import 'package:dev_widgets/infrastructure/locale/translations.dart';
import 'package:dev_widgets/infrastructure/global_settings.dart';
import 'package:dev_widgets/presentation/helpers.dart';

import 'package:dev_widgets/presentation/widgets/default_app_bar.dart';
import 'package:dev_widgets/presentation/widgets/io_editor/themes.dart';
import 'package:dev_widgets/src/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({Key? key}) : super(key: key);

  List<DropdownMenuItem<String>> getLanguageDropdownMenuItems() {
    return DevWidgetsTranslations.supportedLocales
        .map((l) => DropdownMenuItem(
              value: l.localeKey,
              child: Text(l.name),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> getTextEditorThemeDropdownMenuItems() {
    return textEditorThemes.entries
        .map((e) => DropdownMenuItem(
              value: e.key,
              child: Text(e.key),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> getTextEditorFontFamilyDropdownMenuItems() {
    return supportedFontFamilies
        .map((family) => DropdownMenuItem(
              value: family,
              child: Text(family),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context, ref) {
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
                        onChanged: (v) {},
                        items: getLanguageDropdownMenuItems()),
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
                    actionWidget: Consumer(
                      builder: (context, ref, child) =>
                          DropdownButton<ThemeMode>(
                              value: ref.watch(settingsProvider).themeMode,
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
                              onChanged: (value) {
                                ref
                                    .read(settingsProvider.notifier)
                                    .setThemeMode(value ?? ThemeMode.system);
                              }),
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
                    actionWidget: Switch(
                      onChanged: (_) {},
                      value: false,
                    ),
                  ),
                  Visibility(
                    visible: true,
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
                      actionWidget: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var variant in yaruVariantList)
                            YaruColorDisk(
                              onPressed: () {},
                              color: variant.color,
                              selected: false,
                            ),
                        ],
                      ),
                    ),
                  ),
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
                    actionWidget: DropdownButton<String?>(
                        value: "vs",
                        items: getTextEditorThemeDropdownMenuItems(),
                        onChanged: (_) {}),
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
                          controller: TextEditingController(text: "18"),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          onChanged: (value) {
                            if (value.isNotEmpty) {}
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
                    actionWidget: DropdownButton<String?>(
                        value: "Hack",
                        items: getTextEditorFontFamilyDropdownMenuItems(),
                        onChanged: (_) {}),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
