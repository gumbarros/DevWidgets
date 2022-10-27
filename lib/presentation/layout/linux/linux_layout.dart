import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/global_settings.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:dev_widgets/presentation/layout/linux/linux_menu.dart';
import 'package:dev_widgets/src/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:yaru/yaru.dart';

class LinuxLayout extends ConsumerWidget {
  final Widget? child;
  final List<Tool> tools;

  const LinuxLayout({super.key, required this.child, required this.tools});

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsProvider);

    return YaruTheme(
      data: YaruThemeData(
          highContrast: settings.highContrast,
          variant: settings.yaruVariant,
          themeMode: settings.themeMode),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Obx(
                    () => AnimatedSize(
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        width: isCompactLayout(context) ? 80 : Get.width / 5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 1,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ),
                          ),
                          child: LinuxMenu(
                              tools: tools,
                              selectedToolName:
                                  GlobalSettings.selectedToolName.value),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: child ?? const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
