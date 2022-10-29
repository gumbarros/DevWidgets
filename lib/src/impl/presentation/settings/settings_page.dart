import 'package:dev_widgets/src/models/tools/settings/settings_tool.dart';
import 'package:dev_widgets/src/impl/presentation/helpers.dart';
import 'package:dev_widgets/src/impl/presentation/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/presentation/widgets/io_editor/themes.dart';
import 'package:dev_widgets/src/impl/presentation/settings/settings_provider.dart';
import 'package:dev_widgets/src/supported_locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
        appBar: DefaultAppBar(title: "settings".tr()),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
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
                        "language".tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: DropdownButton<Locale>(
                        value: context.locale,
                        onChanged: (value) {
                          ref.read(settingsProvider.notifier).setLocale(
                              context, value ?? const Locale("en_US"));
                        },
                        items: _getLanguageDropdownMenuItems()),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.dark_mode),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "brightness".tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: DropdownButton<ThemeMode>(
                        value: settings.themeMode,
                        items: [
                          DropdownMenuItem(
                            value: ThemeMode.system,
                            child: Text("system".tr()),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text("light".tr()),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.dark,
                            child: Text("dark".tr()),
                          ),
                        ],
                        onChanged: (value) {
                          ref
                              .read(settingsProvider.notifier)
                              .setThemeMode(value ?? ThemeMode.system);
                        }),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.accessibility),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "high_contrast".tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: Switch(
                      onChanged: (bool value) {
                        ref
                            .read(settingsProvider.notifier)
                            .setHighContrast(value);
                      },
                      value: settings.highContrast,
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
                          "primary_color".tr(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      actionWidget: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var variant in YaruVariant.values)
                            YaruColorDisk(
                              onPressed: () {
                                ref
                                    .read(settingsProvider.notifier)
                                    .setYaruVariant(variant);
                              },
                              color: variant.color,
                              selected: settings.yaruVariant == variant,
                            ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(headline: "text_editor".tr(), children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.edit),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "theme".tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: DropdownButton<String?>(
                        value: settings.textEditorTheme,
                        items: _getTextEditorThemeDropdownMenuItems(),
                        onChanged: (value) {
                          ref
                              .read(settingsProvider.notifier)
                              .setTextEditorTheme(value ?? "vs");
                        }),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.format_size),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "font_size".tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: SizedBox(
                        width: MediaQuery.of(context).size.width / 20,
                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: TextEditingController(
                              text: settings.textEditorFontSize.toString()),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          onChanged: (value) {
                            double? parsedValue = double.tryParse(value);
                            if (parsedValue != null) {
                              ref
                                  .read(settingsProvider.notifier)
                                  .setTextEditorFontSize(parsedValue);
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
                        "font_family".tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: DropdownButton<String?>(
                        value: settings.textEditorFontFamily,
                        items: _getTextEditorFontFamilyDropdownMenuItems(),
                        onChanged: (value) {
                          ref
                              .read(settingsProvider.notifier)
                              .setTextEditorFontFamily(value ?? "Hack");
                        }),
                  )
                ]),
              ),
            ],
          ),
        ));
  }

  List<DropdownMenuItem<Locale>> _getLanguageDropdownMenuItems() {
    return supportedLocales
        .map((l) => DropdownMenuItem(
              value: l.locale,
              child: Text(l.name),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _getTextEditorThemeDropdownMenuItems() {
    return textEditorThemes.entries
        .map((e) => DropdownMenuItem(
              value: e.key,
              child: Text(e.key),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _getTextEditorFontFamilyDropdownMenuItems() {
    return supportedFontFamilies
        .map((family) => DropdownMenuItem(
              value: family,
              child: Text(family),
            ))
        .toList();
  }
}
